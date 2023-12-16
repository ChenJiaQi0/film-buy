<template>
	<view>
		<view v-for="(item, index) in orderList" :key="index" class="coupon_box"
			style="display: flex;justify-content: space-between;">
			<view class="left">
				<view class="left_top" style="border-bottom: 1px solid rgba(0, 0, 0, 0.2);">
					<text class="hui_name">{{item.brandName}}({{item.order.cinemaName}})</text>
					<view class="hui_name" style="float: right;">
						<text v-if="item.order.status === 0">待消费</text>
						<text v-else>已完成</text>
					</view>
				</view>
				<view class="left_bottom" style="margin-top: 10px;margin-bottom: 10px;width: 100%;">
					<text style="font-size: 15px;">{{item.order.filmName}} {{item.order.count}}张</text>
					<button class="cu-btn round sm shadow bg-red" style="float: right;"
						@tap="item.order.status === 1 ? goComment(item.filmId) : showCode(item)">{{item.order.status === 1 ? '评价影片' : '查看二维码'}}</button>
				</view>
				<view>
					<text style="margin-right: 5px;">{{item.order.date}}</text>总价：<text
						style="color: red;">{{item.order.price}}</text>元 <br />
					<text>{{item.seatMsg}}</text>
				</view>
			</view>
			<view style="margin-top: 10px;margin-left: 15px;">
				<image style="width: 100px;height: 100px;" mode="aspectFit" :src="item.filmImg"></image>
			</view>
		</view>
	</view>
</template>


<script>
	export default {
		data() {
			return {};
		},

		components: {},
		props: {
			orderList: {
				type: Array
			}
		},
		methods: {
			goComment(item) {
				this.$emit("goComment", item);
			},
			showCode(item) {
				// this.$emit("showCode", item);
				uni.navigateTo({
					url: '/pages/order/code?data=' + JSON.stringify(item)
				})
			}
		}
	};
</script>

<style scoped lang="scss">
	.coupon_box {

		margin: 28upx 28upx;
		box-shadow: 0upx 0upx 10upx #ddd;
		position: relative;
		border-radius: 10upx;
		overflow: hidden;

	}

	.coupon_box .left {
		width: 70%;
		display: flex;
		align-items: center;
		flex-wrap: wrap;
		padding: 20upx;
		float: left;
	}

	.coupon_box .left .hui {
		width: 40upx;
		height: 40upx;
		font-size: 20upx;
		color: #fff;
		background-color: #EC1818;
		border-radius: 8upx;
		line-height: 40upx;
		text-align: center;
		display: inline-block;
		transform: translateY(-5upx);
	}

	.coupon_box .left .left_top {
		width: 60vw;
		display: block;
		font-size: 26upx;
		font-weight: bold;

	}

	.left_top .hui_name {
		line-height: 60upx;
		height: 60upx;
		margin-left: 20upx;
		display: inline-block;
	}

	.left_bottom {
		font-size: 24upx;
		font-weight: bold;
		color: #333;
		height: 60upx;
		line-height: 60upx;
	}

	.coupon_box .bottom {
		height: 60upx;
		line-height: 60upx;
		display: flex;
		align-content: space-between;
		font-size: 24upx;
		margin-top: 10upx;
	}

	.coupon_box .bottom view {
		margin-right: 20upx;
		color: #888;
		font-weight: bold;
	}

	.ysy {
		width: 80upx;
		height: 80upx;
		position: absolute;
		top: 20upx;
		right: 200upx;
	}
</style>