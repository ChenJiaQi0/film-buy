<template>
	<view>
		<view class="amount">
			<text>￥</text>{{data.price}}
		</view>
		<view class="pay-tips">支付金额</view>

		<view class="pay-info-item" v-if="data">
			<view class="film-title">{{data.filmName}}</view>
			<!-- <view class="film-text">5月29日 2021-09-29 11:00:00~2021-09-29</view> -->
			<view class="film-text">{{data.cinemaName}}</view>
			<view class="film-text">{{data.info}}</view>
			<view class="film-text">
				<text v-for="(value,index) in seatInfo" :key="index">{{value.RowNum}}排{{value.ColumnNum}}座|</text>
			</view>
		</view>

		<view class="pay-item">
			<view class="item-left">
				<image src="../../static/image/icon_wechat.png"></image>
				<text>微信支付</text>
			</view>
			<image src="../../static/image/icon-choice-yes.png" class="pay-check"></image>
		</view>

		<view class="pay-btns" @tap="pay">确认支付</view>

	</view>
</template>

<script>
	import {
		request
	} from '@/utils/request.js'
	import {
		ORDER_PAY
	} from '@/utils/api.js'
	export default {
		data() {
			return {
				data: null,
				seatInfo: [],
			}
		},
		onLoad(opt) {
			this.data = JSON.parse(opt.data);
			this.data.seat = this.data.seat.toString();
			this.seatInfo = JSON.parse(opt.seatInfo);
			console.log(this.data);
		},
		methods: {
			pay() {
				const _this = this;
				uni.showLoading({
					title: '提交订单中'
				})
				setTimeout(function() {
					request(ORDER_PAY, 'POST', _this.data).then((res) => {
						if (res.code === 200) {
							uni.showToast({
								title: '支付成功!',
								icon: 'success'
							})
							setTimeout(function() {
								uni.switchTab({
									url: '/pages/order/index'
								})
							}, 1000)
						} else {
							uni.showToast({
								title: res.msg || '座位可能丢失了',
								icon: 'error'
							})
						}
					})
				}, 1000);
				setTimeout(function() {
					uni.hideLoading();
				}, 2000);
			}
		}
	}
</script>

<style lang="less">
	page {
		background-color: #F4F5F7;
	}

	.amount {
		text-align: center;
		padding-top: 80rpx;
		color: #FE602B;
		font-size: 72rpx;
		font-weight: 550;

		text {
			font-size: 36rpx;
		}
	}

	.pay-tips {
		text-align: center;
		color: #636775;
		font-size: 28rpx;
		margin-top: 6rpx;
	}

	.pay-info-item {
		margin: 70rpx 32rpx 0rpx 32rpx;
		background-color: #FFFFFF;
		border-radius: 20rpx;
		padding: 40rpx 32rpx;

		.film-title {
			color: #2D3039;
			font-size: 36rpx;
			font-weight: 550;
			padding-bottom: 8rpx;
		}

		.film-text {
			margin-top: 12rpx;
			color: #636775;
			font-size: 28rpx;
		}
	}

	.pay-item {
		margin: 20rpx 25rpx 0rpx 25rpx;
		background-color: #FFFFFF;
		border-radius: 16rpx;
		padding: 26rpx 32rpx;
		display: flex;
		align-items: center;

		.item-left {
			display: flex;
			align-items: center;

			image {
				width: 48rpx;
				height: 48rpx;
			}

			text {
				color: #2D3039;
				font-size: 28rpx;
				margin-left: 20rpx;
			}
		}

		.pay-check {
			margin-left: auto;
			width: 36rpx;
			height: 36rpx;
		}
	}

	.pay-btns {
		position: fixed;
		bottom: 50rpx;
		left: 32rpx;
		right: 32rpx;
		height: 100rpx;
		line-height: 100rpx;
		text-align: center;
		background-color: #FE602B;
		border-radius: 50rpx;
		color: #FFFFFF;
		font-size: 36rpx;
		font-weight: 550;
	}
</style>