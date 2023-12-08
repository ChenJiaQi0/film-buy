<template>
	<view class="container container27315 white page">
		<view class="flex diygw-dropdown diygw-col-24 dropdowns-clz">
			<u-dropdown class="flex-sub" direction="down" ref="refDropdowns">
				<u-dropdown-item @change="getCinemaList" :title="cityInfo" v-model="areaParam"
					:options="area"></u-dropdown-item>
				<u-dropdown-item @change="getCinemaList" title="品牌" v-model="brandParam"
					:options="brand"></u-dropdown-item>
			</u-dropdown>
		</view>
		<view v-if="cinemaList.length > 0">
			<view class="flex diygw-col-24 flex-wrap flex-clz" v-for="(cinema, index) in cinemaList" :key="index">
				<view class="diygw-title flex diygw-col-24 title-clz">
					<view class="title font-normal"> {{cinema.brandName}}({{cinema.cinemaName}}) </view>
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
		CINEMA_LIST
	} from '@/utils/api.js';
	import {
		request
	} from '@/utils/request.js';
	export default {
		data() {
			return {
				//用户全局信息
				userInfo: {},
				//页面传参
				globalOption: {},
				//自定义全局变量
				globalData: {},
				dropdowns0: '',
				brandParam: '',
				brand: brand,
				cityInfo: '',
				city: '',
				areaParam: '',
				area: [],
				cinemaList: [],
			};
		},
		onShow() {
			this.setCurrentPage(this);

			this.getLocation();
			this.getCinemaList();
		},
		onLoad(option) {
			this.setCurrentPage(this);
			if (option) {
				this.setData({
					globalOption: this.getOption(option)
				});
			}

			this.getLocation();
			this.getCinemaList();
		},
		methods: {
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
					brandName: this.brandParam
				});
				console.log(data);
				this.cinemaList = data.data;
			},
			getLocation() {
				uni.getLocation({
					type: 'wgs84',
					success: (res) => {
						const latitude = res.latitude;
						const longitude = res.longitude;

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
</style>