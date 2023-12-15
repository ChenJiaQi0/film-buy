<template>
	<view>
		<view class="amount">
			<text>￥</text>{{dataInfo.price}}
		</view>
		<view class="pay-tips">支付金额</view>

		<view class="pay-info-item">
			<view class="film-title">{{dataInfo.movie_info.movie_name}}</view>
			<!-- <view class="film-text">5月29日 2021-09-29 11:00:00~2021-09-29</view> -->
			<view class="film-text">{{dataInfo.movie_info.cinemaName}}</view>
			<view class="film-text">{{dataInfo.movie_info.cinemaAddress}}</view>
			<view class="film-text">{{dataInfo.movie_info.hallName}}</view>
			<view class="film-text">
				<text v-for="(value,index) in dataInfo.showInfor" :key="index">{{value.seatName}},</text>
			</view>
		</view>

		<view class="pay-item">
			<view class="item-left">
				<image src="../../static/image/icon_wechat.png"></image>
				<text>微信支付</text>
			</view>
			<image src="../../static/image/icon-choice-yes.png" class="pay-check"></image>
		</view>

		<view class="pay-btns">确认支付</view>

	</view>
</template>

<script>
	// import {filmPay,getOrderInfo} from "@/api/film.js"
	// import {checkUser,filmH5Pay} from "@/api/api.js"
	export default {
		data() {
			return {
				dataInfo: {
					price: 45,
					movie_info: {
						movie_name: "长津湖之水门桥",
						cinemaAddress: "丹东市东港市育才街(近教育局)(东港市联营胡同北0.1米)",
						cinemaId: 25249,
						cinemaName: "博纳电影院线·星鑫古汉店",
					},
					showInfor: [{
							seatName: '6排7座'
						},
						{
							seatName: '6排6座'
						}
					]
				}
			}
		},
		onLoad(opt) {
			// this.getData(opt.orderNo)
		},
		methods: {

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