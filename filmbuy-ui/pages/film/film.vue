<template>
	<view>
		<!-- 影片信息 -->
		<view class="cinema-top">
			<view class="tops-item">
				<view class="cinema-img">
					<image :src="film.img"></image>
				</view>
				<view class="cinema-info">
					<view class="cinema-info-top">
						<view class="top-name">{{film.name}}</view>
						<view class="top-type">3D IMAX</view>
					</view>
					<view class="rate-item">
						<text class="rate-nun">{{film.ename}}</text>
					</view>
					<view v-if="film.tag != null" style="color: #f08c00;">{{film.tag}}</view>
					<view class="list-type">{{film.cat}}</view>
					<view class="list-type">{{film.date}} | {{film.addr}}上映 | {{film.dur}}分钟</view>
					<view class="list-type" style="justify-content: space-between;display: flex;">
						<button class="cu-btn bg-grey " style="margin-right: 5px;"><text
								class="diy-icon-likefill"></text>想看</button>
						<button class="cu-btn bg-grey "><text class="diy-icon-favorfill"></text>看过</button>
					</view>
				</view>
			</view>
		</view>

		<!-- 评分 -->
		<view class="flex flex-wrap diygw-col-24 flex-direction-column justify-between items-start flex-clz">
			<view class="flex flex-wrap diygw-col-24 justify-between items-center">
				<view class="diygw-col-0 text33-clz"> <text class="diy-icon-circlefill"></text> FilmBuy购票评分 </view>
				<view class="flex flex-wrap diygw-col-0 items-center flex11-clz">
					<view class="diygw-col-0" style="margin-right: 5px;"> {{film.wish}}人想看</view>
					<view class="diygw-col-0"> {{film.watched}}人看过</view>
				</view>
			</view>

			<view class="flex flex-wrap diygw-col-24 justify-between items-center flex5-clz">
				<view class="diygw-col-0 text-clz"> {{film.snum}}人评 </view>
				<view class="diygw-col-0 text5-clz">
					<uni-rate :readonly="true" v-model="film.sc" active-color="#FF6E06" allowHalf="true" :size="15"
						max="10" color="gray" />
				</view>
			</view>
		</view>

		<!-- 简介 -->
		<view>
			<view class="diygw-col-24 text-clz diygw-text-md" style="margin: 10px 0 10px 10px;"> 简介 </view>
			<uni-collapse style="color: black;">
				<uni-collapse-item title="查看" :show-animation="true" :open="true" :show-arrow="true"
					style="color: black;">
					<view class="content" style="margin-left: 10px;margin-right: 10px;">
						<text class="text">{{film.description}}</text>
					</view>
				</uni-collapse-item>
			</uni-collapse>
		</view>

		<!-- 演职人员 -->
		<view class="diygw-col-24 text-clz diygw-text-md" style="margin: 10px 0 10px 10px;"> 演职人员 </view>
		<view class="container2">
			<scroll-view class="scroll-view" scroll-x>
				<view class="product-item" v-for="(item, index) in actors" :key="index">
					<image style="width: 100px;height: 100px;" mode="aspectFit" class="" :src="item.img">
					</image>
					<view class="product-info">
						<text class="product-name diygw-text-line3">{{ item.name }}</text>
					</view>
				</view>
			</scroll-view>
		</view>

		<!-- 观众评论 -->
		<view style="display: flex;">
			<view class="diygw-col-24 text-clz diygw-text-md" style="margin: 10px 0 10px 10px;"> 观众热评 </view>
			<button class="cu-btn round lines-red" @tap="goComment(film.id)"
				style="margin: 10px 10px 0px 0px;float: right;color: blue;width: 100px;height: 20px;">写短评
			</button>
		</view>
		<view class="flex flex-wrap diygw-col-24 items-start flex2-clz" v-if="comments.length > 0"
			v-for="(comment, index) in comments" :key="index">
			<image src="/static/image/user.png" class="image-size diygw-image diygw-col-0 image-clz" mode="widthFix">
			</image>
			<view class="flex flex-wrap diygw-col-0 flex-direction-column flex1-clz">
				<view class="flex flex-wrap diygw-col-24 justify-between items-start">
					<view class="diygw-col-0 text2-clz"> 热心网友 </view>
					<view class="flex diygw-col-0">
						<view class="diygw-tag padding-lr-xs xs radius bg-none">
							<text class="diygw-icon diy-icon-appreciate"></text>
							<text> 100 </text>
						</view>
						<view class="diygw-tag flex-direction-row-reverse padding-lr-xs xs radius bg-none">
							<text> 19 </text>
							<text class="diygw-icon diy-icon-cai"></text>
						</view>
					</view>
				</view>
				<uni-rate :readonly="true" v-model="comment.sc" active-color="#FF6E06" allowHalf="true" :size="15"
					max="10" color="gray" />
				<view class="diygw-col-24 diygw-text-line2"> {{comment.comment}} </view>
				<view class="flex diygw-col-0 justify-between">
					<view class="diygw-tag padding-lr-xs xs radius bg-none">
						<text class="diygw-icon diy-icon-communityfill"></text>
						<text> 12回复 </text>
					</view>
					<view class="diygw-tag padding-lr-xs xs radius bg-none">
						<text class="diygw-icon diy-icon-timefill"></text>
						<text> {{comment.createTime}} </text>
					</view>
				</view>
			</view>
		</view>
		<view v-else style="text-align: center;color: red;width: 100%;">待观众评论...</view>
		<view class="cu-bar foot" style="width: 100%;background-color: white;">
			<button class=" cu-btn shadow-blur round lg" style="width: 100%;background-color: #db5f54;color: white;"
				@tap="goFilmShowTime()">购票</button>
		</view>
	</view>
</template>

<script>
	import {
		request
	} from '@/utils/request.js'
	import {
		ACTORS,
		COMMENTS
	} from '@/utils/api.js'
	export default {
		data() {
			return {
				film: {},
				actors: [],
				comments: []
			}
		},
		methods: {
			goFilmShowTime() {
				uni.navigateTo({
					url: '/pages/film/film-showtime?film=' + JSON.stringify(this.film),
				})
			},
			async getActors() {
				const data = await request(ACTORS + '?ids=' + this.film.actors, 'GET')
				if (data.code === 200) this.actors = data.data
			},
			async getComments() {
				const data = await request(COMMENTS + '/' + this.film.id, 'GET')
				if (data.code === 200) this.comments = data.data
			},
			goComment(id) {
				const user = uni.getStorageSync('user')
				if (user != null && user != '') {
					uni.navigateTo({
						url: '/pages/user/comment?id=' + id
					})
				} else {
					uni.showModal({
						content: '用户请先登录再点评',
						confirmText: '去登录',
						success(res) {
							if (res.confirm) {
								uni.navigateTo({
									url: '/pages/user/login'
								})
							}
						}
					})
				}

			}
		},
		onLoad(option) {
			this.film = JSON.parse(option.film)
		},
		onShow() {
			this.getActors()
			this.getComments()
		}
	}
</script>

<style lang="less">
	.text2-clz {
		font-size: 30rpx !important;
	}

	.flex1-clz {
		margin-left: 10rpx;
		flex: 1;
		margin-top: 0rpx;
		margin-bottom: 0rpx;
		margin-right: 0rpx;
	}

	.flex2-clz {
		padding-top: 10rpx;
		border-bottom-left-radius: 12rpx;
		padding-left: 10rpx;
		padding-bottom: 10rpx;
		border-top-right-radius: 12rpx;
		margin-right: 10rpx;
		margin-left: 10rpx;
		box-shadow: 0rpx 2rpx 6rpx 1px rgba(31, 31, 31, 0.16);
		overflow: hidden;
		width: calc(100% - 10rpx - 10rpx) !important;
		border-top-left-radius: 12rpx;
		margin-top: 10rpx;
		border-bottom-right-radius: 12rpx;
		margin-bottom: 10rpx;
		padding-right: 10rpx;
	}

	.image-clz {
		border-bottom-left-radius: 50%;
		overflow: hidden;
		border-top-left-radius: 50%;
		border-top-right-radius: 50%;
		border-bottom-right-radius: 50%;
	}

	.image-size {
		height: 100rpx !important;
		width: 100rpx !important;
	}

	.product-image {
		width: 100%;
		height: 120px;
		object-fit: cover;
		background-color: #f0f0f0;
	}

	.product-info {
		padding: 8px;
		text-align: center;
	}

	.product-name {
		font-weight: 700;
		font-size: 14px;
		color: #333333;
		line-height: 1.4;
		margin-bottom: 4px;
	}

	.product-price {
		font-size: 16px;
	}

	.product-item {
		display: inline-block;
		width: 100px;
		height: 140px;
		margin-right: 10px;
		background-color: #ffffff;
		border-radius: 8px;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		overflow: hidden;
	}

	.scroll-view {
		white-space: nowrap;
		overflow-x: auto;
	}

	.cinema-top {
		padding: 32rpx;
		position: relative;

		.tops-item {
			display: flex;
			align-items: center;
			z-index: 9999;
		}

		.btins {
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			width: 100%;
			height: 100%;
			// z-index: 99;
			filter: blur(15px);
			-webkit-filter: blur(15px);
		}

		.cinema-img {
			width: 180rpx;
			height: 248rpx;

			image {
				width: 180rpx;
				height: 248rpx;
				border-radius: 20rpx;
			}
		}

		.cinema-info {
			margin-left: 30rpx;

			.cinema-info-top {
				display: flex;
				align-items: center;

				.top-name {
					color: #000;
					font-size: 35rpx;
					font-weight: 700;
				}

				.top-type {
					background-color: #7B7B7B;
					border-radius: 6rpx;
					padding: 2rpx 8rpx;
					color: #FFFFFF;
					font-size: 17rpx;
					margin-left: 30rpx;
				}
			}

			.rate-item {
				display: flex;
				align-items: center;
				margin-top: 5rpx;

				.rate-nun {
					color: #868e96;
					font-size: 22rpx;
					font-weight: 550;
					margin-left: 16rpx;
				}

			}
		}
	}

	.list-type {
		color: black;
		font-size: 24rpx;
		margin-top: 12rpx;

		text {
			color: #FF6E06;
			font-size: 550;
			margin-right: 8rpx;
		}
	}

	.cinema-down {
		display: flex;
		align-items: center;
		padding: 22rpx 32rpx;
		border-bottom: 2rpx solid #DFE0E2;

		.down-city {
			display: flex;
			align-items: center;

			text {
				color: #636775;
				font-size: 28rpx;
			}

			image {
				width: 24rpx;
				height: 24rpx;
				margin-left: 8rpx;
			}
		}

		.serchs {
			margin-left: auto;
			width: 44rpx;
			height: 44rpx;
		}
	}

	.cinema-list {
		margin: 0rpx 32rpx;
		border-bottom: 2rpx solid #DFE0E2;
		padding: 32rpx 0rpx 40rpx 0rpx;

		.cinema-name {
			color: #2D3039;
			font-size: 32rpx;
			font-weight: 550;
		}

		.cinema-address-item {
			display: flex;
			justify-content: space-between;
			margin-top: 10rpx;

			.address-text {
				color: #636775;
				font-size: 24rpx;
				width: 78%;
			}

			.distance {
				color: #636775;
				font-size: 28rpx;
			}
		}
	}

	.sessions {
		color: #636775;
		font-size: 24rpx;
		margin-top: 24rpx;
	}

	.region-top {
		display: flex;
		align-items: center;
		justify-content: space-between;
		padding: 30rpx 20rpx;

		.region-left {
			width: 75%;
			border-radius: 40rpx;
			height: 68rpx;
			background-color: #F5F6F8;
			display: flex;
			align-items: center;
			padding-left: 30rpx;
		}

		.region-val {
			width: 90%;
			font-size: 30rpx;
		}

		.region-btn {
			background: linear-gradient(207deg, #FF9272 0%, #FC5421 100%);
			border-radius: 50rpx;
			height: 68rpx;
			text-align: center;
			width: 140rpx;
			line-height: 68rpx;
			color: #FFFFFF;
			font-size: 24rpx;
			font-weight: 550;
		}
	}

	.region-list {
		padding: 22rpx 35rpx;
		color: #2D3039;
		font-size: 32rpx;
		display: flex;
		align-items: center;
		justify-content: space-between;
		border-bottom: 2rpx solid #E2E2E2;
	}

	.empty {
		text-align: center;
		padding-top: 30rpx;
		color: #787A82;
		font-size: 24rpx;
	}

	.button-button-clz {
		margin: 6rpx !important;
	}

	.icon {
		font-size: 64rpx;
	}

	.flex-clz {
		padding-top: 30rpx;
		border-bottom-left-radius: 16rpx;
		background-size: 100% 100%;
		color: #7666ff;
		padding-left: 20rpx;
		padding-bottom: 30rpx;
		border-top-right-radius: 16rpx;
		margin-right: 20rpx;
		margin-left: 20rpx;
		box-shadow: 0rpx 0rpx 16rpx #d9dcff;
		overflow: hidden;
		width: calc(100% - 20rpx - 20rpx) !important;
		border-top-left-radius: 16rpx;
		margin-top: 30rpx;
		border-bottom-right-radius: 16rpx;
		background-image: linear-gradient(90deg, rgba(252, 253, 255, 0.94) 10%, rgba(238, 243, 255, 0.95) 50%, rgba(252, 253, 255, 0.94) 100%);
		margin-bottom: 0rpx;
		padding-right: 20rpx;
	}

	.text33-clz {
		color: #db5f54;
		font-weight: bold;
		font-size: 32rpx !important;
	}

	.flex11-clz {
		color: #009bfd;
	}

	.icon1 {
		font-size: 24rpx;
	}

	.text5-clz {
		margin-left: 0rpx;
		margin-top: 10rpx;
		margin-bottom: 10rpx;
		margin-right: 0rpx;
	}

	.flex5-clz {
		font-size: 26rpx !important;
	}

	.text-clz {
		padding-top: 6rpx;
		border-bottom-left-radius: 40rpx;
		overflow: hidden;
		padding-left: 16rpx;
		padding-bottom: 6rpx;
		border-top-left-radius: 40rpx;
		border-top-right-radius: 0rpx;
		border-bottom-right-radius: 0rpx;
		background-image: linear-gradient(90deg, #db5f54 0%, rgba(252, 253, 255, 0) 100%);
		padding-right: 10rpx;
		color: black;
	}

	.text1-clz {
		background-color: #db5f54;
		padding-top: 10rpx;
		border-bottom-left-radius: 32rpx;
		overflow: hidden;
		color: #ffffff;
		font-weight: bold;
		padding-left: 16rpx;
		padding-bottom: 10rpx;
		border-top-left-radius: 32rpx;
		border-top-right-radius: 32rpx;
		border-bottom-right-radius: 32rpx;
		padding-right: 16rpx;
	}

	.container27315 {
		padding-left: 0px;
		padding-right: 0px;
	}

	.container27315 {
		padding-bottom: 80px;
	}

	.text {
		margin-left: 5px;
		font-size: 14px;
		color: #666;
		line-height: 20px;
	}
</style>