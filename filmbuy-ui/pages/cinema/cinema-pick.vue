<template>
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
					<!-- <button class="cu-btn bg-grey" style="margin-right: 5px;" @tap="changeIconWish"
						:disabled="disabledWish">
						<text :class="iconWish"></text>想看
					</button>
					<button class="cu-btn bg-grey " @tap="changeIconWatched" :disabled="disabledWatched"><text
							:class="iconWatched"></text>看过</button> -->
				</view>
			</view>
		</view>
	</view>
	<view class="container container27315 white page">
		<!-- 筛选条件 -->
		<view class="flex diygw-dropdown diygw-col-24 dropdowns-clz">
			<u-dropdown class="flex-sub" direction="down" ref="refDropdowns">
				<u-dropdown-item @change="getCinemaList" :title="cityInfo" v-model="areaParam"
					:options="area"></u-dropdown-item>
				<u-dropdown-item @change="getCinemaList" title="品牌" v-model="brandParam"
					:options="brand"></u-dropdown-item>
			</u-dropdown>
		</view>
		<view v-if="cinemaList.length > 0">
			<view class="flex diygw-col-24 flex-wrap flex-clz" v-for="(cinema, index) in cinemaList" :key="index"
				@tap="goShowTime(cinema)">
				<view class="diygw-title flex diygw-col-24 title-clz">
					<view class="title font-normal">
						{{cinema.brandName}}({{cinema.cinemaName}})
					</view>
					<view class="more">
						<span style="color: red;">39.9</span>元起
					</view>
				</view>
				<view class="diygw-col-24 text1-clz"> {{cinema.address}} </view>
				<view class="flex diygw-col-3 tag-clz">
					<view class="diygw-tag margin-xs xs diygw-line-blue">
						<text> 改签 </text>
					</view>
				</view>
				<view class="flex diygw-col-3 tag2-clz">
					<view class="diygw-tag margin-xs xs diygw-line-orange">
						<text> 影城卡 </text>
					</view>
				</view>
			</view>
		</view>
		<view v-else style="text-align: center;color: red;width: 100%;font-size: 15px;">查无对应影院信息，请重新筛选...</view>
	</view>
</template>

<script>
	import {
		brand,
		location
	} from '@/data/cinemaData.js';
	import {
		CINEMA_LIST,
		UPDATE_ICON
	} from '@/utils/api.js';
	import {
		request
	} from '@/utils/request.js';
	export default {
		data() {
			return {
				brandParam: '',
				brand: brand,
				cityInfo: '',
				city: '',
				areaParam: '',
				area: [],
				cinemaList: [],
				film: {},
				iconWish: 'diy-icon-like',
				iconWatched: 'diy-icon-favor',
				disabledWish: false,
				disabledWatched: false,
			};
		},
		onShow() {
			this.getLocation();
		},
		onLoad(option) {
			this.film = JSON.parse(option.film)
		},
		methods: {
			async updateIcon(iconType) {
				const data = await request(UPDATE_ICON + '/' + this.film.id + '/' + iconType, 'POST');
				if (data.code != 200) {
					uni.showToast({
						title: data.msg || '网络异常，请稍后重试'
					});
				} else {
					this.film = data.data;
				}
			},
			changeIconWish() {
				this.iconWish = 'diy-icon-likefill';
				this.updateIcon('1');
				this.disabledWish = true;
			},
			changeIconWatched() {
				this.iconWatched = 'diy-icon-favorfill'
				this.updateIcon('2');
				this.disabledWatched = true;
			},
			goShowTime(cinema) {
				uni.navigateTo({
					url: '/pages/film/film-showtime?film=' + JSON.stringify(this.film) + '&cinema=' + JSON
						.stringify(cinema)
				})
			},
			closeDropdowns() {
				this.$refs.refDropdowns.close();
			},
			changeDropdowns0(evt) {
				let item = this.dropdownsDatas0.find((item) => {
					return item.value == evt;
				});
				item && item.action && this.navigateTo(item.action);
			},
			async getCinemaList() {
				const data = await request(CINEMA_LIST, 'GET', {
					area: this.areaParam,
					brandName: this.brandParam,
					city: this.city
				});
				this.cinemaList = data.data;
			},
			getLocation() {
				uni.getLocation({
					type: 'wgs84',
					success: (res) => {
						// const latitude = res.latitude;
						// const longitude = res.longitude;
						const latitude = 32.0603;
						const longitude = 118.7969;

						// 调用逆地理编码服务
						this.reverseGeocoding(latitude, longitude);
					},
					fail: (err) => {
						console.error('获取位置失败', err);
						this.cityInfo = '获取位置失败';
					},
				});
			},
			reverseGeocoding(latitude, longitude) {
				uni.request({
					url: `https://apis.map.qq.com/ws/geocoder/v1/?location=${latitude},${longitude}&key=4I5BZ-IAYKL-HBSPT-EMCOL-EWRA2-2DBKM`,
					method: 'GET',
					success: (res) => {
						this.city = res.data.result.address_component.city;
						this.cityInfo = `所在城市: ${this.city}`;
						this.getAreaList();
						this.getCinemaList();
					},
					fail: (err) => {
						this.cityInfo = '获取城市失败';
					},
				});
			},
			getAreaList() {
				const city = location.find((item) => item.city === this.city)
				return this.area = city.area
			}
		},
	};
</script>

<style lang="scss" scoped>
	.page {
		display: flex;
		flex-direction: column;
		height: 100%;
	}

	.text1-clz {
		margin-left: 10rpx;
		width: calc(100% - 10rpx - 10rpx) !important;
		margin-top: 10rpx;
		margin-bottom: 10rpx;
		margin-right: 10rpx;
	}

	.container27315 {
		padding-left: 0px;
		padding-right: 0px;
	}

	.container27315 {
		padding-bottom: 80px;
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
</style>