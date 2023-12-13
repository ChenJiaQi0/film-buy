<template>
	<view v-if="orderList.length > 0">
		<cc-couponList :colors="colors" :orderList="orderList" @itemClick="jumpNext"></cc-couponList>
	</view>
	<view v-else style="text-align: center;color: red;width: 100%;">该账户暂未消费记录订单...</view>
</template>

<script>
	import {
		request
	} from '@/utils/request.js';
	import {
		ORDER_LIST
	} from '@/utils/api.js'
	export default {
		data() {
			return {
				colors: '#e54d42',
				orderList: []
			};
		},

		/**
		 * 生命周期函数--监听页面加载
		 */
		onLoad: function(options) {
			this.getOrderList();

		},

		/**
		 * 生命周期函数--监听页面显示
		 */
		onShow() {
			this.getOrderList();
		},

		methods: {
			jumpNext(item) {

				uni.showModal({
					title: '点击优惠券条目',
					content: '点击优惠券条目 = ' + JSON.stringify(item)
				})
			},
			getOrderList() {
				const _this = this
				uni.request({
					url: ORDER_LIST, //仅为示例，并非真实接口地址。
					header: {
						'token': uni.getStorageSync('token') != '' ? uni.getStorageSync('token') : 'no-token',
					},
					success: (res) => {
						if (res.data.code != 200) {
							uni.showModal({
								title: '错误',
								content: res.data.msg != null ? res.data.msg : '用户未登录，请先登录！',
								success: function(res) {
									_this.orderList = []
									if (res.confirm) {
										uni.navigateTo({
											url: '/pages/user/login'
										})
									}
								}

							})
						} else {
							_this.orderList = res.data.data;
						}

					}
				});
			}
		}
	};
</script>

<style lang="scss" scoped>
</style>