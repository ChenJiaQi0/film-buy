<template>
	<cc-couponList :colors="colors" :couponList="couponList" @itemClick="jumpNext"></cc-couponList>
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
				couponList: [{
						name: '满105减5',
						dates: '2023-07-09 2023-08-02',
						status: 0,
						money: 105,
						sub: 5
					},
					{
						name: '满200减10',
						dates: '2023-07-19 2023-08-22',
						status: 0,
						money: 200,
						sub: 10
					}, {
						name: '满100减10',
						dates: '2023-05-09 2023-06-02',
						status: 1,
						money: 100,
						sub: 10
					},
					{
						name: '满400减20',
						dates: '2023-04-09 2023-05-08',
						status: 1,
						money: 400,
						sub: 20
					}
				],

			};
		},




		/**
		 * 生命周期函数--监听页面加载
		 */
		onLoad: function(options) {
			this.getOrderList()

		},

		/**
		 * 生命周期函数--监听页面显示
		 */
		onShow: function() {},

		methods: {
			jumpNext(item) {

				uni.showModal({
					title: '点击优惠券条目',
					content: '点击优惠券条目 = ' + JSON.stringify(item)
				})
			},
			getOrderList() {
				uni.request({
					url: ORDER_LIST, //仅为示例，并非真实接口地址。
					header: {
						'token': uni.getStorage({
							key: 'token'
						}) //自定义请求头信息
					},
					success: (res) => {
						console.log(res.data);
					}
				});
			}
		}
	};
</script>

<style lang="scss" scoped>
</style>