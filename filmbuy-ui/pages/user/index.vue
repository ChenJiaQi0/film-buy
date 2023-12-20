<template>
	<view class="container container27315">
		<view class="flex flex-wrap diygw-col-24 flex-direction-column items-center flex7-clz">
			<!-- #ifdef MP-WEIXIN -->
			<view class="flex flex-wrap diygw-col-24 flex-direction-column flex8-clz"> </view>
			<!--  #endif -->
			<image src="/static/image/user.png" class="image3-size diygw-image diygw-col-0 image3-clz" mode="widthFix">
			</image>
			<view class="diygw-col-0 text1-clz" v-if="userInfo.username != null"> {{userInfo.username}} </view>
			<view class="diygw-col-0 text1-clz" v-else>
				<button @tap="navigateTo" data-type="page" data-url="/pages/user/login"
					class="cu-btn round bg-red">点击登录</button>
			</view>
			<view class="flex diygw-col-24 justify-around flex-wrap flex9-clz">
				<view class="flex flex-wrap diygw-col-8 flex-direction-column items-center flex19-clz">
					<view class="diygw-col-0 text20-clz diygw-text-lg">
						{{userInfo.balance != null ? userInfo.balance : '0'}}
					</view>
					<view class="diygw-col-0"> 账户余额 </view>
				</view>
			</view>
		</view>
		<view class="flex flex-wrap diygw-col-24 flex-direction-column flex4-clz">
			<view class="diygw-col-0 text3-clz"> 我的订单 </view>
			<view class="flex diygw-col-24">
				<view class="diygw-grid col-4" style="display: flex;justify-content: space-around;">
					<view class="diygw-grid-item">
						<view class="diygw-grid-inner grid1-item-clz" @tap="goOrder">
							<view class="diygw-grid-icon diygw-avatar grid1-icon-clz">
								<image mode="aspectFill" class="diygw-avatar-img" src="/static/image/yingpian.png">
								</image>
							</view>
							<view class="diygw-grid-title"> 电影票 </view>
						</view>
					</view>
					<view class="diygw-grid-item">
						<view class="diygw-grid-inner grid1-item-clz" @tap="topup">
							<view class="diygw-grid-icon diygw-avatar grid1-icon-clz">
								<image mode="aspectFill" class="diygw-avatar-img" src="/static/image/topup.png">
								</image>
							</view>
							<view class="diygw-grid-title"> 充值 </view>
						</view>
					</view>
					<view class="diygw-grid-item">
						<view class="diygw-grid-inner grid1-item-clz" @tap="noFood">
							<view class="diygw-grid-icon diygw-avatar grid1-icon-clz">
								<image mode="aspectFit" class="diygw-avatar-img" src="/static/image/food.png">
								</image>
							</view>
							<view class="diygw-grid-title"> 小吃 </view>
						</view>
					</view>
				</view>
			</view>
		</view>
		<view class="diygw-title flex diygw-col-24 title-clz" @tap="navigateTo" data-type="page"
			data-url="/pages/user/share">
			<view class="title font-normal"><text class="diy-icon-forwardfill" style="margin-right: 5px;"></text>分享给朋友
			</view>
			<view class="more">
				<text class="diy-icon-right"></text>
			</view>
		</view>
		<view class="diygw-title flex diygw-col-24 title-clz" @tap="navigateTo" data-type="page"
			data-url="/pages/user/feedback">
			<view class="title font-normal"><text class="diy-icon-commentfill" style="margin-right: 5px;"></text>客服反馈
			</view>
			<view class="more">
				<text class="diy-icon-right"></text>
			</view>
		</view>
		<view class="diygw-title flex diygw-col-24 title-clz" @tap="navigateTo" data-type="page"
			data-url="/pages/user/about">
			<view class="title font-normal"><text class="diy-icon-infofill" style="margin-right: 5px;"></text>关于我们
			</view>
			<view class="more">
				<text class="diy-icon-right"></text>
			</view>
		</view>
		<view class="flex diygw-col-24">
			<button class="round bg-orange sm" @tap="quit" v-if="userInfo">退出登录</button>
		</view>
	</view>
</template>

<script>
	import {
		BALANCE
	} from '@/utils/api.js'
	export default {
		data() {
			return {
				//用户全局信息
				userInfo: {},
			};
		},
		onShow() {
			this.init();
			this.getBalance();
		},
		onLoad(option) {

		},
		methods: {
			noFood() {
				uni.showToast({
					icon: 'none',
					title: '小吃模块尚未开发...深感抱歉...'
				})
			},
			topup() {
				const _this = this;
				if (_this.userInfo === null || _this.userInfo === '') {
					uni.showToast({
						icon: 'error',
						title: '用户请先登录'
					});
					return;
				}
				uni.navigateTo({
					url: '/pages/user/recharge'
				});
			},
			goOrder() {
				uni.switchTab({
					url: '/pages/order/index'
				})
			},
			init() {
				this.userInfo = uni.getStorageSync('user');
			},
			quit() {
				uni.clearStorageSync();
				this.init();
			},
			getBalance() {
				const _this = this;
				uni.request({
					url: BALANCE + '/' + _this.userInfo.id,
					method: 'GET',
					success(res) {
						_this.userInfo.balance = res.data.data;
						uni.setStorageSync('user', _this.userInfo);
					}
				})
			}
		}
	};
</script>

<style lang="scss" scoped>
	.flex7-clz {
		padding-top: 20rpx;
		background-size: 100% 100%;
		padding-left: 10rpx;
		padding-bottom: 20rpx;
		background-position: bottom center;
		padding-right: 10rpx;
	}

	.flex8-clz {
		height: 120rpx;
	}

	.image3-clz {
		flex-shrink: 0;
		border-bottom-left-radius: 120rpx;
		overflow: hidden;
		width: 120rpx !important;
		border-top-left-radius: 120rpx;
		border-top-right-radius: 120rpx;
		border-bottom-right-radius: 120rpx;
		height: 120rpx !important;
	}

	.image3-size {
		height: 120rpx !important;
		width: 120rpx !important;
	}

	.text1-clz {
		margin-left: 10rpx;
		padding-top: 10rpx;
		font-weight: bold;
		padding-left: 20rpx;
		font-size: 32rpx !important;
		padding-bottom: 10rpx;
		margin-top: 0rpx;
		margin-bottom: 10rpx;
		margin-right: 10rpx;
		padding-right: 20rpx;
	}

	.flex9-clz {
		padding-top: 10rpx;
		z-index: 100;
		color: #707070;
		padding-left: 10rpx;
		padding-bottom: 10rpx;
		padding-right: 10rpx;
	}

	.flex10-clz {
		z-index: 100;
	}

	.text-clz {
		color: #474747;
	}

	.flex19-clz {
		z-index: 100;
	}

	.text20-clz {
		color: #474747;
	}

	.flex17-clz {
		z-index: 100;
	}

	.text17-clz {
		color: #474747;
	}

	.flex4-clz {
		padding-top: 10rpx;
		border-bottom-left-radius: 16rpx;
		padding-left: 10rpx;
		padding-bottom: 10rpx;
		border-top-right-radius: 16rpx;
		margin-right: 20rpx;
		background-color: #ffffff;
		margin-left: 20rpx;
		box-shadow: 0rpx 16rpx 50rpx rgba(255, 230, 230, 0.44);
		overflow: hidden;
		width: calc(100% - 20rpx - 20rpx) !important;
		border-top-left-radius: 16rpx;
		margin-top: 20rpx;
		border-bottom-right-radius: 16rpx;
		margin-bottom: 20rpx;
		padding-right: 10rpx;
	}

	.text3-clz {
		margin-left: 10rpx;
		font-weight: bold;
		flex: 1;
		font-size: 28rpx !important;
		margin-top: 10rpx;
		margin-bottom: 10rpx;
		margin-right: 10rpx;
	}

	.grid1-item-clz {
		margin: 0px;
		padding: 10px;
	}

	.grid1-icon-clz {
		font-size: calc(40px - 4px) !important;

		width: 40px;
		height: 40px;
	}

	.container27315 {
		padding-left: 0px;
		padding-right: 0px;


		background-position: top center;
		background-size: cover;
	}

	.container27315 {}
</style>