<template>
	<view>
		<view class="movie-position">
			<view class="position-text">{{cinema.brandName}}({{cinema.cinemaName}})</view>
			<view class="position-item">
				<view class="item-texts">{{cinema.address}}</view>
				<view class="item-img-list">
					<!-- <image src="@/static/image/collection-icon.png" class="collion"></image>
					<image src="@/static/image/moivew-location.png" class="locaion-img"></image> -->
				</view>
			</view>
		</view>

		<view v-if="findFilm">
			<!-- 轮播盒子 start -->
			<view class="swiper_main">
				<template v-if="chooseMovie">
					<image class="background-img-vague" :src="chooseMovie.img" mode=""></image>
				</template>
				<view class="wrap">
					<swipers :list="movieList" height="260" mode="none" name="img" :autoplay="false"
						img-mode="scaleToFill" class="swiper_bg" :effect3d="true" bg-color="none" :circular="false"
						effect3d-previous-margin="280" @change="setBackground" @click="setBackground"
						:current="swiperCurrent"></swipers>
				</view>
				<div class="box"></div>
			</view>
			<!-- 轮播盒子 end -->

			<template v-if="chooseMovie">
				<view class="moive-name">{{chooseMovie.name}}</view>
				<view class="moive-info">{{chooseMovie.dur}}分钟 | {{chooseMovie.addr}} | {{chooseMovie.cat}}</view>
			</template>

			<view v-if="findShowTime">
				<!-- 场次日期 -->
				<view class="moive-tab-list">
					<view class="tabs-list-item" :class="{'tab-sel':index==tabIndexs}"
						v-for="(value, index) in tabLists" :key="index" @click="getTimeTab(value,index)">
						{{value.time}}
						<view class="bottoms" v-if="index==tabIndexs"></view>
					</view>
				</view>

				<!-- 场次信息 -->
				<view class="ticket-list" v-for="(value,index) in timeList" :key="index">
					<view style="width: 79%;">
						<view class="ticet-left">
							<view style="display: flex;align-items: center;">
								<text class="left-time">{{value.hour}}</text>
								<text class="left-type">{{chooseMovie.cat}}</text>
							</view>
							<view style="display: flex;align-items: center;">
								<view class="ret-price"><text>￥</text>{{value.price}}</view>
							</view>
						</view>
						<view class="ticet-left" style="margin-top: 20rpx;">
							<view class="ticet-booms">
								<text>时长:{{chooseMovie.dur}}分钟</text>
								<text style="margin-left: 25rpx;">{{value.name}}号厅</text>
							</view>
						</view>
					</view>
					<view class="buy-btns" @tap="getGou(value)">购票</view>
				</view>
			</view>
			<view v-else style="text-align: center;color: red;width: 100%;">该影片暂无排期...请重新选择吧</view>
		</view>
		<view v-else style="text-align: center;color: red;width: 100%;">该影院暂无你想看的排片...请重新选择吧</view>

	</view>
</template>

<script>
	import swipers from '@/components/u-swiper.vue';
	import {
		request
	} from '@/utils/request.js';
	import {
		MOVIE_LIST,
		SHOWtIME_LIST,
	} from '@/utils/api.js';
	export default {
		components: {
			swipers
		},
		data() {
			return {
				film: null,
				cinema: {},
				movieList: [],
				chooseMovie: null,
				swiperCurrent: 0,
				tabLists: '',
				tabIndexs: 0,
				timeList: [],
				showTimeId: '',
			}
		},
		onLoad(option) {
			this.cinema = JSON.parse(option.cinema);
			if (option.film != null) {
				this.film = JSON.parse(option.film);
				this.chooseMovie = JSON.parse(option.film);
			}
			// const _this = this;
			// new Promise(function() {
			// 	_this.getMovieList()
			// }).then(() => {
			// 	_this.getShowTimeList()
			// })
			this.getMovieList();
		},
		onShow() {},
		methods: {
			// 切换轮播改变背景
			setBackground(index) {
				this.swiperCurrent = index
				this.chooseMovie = this.movieList[index]
				this.getShowTimeList(this.chooseMovie)
				this.tabIndexs = 0
			},
			async getMovieList() {
				const data = await request(MOVIE_LIST + '/' + this.cinema.id, 'GET')
				if (data.code === 200) {
					this.movieList = data.data;
					if (this.film != null) {
						this.swiperCurrent = this.movieList.findIndex((ele) => ele
							.id === this.film.id);
						console.log(this.chooseMovie);
						this.getShowTimeList(this.chooseMovie);
					} else {
						this.chooseMovie = data.data[0];
						this.getShowTimeList(data.data[0]);
					}
				}
				// uni.request({
				// 	url: MOVIE_LIST + '/' + this.cinema.id,
				// 	success(res) {
				// 		if (res.data.code === 200) {
				// 			_this.movieList = res.data.data;
				// 			if (_this.film != null) {
				// 				_this.swiperCurrent = _this.movieList.findIndex((ele) => ele
				// 					.id === _this.film.id);
				// 			} else {
				// 				_this.chooseMovie = _this.movieList[0];
				// 				console.log(_this.chooseMovie);
				// 			}
				// 		} else {
				// 			uni.showToast({
				// 				title: '网络异常请稍后重试',
				// 				icon: 'error'
				// 			})
				// 		}
				// 	}
				// })
			},
			async getShowTimeList(value) {
				const data = await request(SHOWtIME_LIST + '/' + this.cinema.id + '/' + value.id, 'GET');
				if (data.code === 200) {
					this.tabLists = data.data
					if (this.tabLists.length > 0) {
						this.timeList = this.tabLists[0].list
					} else {
						this.timeList = []
					}
				}
				// uni.request({
				// 	url: SHOWtIME_LIST + '/' + this.cinema.id + '/' + this.chooseMovie.id,
				// 	success(res) {
				// 		if (res.data.code === 200) {
				// 			_this.tabLists = res.data.data
				// 			if (_this.tabLists.length > 0) {
				// 				_this.timeList = _this.tabLists[0].list
				// 			} else {
				// 				_this.timeList = []
				// 			}
				// 		} else {
				// 			uni.showToast({
				// 				title: '网络异常请稍后重试',
				// 				icon: 'error'
				// 			})
				// 		}
				// 	}
				// })
			},
			getTimeTab(data, index) {
				if (this.tabIndexs != index) {
					this.tabIndexs = index
					this.timeList = data.list
				}
			},
			getGou(value) {
				// console.log(value);
				const token = uni.getStorageSync('token');
				if (token === null || token === '') {
					uni.showModal({
						title: '错误',
						content: '用户未登录，请先登录之后再购票！',
						success: function(res) {
							if (res.confirm) {
								uni.navigateTo({
									url: '/pages/user/login'
								})
							}
						}

					})
				} else {
					uni.navigateTo({
						url: '/pages/film/film-seat?showTimeId=' + value.id + '&price=' + value.price + '&date=' +
							value
							.date + '&hour=' + value.hour + '&roomName=' + value.name + '&filmName=' + this
							.chooseMovie.name + "&cat=" + this.chooseMovie.cat + '&cinemaName=' + this.cinema
							.cinemaName
					})
				}
			}
		},
		computed: {
			findFilm() {
				return this.movieList.length > 0 ? true : false
			},
			findShowTime() {
				return this.tabLists.length > 0 ? true : false
			}
		}
	}
</script>

<style lang="less">
	// 轮播图中间
	.swiper_main {
		position: relative;
		height: 324rpx;
		overflow: hidden;

		.background-img-vague {
			position: absolute;
			left: 0;
			right: 0;
			width: 100%;
			// transform: translateX(-50%);
			filter: blur(15px);
			-webkit-filter: blur(15px);
		}

		/deep/.u-swiper-item {
			width: 193rpx !important;
			height: 260rpx !important;
		}

		// 影院背景图
		.moviebg {
			width: 100%;
			height: 100%;
			filter: blur(10rpx);
		}

		.wrap {
			position: absolute;
			left: 0;
			top: 26rpx;
			right: 0;
			margin: 0 auto;
		}

		.box {
			width: 0;
			height: 0;
			border: 10rpx solid;
			border-color: transparent transparent #fff #fff;
			transform: rotate(135deg);
			position: absolute;
			bottom: -10rpx;
			left: 0;
			right: 0;
			margin: 0 auto;
		}

	}

	.movie-position {
		padding: 30rpx 32rpx;

		.position-text {
			color: #2D3039;
			font-size: 32rpx;
			font-weight: 550;
		}

		.position-item {
			display: flex;
			margin-top: 10rpx;
		}

		.item-texts {
			color: #636775;
			font-size: 24rpx;
			width: 72%;
		}

		.item-img-list {
			margin-left: auto;
			display: flex;

			// align-items: center;
			.collion {
				width: 48rpx;
				height: 48rpx;
				margin-right: 50rpx;
			}

			.locaion-img {
				width: 44rpx;
				height: 44rpx;
			}
		}
	}

	.moive-name {
		text-align: center;
		margin-top: 30rpx;
		color: #2D3039;
		font-size: 36rpx;
		font-weight: 600;
	}

	.moive-info {
		text-align: center;
		margin-top: 14rpx;
		color: #636775;
		font-size: 24rpx;
	}

	.moive-tab-list {
		margin-top: 40rpx;
		padding: 24rpx 12rpx;
		border-bottom: 2rpx solid #DFE0E2;
		overflow-x: auto;
		white-space: nowrap;
		width: auto;
		overflow-y: hidden;

		.tabs-list-item {
			padding: 0rpx 20rpx;
			display: inline-block;
			position: relative;
			color: #636775;
			font-size: 28rpx;
		}

		.tab-sel {
			color: #FE602B !important;
			font-size: 28rpx;
			font-weight: 550;
		}

		.bottoms {
			position: absolute;
			bottom: -30rpx;
			right: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			width: 52rpx;
			height: 8rpx;
			background-color: #FE602B;
			// border-radius: 5rpx 5rpx 0px 0px;
		}
	}

	.ticket-list {
		margin: 0rpx 32rpx;
		padding: 38rpx 0rpx;
		border-bottom: 2rpx solid #E0E1E3;
		display: flex;
		align-items: center;

		.ticet-left {
			display: flex;
			align-items: center;
			justify-content: space-between;

			.left-time {
				color: #2D3039;
				font-size: 42rpx;
			}

			.left-type {
				color: #2D3039;
				font-size: 28rpx;
				margin-left: 32rpx;
			}
		}

		.ret-price {
			color: #FE602B;
			font-size: 42rpx;
			font-weight: 550;

			text {
				font-size: 28rpx;
			}
		}

		.ret-yuans {
			color: #A6A8AE;
			font-size: 28rpx;
			margin-left: 13rpx;
			text-decoration: line-through;
		}
	}

	.ticet-booms {
		color: #A6A8AE;
		font-size: 24rpx;
	}

	.ticet-boom-ret {
		display: flex;
		align-items: center;

		.sheng-text {
			padding: 0rpx 8rpx;
			height: 30rpx;
			line-height: 30rpx;
			background-color: #3DB97C;
			border-radius: 4rpx;
			color: #FFFFFF;
			font-size: 20rpx;
			text-align: center;
			margin-right: 12rpx;
		}

		.sheng-pirce {
			color: #A6A8AE;
			font-size: 24rpx;
		}
	}

	.buy-btns {
		width: 110rpx;
		height: 58rpx;
		text-align: center;
		line-height: 58rpx;
		background: linear-gradient(207deg, #FF9272 0%, #FC5421 100%);
		border-radius: 30rpx;
		color: #FFFFFF;
		font-size: 24rpx;
		font-weight: 550;
		margin-left: auto;
	}
</style>