<template>
	<!-- ref：唯一ref  timedown:开屏广告秒数  imageUrl：图片地址  advertClick：广告图点击 -->
	<cc-advertView style="width: 100%;height: 100%;" ref="ccAdvert" :timedown="5"
		imageUrl="https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_1280.jpg"></cc-advertView>
	<view class="container container27315 white page">
		<view class="flex diygw-col-24 flex-direction-column tabs-clz">
			<view class="diygw-tabs text-center solid-bottom justify-center scale-title small-border tabs-title">
				<view class="diygw-tab-item tabs-item-title" :class="index == tabsIndex ? ' cur text-green ' : ''"
					v-for="(item, index) in tabsDatas" :key="index" @click="changeTabs" :data-index="index"> <text
						v-if="item.icon" :class="item.icon"></text> {{ item.text }} </view>
			</view>
			<view class="">
				<view v-if="tabsIndex == 0" class="flex-sub">
					<view class="diygw-col-24 search-clz">
						<view class="diygw-search">
							<view class="flex1 align-center flex padding-xs solid radius">
								<text style="color: #555 !important" class="diy-icon-search"></text>
								<input class="flex1" name="search1" type="" v-model="hotParam"
									placeholder="请输入想要观看的影片" />
							</view>
							<view style="color: #333 !important" class="diygw-tag margin-left-xs radius-xs"
								@tap="hot()"> 查询 </view>
						</view>
					</view>

					<!-- 轮播图 -->
					<view class="flex diygw-col-24 swiper-clz">
						<swiper class="swiper" indicator-color="rgba(51, 51, 51, 0.39)" indicator-active-color="#fff"
							autoplay interval="2000" circular="true" style="height: 300rpx">
							<swiper-item class="diygw-swiper-item">
								<view class="diygw-swiper-item-wrap">
									<image src="/static/pic1.jpg" class="diygw-swiper-image"></image>
								</view>
							</swiper-item>
							<swiper-item class="diygw-swiper-item">
								<view class="diygw-swiper-item-wrap">
									<image src="/static/pic2.jpg" class="diygw-swiper-image"></image>
								</view>
							</swiper-item>
							<swiper-item class="diygw-swiper-item">
								<view class="diygw-swiper-item-wrap">
									<image src="/static/pic3.jpg" class="diygw-swiper-image"></image>
								</view>
							</swiper-item>
						</swiper>
					</view>
					<view class="flex flex-wrap diygw-col-24 flex-direction-column flex-clz">
						<view class="flex diygw-col-24 list-clz">
							<view class="diygw-list" v-if="hotFilms.length > 0">
								<view style="margin-bottom: 2px;margin-top: 2px;"
									class="diygw-item col-100 row solid-bottom" v-for="(hot, index) in hotFilms"
									:key="index" @tap="goFilm(hot)">
									<view>
										<image style="width: 100px;height: 100px;" mode="aspectFit" class=""
											:src="hot.img"></image>
									</view>
									<view class="content">
										<view class="title title2"> {{ hot.name }} </view>
										<view>
											<uni-rate :readonly="true" v-model="hot.sc" active-color="#FF6E06"
												allowHalf="true" :size="15" max="10" color="gray" />
											<span style="color: #FF6E06;">{{ hot.sc }}分</span>
											<button class="movie-btns" @tap.stop="goCinemaPick(hot)">购票</button>
										</view>
										<view class="diygw-text-line3 diygw-col-24 text1-clz"> {{ hot.description }}
										</view>
									</view>
								</view>
							</view>
							<view v-else style="text-align: center;color: red;width: 100%;">暂无热映影片...</view>
						</view>
					</view>
				</view>
				<view v-if="tabsIndex == 2" class="flex-sub">
					<view class="diygw-col-24 search1-clz">
						<view class="diygw-search">
							<view class="flex1 align-center flex padding-xs solid radius">
								<text style="color: #555 !important" class="diy-icon-search"></text>
								<input class="flex1" name="search2" type="" v-model="exceptParam"
									placeholder="请输入感兴趣的影片" />
							</view>
							<view style="color: #333 !important" class="diygw-tag margin-left-xs radius-xs"
								@tap="except()"> 查询 </view>
						</view>
					</view>

					<!-- 待映 -->
					<view class="diygw-col-24 text-clz diygw-text-md" style="margin: 0 0 10px 10px;"> 待映推荐 </view>
					<view class="container2">
						<scroll-view class="scroll-view" scroll-x>
							<view class="product-item" v-for="(item, index) in recommandedFilms" :key="index">
								<image style="width: 100px;height: 100px;" mode="aspectFit" class="" :src="item.img"
									@tap="goFilm(item)">
								</image>
								<view class="product-info">
									<text class="product-name diygw-text-line1">{{ item.name }}</text> <br />
									<text class="product-price">{{ item.date }}</text>
								</view>
							</view>
						</scroll-view>
					</view>

					<!-- 待映列表 -->
					<view class="flex flex-wrap diygw-col-24 flex-direction-column flex-clz">
						<view class="flex diygw-col-24 list-clz">
							<view class="diygw-list" v-if="exceptFilms.length > 0">
								<view style="margin-bottom: 2px;margin-top: 2px;"
									class="diygw-item col-100 row solid-bottom" v-for="(except, index) in exceptFilms"
									:key="index" @tap="goFilm(except)">
									<view class="">
										<image style="width: 100px;height: 100px;" mode="aspectFit" class=""
											:src="except.img"></image>
									</view>
									<view class="content">
										<view class="title title2">
											{{ except.name }}
										</view>
										<view class="cu-capsule"
											style="display: flex;width: 100%;justify-content: space-between;margin-bottom: 5px;">
											<view>
												<view class='cu-tag bg-red'>
													<text class='cuIcon-likefill'></text>
												</view>
												<view class="cu-tag line-red">
													{{ except.wish }}
												</view>
											</view>
											<view>
												<uni-tag style="font-size: 20px;text-align: center;"
													:text="except.status === 2 ? '预售' : '想看'"
													:type="except.status === 2 ? 'success' : 'warning'" />
											</view>
										</view>
										<view class="diygw-text-line3 diygw-col-24 text1-clz"> {{ except.description }}
										</view>
									</view>
								</view>
							</view>
							<view v-else style="text-align: center;color: red;width: 100%;">暂无待映影片...</view>
						</view>
					</view>
				</view>
				<view v-if="tabsIndex === 1" class="flex-sub">
					<view class="flex flex-wrap diygw-col-24 flex-direction-column flex-clz" v-if="recommendList">
						<view class="flex diygw-col-24 list-clz">
							<view class="diygw-list">
								<view style="margin-bottom: 2px;margin-top: 2px;"
									class="diygw-item col-100 row solid-bottom" v-for="(rec, index) in recommendList"
									:key="index" @tap="goFilm(rec)">
									<view>
										<image style="width: 100px;height: 100px;" mode="aspectFit" class=""
											:src="rec.img"></image>
									</view>
									<view class="content">
										<view class="title title2"> {{ rec.name }} </view>
										<view>
											<uni-rate :readonly="true" v-model="rec.sc" active-color="#FF6E06"
												allowHalf="true" :size="15" max="10" color="gray" />
											<view class="cu-capsule"
												style="display: flex;width: 100%;justify-content: space-between;margin-bottom: 5px;">
												<view>
													<view class='cu-tag bg-red'>
														<text class='cuIcon-likefill'></text>
													</view>
													<view class="cu-tag line-red">
														{{ rec.wish }}
													</view>
												</view>
												<view v-if="rec.status === 1">
													<button class="movie-btns" @tap.stop="goCinemaPick(rec)">购票</button>
												</view>
												<view v-else>
													<view>
														<uni-tag style="font-size: 20px;text-align: center;"
															:text="rec.status === 2 ? '预售' : '想看'"
															:type="rec.status === 2 ? 'success' : 'warning'" />
													</view>
												</view>
											</view>
										</view>
										<view class="diygw-text-line3 diygw-col-24 text1-clz"> {{ rec.description }}
										</view>
									</view>
								</view>
							</view>
						</view>
					</view>
					<view v-else style="text-align: center;color: red;width: 100%;">暂无推荐...请先登录或购票</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import {
		request
	} from '@/utils/request.js';
	import {
		HOT_FILM,
		EXCEPT_FILM,
		RECOMMEND_FILM,
		RECOMMEND_USER,
	} from '@/utils/api.js';
	// import queryParams from '../../uni_modules/diy-uview-ui/libs/function/queryParams';
	export default {
		data() {
			return {
				tabsDatas: [{
						text: `热映`,
						icon: ``
					},
					{
						text: `推荐`,
						icon: ``
					},
					{
						text: `待映`,
						icon: ``
					}
				],
				tabsLeft: 0,
				tabsWidth: 0,
				tabsItemWidth: 0,
				tabsIndex: 0,
				hotParam: '',
				exceptParam: '',
				hotFilms: [],
				exceptFilms: [],
				recommandedFilms: [],
				recommendList: [],
				imgUrl: ''
			};
		},
		onReady() {
			let myThis = this;
			// 模拟请求
			setTimeout(function() {
				myThis.imgUrl = 'https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_1280.jpg'
				// 初始化广告图
				myThis.$refs.ccAdvert.initAdvert();

			}, 200);
		},
		onShow() {
			this.setCurrentPage(this);

			this.hot();
			this.except();
			this.recommend();
			// this.tabsIndex = 0;
			this.recommendUser();
		},
		onLoad(option) {
			this.setCurrentPage(this);
			if (option) {
				this.setData({
					globalOption: this.getOption(option)
				});
			}

			// this.hot();
			// this.except();
			// this.recommend();
			this.hotParam = '';
			this.exceptParam = '';
		},
		methods: {
			goFilm(film) {
				uni.navigateTo({
					url: '/pages/film/film?film=' + JSON.stringify(film),
				})
			},
			goCinemaPick(film) {
				uni.navigateTo({
					url: '/pages/cinema/cinema-pick?film=' + JSON.stringify(film),
				})
			},
			changeTabs(evt) {
				let {
					index
				} = evt.currentTarget.dataset;
				if (index === 1) {
					const user = uni.getStorageSync('user')
					if (user != null || user != '') {
						this.recommendUser();
					}
				}
				if (index == this.tabsIndex) return;
				this.setData({
					tabsIndex: index
				});
			},
			async hot() {
				const data = await request(HOT_FILM, 'GET', {
					name: this.hotParam
				})
				if (data.code != 200) {
					uni.showToast({
						title: data.msg != null ? data.msg : '获取失败请稍后重试'
					})
				}
				this.hotFilms = data.data
			},
			async recommend() {
				const data = await request(RECOMMEND_FILM, 'GET')
				if (data.code != 200) {
					uni.showToast({
						title: data.msg != null ? data.msg : '获取失败请稍后重试'
					})
				}
				// this.recommandedFilms = data.data.map((item) => {
				// 	item.date = this.formatDateString(item.date);
				// 	return item;
				// })
				this.recommandedFilms = data.data
			},
			async except() {
				const data = await request(EXCEPT_FILM, 'GET', {
					name: this.exceptParam
				})
				if (data.code != 200) {
					uni.showToast({
						title: data.msg != null ? data.msg : '获取失败请稍后重试'
					})
				}
				this.exceptFilms = data.data
			},
			async recommendUser() {
				const data = await request(RECOMMEND_USER, 'GET');
				this.recommendList = data.data;
			}
			// formatDateString(inputDateString) {
			// 	const date = new Date(inputDateString);

			// 	// 将月份的英文表示转换为数字表示
			// 	const month = this.monthNameToNumber(date.toLocaleString('default', {
			// 		month: 'long'
			// 	}));

			// 	const day = date.getDate();

			// 	const formattedString = `${month}月${day}日`;
			// 	return formattedString;
			// },
			// monthNameToNumber(monthName) {
			// 	const months = [
			// 		'一月', '二月', '三月', '四月', '五月', '六月',
			// 		'七月', '八月', '九月', '十月', '十一月', '十二月'
			// 	];

			// 	return months.indexOf(monthName) + 1;
			// }
		}
	};
</script>

<style lang="scss" scoped>
	.movie-btns {
		float: right;
		margin-left: auto;
		width: 110rpx;
		height: 58rpx;
		background: linear-gradient(207deg, #FF9272 0%, #FC5421 100%);
		border-radius: 29rpx;
		text-align: center;
		line-height: 58rpx;
		color: #FFFFFF;
		font-size: 24rpx;
		font-weight: 550;
	}

	.page {
		display: flex;
		flex-direction: column;
		height: 100%;
	}

	.title2 {
		font-size: 18px;
		font-weight: 700;
		margin-bottom: 5px;
	}

	.scroll-Y {
		height: 300rpx;
	}

	.scroll-view_H {
		white-space: nowrap;
		width: 100%;
	}

	.scroll-view-item {
		height: 300rpx;
		line-height: 300rpx;
		text-align: center;
		font-size: 36rpx;
	}

	.scroll-view-item_H {
		display: inline-block;
		width: 100%;
		height: 300rpx;
		line-height: 300rpx;
		text-align: center;
		font-size: 36rpx;
	}

	.tabs-item-title {
		color: #fc8076 !important;
	}

	.tabs-title {}

	.tabs-item-title.cur {
		color: #db5f54 !important;
		font-size: calc(4px + 14px) !important;
	}

	.list1-item-clz {
		margin: 0px;
		padding: 10px;
	}

	.list1-item-clz .list1-icon-clz {
		width: 50px;
		height: 50px;
		font-size: calc(50px - 4px) !important;
	}

	.container27315 {
		padding-left: -1px;
		padding-right: 0px;
	}

	.container2 {
		width: 100%;
		height: 200px;
		background-color: #f8f8f8;
		padding: 10px;
		box-sizing: border-box;
		margin-bottom: 40px;
	}

	.scroll-view {
		white-space: nowrap;
		overflow-x: auto;
	}

	.product-item {
		display: inline-block;
		width: 100px;
		height: 165px;
		margin-right: 10px;
		background-color: #ffffff;
		border-radius: 8px;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		overflow: hidden;
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
		// line-height: 1.4;
		// margin-bottom: 4px;
	}

	.product-price {
		font-size: 16px;
	}
</style>