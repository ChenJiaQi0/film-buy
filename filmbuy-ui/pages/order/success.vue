<template>
	<view class="container container27315">
		
		<view class="flex flex-wrap diygw-col-24 flex-direction-column flex39-clz">
			<image src="../../static/image/gou.png" class="response" mode="widthFix" style="width: 200px;height: 200px;margin: 0 auto;"></image>
			<view class="diygw-col-24 text34-clz" style="font-size: 50px;color: #089FEE;"> 支付成功 </view>
			<view class="diygw-col-24 text34-clz">感谢您的支持，您的订单已处理完成</view>
			<!-- <image src="http://localhost:8003/qrCode?codeContent=http://baidu.com"
				class="response diygw-col-24 image1-clz" mode="widthFix"></image> -->
			<view class="diygw-col-24 text1-clz">
				<button class="diygw-col-12 cu-btn round" style="color: #089FEE;font-size: 15px;background: none;" @tap="goIndex">返回首页</button>
				<button class="diygw-col-12 cu-btn round" style="color: white;font-size: 15px;background: #089FEE;" @tap="goOrder">查看订单详情</button>
			</view>
			<!-- <button class="cu-btn round bg-red" @tap="cosume">确认消费</button> -->
		</view>
		<!-- <view style="text-align: center;">
			<text class="icon icon-clz diy-icon-safe"></text>
			<text class="text-clz"> FILMB官方认证 </text>
		</view> -->
	</view>
</template>

<script>
	export default {
		data() {
			return {
				
			};
		},
		methods: {
			goIndex() {
				uni.switchTab({
					url: '/pages/film/index'
				})
			},
			goOrder() {
				uni.switchTab({
					url: '/pages/order/index'
				})
			}
		}
	};
</script>

<style lang="scss" scoped>
	.left_bottom {
		font-size: 24upx;
		font-weight: bold;
		color: #333;
		height: 60upx;
		line-height: 60upx;
	}

	.flex-clz {
		padding-top: 40rpx;
		padding-left: 0rpx;
		padding-bottom: 0rpx;
		height: 160rpx;
		padding-right: 0rpx;
	}

	.flex4-clz {
		text-align: left;
	}

	.text6-clz {
		font-weight: bold;
	}

	.flex3-clz {
		padding-top: 20rpx;
		border-bottom-left-radius: 30rpx;
		padding-left: 20rpx;
		padding-bottom: 20rpx;
		border-top-right-radius: 30rpx;
		margin-right: 40rpx;
		background-color: #ffffff;
		margin-left: 40rpx;
		overflow: hidden;
		width: calc(100% - 40rpx - 40rpx) !important;
		border-top-left-radius: 30rpx;
		margin-top: -50rpx;
		border-bottom-right-radius: 30rpx;
		margin-bottom: 0rpx;
		padding-right: 20rpx;
	}

	.text3-clz {
		padding-top: 10rpx;
		color: #a0a0a0;
		padding-left: 20rpx;
		padding-bottom: 10rpx;
		padding-right: 20rpx;
	}

	.line-clz {
		padding-top: 0rpx;
		padding-left: 20rpx;
		padding-bottom: 0rpx;
		padding-right: 20rpx;
	}

	.flex39-clz {
		padding-top: 20rpx;
		border-bottom-left-radius: 30rpx;
		padding-left: 20rpx;
		padding-bottom: 20rpx;
		border-top-right-radius: 30rpx;
		margin-right: 40rpx;
		background-color: #ffffff;
		margin-left: 40rpx;
		overflow: hidden;
		width: calc(100% - 40rpx - 40rpx) !important;
		border-top-left-radius: 30rpx;
		margin-top: 30rpx;
		border-bottom-right-radius: 30rpx;
		margin-bottom: 0rpx;
		padding-right: 20rpx;
	}

	.text34-clz {
		padding-top: 20rpx;
		border-bottom-left-radius: 30rpx;
		padding-left: 20rpx;
		padding-bottom: 20rpx;
		border-top-right-radius: 30rpx;
		margin-right: 40rpx;
		background-color: #ffffff;
		margin-left: 40rpx;
		overflow: hidden;
		width: calc(100% - 40rpx - 40rpx) !important;
		border-top-left-radius: 30rpx;
		margin-top: 30rpx;
		border-bottom-right-radius: 30rpx;
		margin-bottom: 0rpx;
		text-align: center;
		padding-right: 20rpx;
	}

	.text1-clz {
		padding-top: 20rpx;
		border-bottom-left-radius: 30rpx;
		padding-left: 20rpx;
		padding-bottom: 20rpx;
		border-top-right-radius: 30rpx;
		margin-right: 40rpx;
		background-color: #ffffff;
		margin-left: 40rpx;
		overflow: hidden;
		width: calc(100% - 40rpx - 40rpx) !important;
		border-top-left-radius: 30rpx;
		margin-top: 30rpx;
		border-bottom-right-radius: 30rpx;
		margin-bottom: 0rpx;
		text-align: center;
		padding-right: 20rpx;
	}

	.flex1-clz {
		text-align: center;
	}

	.icon-clz {
		margin-left: 0rpx;
		margin-top: 0rpx;
		margin-bottom: 0rpx;
		margin-right: 6rpx;
	}

	.icon {
		font-size: 32rpx;
	}

	.text-clz {
		font-weight: bold;
	}

	.container27315 {
		padding-left: 0px;
		padding-right: 0px;
		background-color: #f3f4f6;
	}

	.diy-item-select {
		background-color: inherit;
		color: #07c160;
		background-image: linear-gradient(45deg, #f5fdf9 1%, #ebfdf4 99%);
	}

	.diy-item-remark {
		color: #07c160;
	}

	.container27315 {}
</style>