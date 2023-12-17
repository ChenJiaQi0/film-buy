<template>
	<view class="container container27315" v-if="data">
		<view class="flex flex-wrap diygw-col-24 justify-around items-start flex-clz"
			style="background-color: rgba(219, 95, 84, 0.8);color: white;">
			<view class="flex flex-wrap diygw-col-20 items-center flex4-clz">
				<view class="diygw-col-24 text6-clz" style="font-size: 30rpx;">
					{{data.brandName}}——({{data.order.cinemaName}})
				</view>
			</view>
		</view>
		<view class="flex flex-wrap diygw-col-24 flex3-clz justify-between">
			<view class="left_bottom" style="margin-top: 10px;margin-bottom: 10px;font-size: 30rpx;">
				<text>{{data.order.filmName}} {{data.order.count}}张</text>
				<view>{{data.order.date}}</view>
				<view>{{data.seatMsg}}</view>
			</view>
			<view>
				<image style="width: 100px;height: 100px;" mode="aspectFit" :src="data.filmImg"></image>
			</view>
		</view>
		<view class="flex diygw-col-24 line-clz">
			<view class="diygw-pzx" style="border-bottom: 1px solid #cccccc"></view>
		</view>
		<view class="flex flex-wrap diygw-col-24 flex-direction-column flex39-clz">
			<view class="diygw-col-24 text34-clz"> 请到影院内自助取票机或影院前台取票 </view>
			<image src="/static/code.jpg" class="response diygw-col-24 image1-clz" mode="widthFix"></image>
			<view class="diygw-col-24 text1-clz"> 验证码 8888888888 </view>
			<button class="cu-btn round bg-red" @tap="cosume">确认消费</button>
		</view>
		<view style="text-align: center;">
			<text class="icon icon-clz diy-icon-safe"></text>
			<text class="text-clz"> FILMBUY官方认证 </text>
		</view>
	</view>
</template>

<script>
	import {
		ORDER_CONSUME
	} from '@/utils/api.js'
	import {
		request
	} from '@/utils/request.js'
	export default {
		data() {
			return {
				data: null,
			};
		},
		onShow() {},
		onLoad(option) {
			this.data = JSON.parse(option.data);
			console.log(this.data);
		},
		methods: {
			async cosume() {
				const res = await request(ORDER_CONSUME + '/' + this.data.order.id, 'POST');
				if (res.code === 200) {
					uni.showToast({
						icon: 'success',
						title: '消费成功'
					})
					setTimeout(function() {
						uni.navigateBack()
					}, 1000)
				} else {
					uni.showToast({
						icon: 'error',
						title: res.msg || '网络异常，消费失败'
					})
				}
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