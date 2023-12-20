<template>
	<view class="container container27315" style="margin-top: 50rpx;margin-left: 10rpx;">
		<view class="flex diygw-col-24 noticebar-clz">
			<diy-noticebar class="flex1 diy-notice-bar" color="#db5f54" bgColor="#fff" leftIcon="diy-icon-notification">
				<block v-slot:content>
					<text class="diy-notice-item"> 客服在线时间9：00——18：00 点击复制电话 </text>
				</block>
			</diy-noticebar>
		</view>
		<view class="diygw-title flex diygw-col-24 title-clz">
			<view class="title font-bold"> <text class="diy-icon-phone"></text> 客服一 </view>
			<view class="more" @tap="sharphe('1111111111')"> 1111111111 </view>
		</view>
		<view class="diygw-title flex diygw-col-24 title4-clz">
			<view class="title font-bold"> <text class="diy-icon-phone"></text> 客服二 </view>
			<view class="more" @tap="sharphe('222222222')"> 222222222 </view>
		</view>
		<view class="diygw-title flex diygw-col-24 title3-clz">
			<view class="title font-bold"> <text class="diy-icon-phone"></text> 客服三 </view>
			<view class="more" @tap="sharphe('333333333')"> 333333333 </view>
		</view>
		<view class="diygw-title flex diygw-col-24 title2-clz">
			<view class="title font-bold"> <text class="diy-icon-phone"></text> 客服四 </view>
			<view class="more" @tap="sharphe('444444444')"> 444444444 </view>
		</view>
		<view class="diygw-title flex diygw-col-24 title1-clz">
			<view class="title font-bold"> <text class="diy-icon-phone"></text> 客服五 </view>
			<view class="more" @tap="sharphe('555555555')"> 555555555 </view>
		</view>
		<view class="version text-grey flex-direction-column flex diygw-col-24 justify-center align-center">
			<view> 有问题也可以发送邮箱给开发人员 </view>
			<view> 3465976682@qq.com </view>
		</view>
		<view class="clearfix"></view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				//用户全局信息
				userInfo: {},
				//页面传参
				globalOption: {},
				//自定义全局变量
				globalData: {}
			};
		},
		onShow() {
			this.setCurrentPage(this);
		},
		onLoad(option) {
			this.setCurrentPage(this);
			if (option) {
				this.setData({
					globalOption: this.getOption(option)
				});
			}

			this.init();
		},
		methods: {
			async init() {},
			sharphe(value) {
				uni.setClipboardData({
					data: value,
					success: function() {
						console.log('success');
						uni.showModal({
							title: '复制成功',
							content: '内容已复制到粘贴板，可前往其他应用粘贴查看。',
							showCancel: false,
							success: function(res) {
								if (res.confirm) {
									//console.log('用户点击确定');
								} else if (res.cancel) {
									//console.log('用户点击取消');
								}
							}
						});
					}
				})
			}
		}
	};
</script>

<style lang="scss" scoped>
	.container27315 {
		padding-left: 0px;
		padding-right: 0px;
	}

	.container27315 {}
</style>