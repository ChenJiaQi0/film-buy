<template>
	<view>
		<view class="cinema-top">
			<view class="tops-item">
				<view class="cinema-info" v-if="data">
					<view class="top-name">{{data.filmName}}</view>
					<view class="list-tel">{{data.cinemaName}}</view>
					<view class="list-tel">{{data.info}}</view>
				</view>
			</view>
		</view>

		<view class="cinema-main">
			<view class="support">
				<image src="../../static/image/moive-no-close.png"></image>
				<text>不支持退票</text>
				<image src="../../static/image/moive-no-close.png" style="margin-left: 60rpx;"></image>
				<text>不支持改签</text>
			</view>

			<view class="seat-item">
				<view class="seat-text">座位</view>
				<view class="seat-val">
					<text v-for="(value,index) in seatInfo" :key="index">{{value.RowNum}}排{{value.ColumnNum}}座|</text>
				</view>
			</view>

			<view class="lines"></view>

			<view class="price-item">
				<view class="pirce-list">
					<view class="pirce-text">市场价</view>
					<view class="pirce-val">¥ {{seatInfo[0].Price}}</view>
				</view>
				<view class="pirce-list">
					<view class="pirce-text">票价合计(共{{data.count}}张）</view>
					<view class="pirce-valss">¥{{data.price}}</view>
				</view>
			</view>
			<view class="lines"></view>

			<view class="ticket-notice">
				<view class="not-text">购票须知</view>
				<view class="not-list">
					<view class="list-num">1、</view>
					<view class="not-conot">根据中国电影发行放映协会通知，影院需实名登记观众信息，以及体温测量，未佩戴口罩以及体温在37.3度以上不得入内。入场前请做好上诉准备，以免影响观影。
					</view>
				</view>
				<view class="not-list">
					<view class="list-num">2、</view>
					<view class="not-conot">特价电影票，购买成功后将<text>不可退款、改签</text>。支付前务必确认影院、影片、场次准备无误。</view>
				</view>
				<view class="not-list">
					<view class="list-num">3、</view>
					<view class="not-conot"><text>出票时间为9:00~23:30</text>,支付完成后20~60分钟完成出票，非出票时间的订单需等待至出票时间方可出票。</view>
				</view>
				<view class="not-list">
					<view class="list-num">4、</view>
					<view class="not-conot">若不能出票或者所选座位已售且不接受座位调整，订单将会在<text>24~72</text>小时内自动退款。</view>
				</view>
			</view>

			<view class="agreement">
				<image src="../../static/image/icon-choice-yes.png"></image>
				<text>我已阅读并同意购票须知</text>
			</view>
		</view>

		<view class="congirm-boom-nav">
			<view class="nav-lefts">
				<text class="shiji">实际付款</text>
				<text class="units">￥</text>
				<text class="shiji-val">{{data.price}}</text>
			</view>
			<view class="go-pay" @click="goPay">去支付</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				data: null,
				seatInfo: [],
			}
		},
		onLoad(opt) {
			this.data = JSON.parse(opt.data);
			this.seatInfo = JSON.parse(opt.seatInfo);
			// console.log(this.data);
			console.log(this.seatInfo);
		},
		methods: {
			goPay() {
				uni.redirectTo({
					url: '/pages/order/pay?data=' + JSON.stringify(this.data) + '&seatInfo=' + JSON.stringify(this
						.seatInfo)
				})

			},
		}
	}
</script>

<style lang="less">
	page {}

	.cinema-top {
		background-color: #636775;
		padding: 32rpx 32rpx 70rpx 32rpx;
		position: relative;

		.tops-item {
			display: flex;
			align-items: center;
			z-index: 9999;
		}

		.cinema-img {
			width: 160rpx;
			height: 222rpx;

			image {
				width: 160rpx;
				height: 222rpx;
				border-radius: 20rpx;
			}
		}

		.cinema-info {
			margin-left: 30rpx;

			.top-name {
				color: #FFFFFF;
				font-size: 32rpx;
				font-weight: 600;
			}

			.list-tel {
				color: #D8D8DD;
				font-size: 24rpx;
				margin-top: 10rpx;
			}
		}
	}

	.cinema-main {
		position: absolute;
		top: 290rpx;
		left: 0;
		right: 0;
		background-color: #FFFFFF;
		border-radius: 30rpx 30rpx 0rpx 0rpx;
		padding-bottom: 120rpx;
	}

	.support {
		margin: 40rpx 32rpx 0rpx 32rpx;
		background-color: #FFEFEE;
		border-radius: 8rpx;
		padding: 22rpx 25rpx;
		display: flex;
		align-items: center;

		image {
			width: 28rpx;
			height: 28rpx;
		}

		text {
			color: #F03D38;
			font-size: 24rpx;
			margin-left: 12rpx;
		}
	}

	.seat-item {
		margin: 50rpx 32rpx 9rpx 32rpx;
		display: flex;
		align-items: center;
		justify-content: space-between;
		font-size: 28rpx;

		.seat-text {
			color: #636775;
		}

		.seat-val {
			color: #2D3039;
		}
	}

	.automatic-item {
		padding: 32rpx;
		display: flex;
		align-items: center;

		.aut-tops {
			display: flex;
			align-items: center;

			image {
				width: 28rpx;
				height: 28rpx;
				margin-left: 16rpx;
			}

			text {
				color: #636775;
				font-size: 28rpx;
			}
		}

		.aut-tips {
			margin-top: 4rpx;
			color: #FE602B;
			font-size: 24rpx;
		}
	}

	.lines {
		height: 20rpx;
		background-color: #F3F4F7;
	}

	.price-item {
		background-color: #FFFFFF;
		padding: 20rpx 32rpx;

		.pirce-list {
			display: flex;
			align-items: center;
			justify-content: space-between;
			padding: 20rpx 0rpx;
			font-size: 28rpx;

			.pirce-text {
				color: #636775;
			}

			.pirce-val {
				color: #2D3039;
			}

			.pirce-vals {
				color: #FE602B;
			}

			.pirce-valss {
				color: #FE602B;
				font-weight: 550;
			}
		}
	}

	.order-phone-item {
		padding: 20rpx 0rpx;
		display: flex;
		align-items: center;
		justify-content: space-between;

		.pho-text {
			color: #636775;
			font-size: 29rpx;
		}

		.phone-tips {
			margin-top: 4rpx;
			color: #A6A8AE;
			font-size: 24rpx;
		}

		.phone-input {
			font-size: 28rpx;
			width: 32%;
		}
	}

	.ticket-notice {
		padding: 40rpx 56rpx 40rpx 32rpx;
		background-color: #FFFFFF;

		.not-text {
			color: #2D3039;
			font-size: 28rpx;
			font-weight: 550;
		}

		.not-list {
			display: flex;
			margin-top: 20rpx;
			color: #636775;
			font-size: 28rpx;

			text {
				color: #F03D38;
				font-weight: 550;
			}
		}
	}

	.agreement {
		display: flex;
		align-items: center;
		background-color: #F2F5FA;
		padding: 24rpx 30rpx;

		image {
			width: 32rpx;
			height: 32rpx;
		}

		text {
			color: #2D3039;
			font-size: 24rpx;
			margin-left: 10rpx;
		}
	}

	.congirm-boom-nav {
		position: fixed;
		bottom: 0;
		left: 0;
		right: 0;
		background-color: #FFFFFF;
		display: flex;
		align-items: center;
		justify-content: space-between;
		height: 120rpx;
		z-index: 9999;
		padding-left: 48rpx;
		padding-right: 40rpx;

		.nav-lefts {
			display: flex;
			align-items: center;

			.shiji {
				color: #636775;
				font-size: 24rpx;
				margin-top: 4rpx;
			}

			.units {
				color: #FE602B;
				font-size: 28rpx;
				font-weight: 550;
				margin-left: 18rpx;
				margin-top: 4rpx;
			}

			.shiji-val {
				color: #FE602B;
				font-size: 42rpx;
				font-weight: 550;
			}
		}

		.go-pay {
			width: 230rpx;
			height: 92rpx;
			text-align: center;
			line-height: 92rpx;
			background-color: #FE602B;
			border-radius: 46rpx;
			color: #FFFFFF;
			font-size: 32rpx;
			font-weight: 600;
		}
	}

	.rule-title {
		text-align: center;
		padding-top: 30rpx;
		color: #292928;
		font-size: 36rpx;
		font-weight: 550;
	}

	.rule-content {
		padding: 35rpx 35rpx 50rpx 35rpx;
		color: #636775;
		font-size: 28rpx;
		line-height: 46rpx;
	}
</style>