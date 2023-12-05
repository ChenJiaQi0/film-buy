<template>
	<view class="container container27315">
		<view class="flex diygw-col-24 flex-direction-column tabs-clz">
			<view class="diygw-tabs text-center solid-bottom justify-center scale-title small-border tabs-title">
				<view class="diygw-tab-item tabs-item-title" :class="index == tabsIndex ? ' cur text-green ' : ''" v-for="(item, index) in tabsDatas" :key="index" @click="changeTabs" :data-index="index"> <text v-if="item.icon" :class="item.icon"></text> {{ item.text }} </view>
			</view>
			<view class="">
				<view v-if="tabsIndex == 0" class="flex-sub">
					<view class="diygw-col-24 search-clz">
						<view class="diygw-search">
							<view class="flex1 align-center flex padding-xs solid radius">
								<text style="color: #555 !important" class="diy-icon-search"></text>
								<input class="flex1" name="search" type="" v-model="name" placeholder="请输入关键字" />
							</view>
							<view style="color: #333 !important" class="diygw-tag margin-left-xs radius-xs"> 搜索 </view>
						</view>
					</view>
					<view class="flex diygw-col-24 swiper-clz">
						<swiper class="swiper" indicator-color="rgba(51, 51, 51, 0.39)" indicator-active-color="#fff" autoplay interval="2000" circular="true" style="height: 300rpx">
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
							<view class="diygw-list" v-if="hotFilms">
								<view style="margin-bottom: 2px;margin-top: 2px;" class="diygw-item col-100 row solid-bottom" v-for="(hot, index) in hotFilms" :key="index">
									<view class="">
										<image style="width: 100px;height: 100px;" mode="aspectFit" class="" :src="hot.img"></image>
									</view>
									<view class="content">
										<view class="title"> {{ hot.name }} </view>
										<view>评分：<span style="color: red;">{{ hot.sc }}</span><button style="float: right;font-size: 12px;background-color: #ffc9c9;color: #d9480f;">购票</button></view>
										<view class="diygw-text-line3 diygw-col-24 text1-clz"> {{ hot.description }} </view>
									</view>
								</view>
							</view>
							<view v-else>
								<p>暂无热映影片</p>
							</view>
						</view>
					</view>
				</view>
				<view v-if="tabsIndex == 1" class="flex-sub">
					<view class="diygw-col-24 search1-clz">
						<view class="diygw-search">
							<view class="flex1 align-center flex padding-xs solid radius">
								<text style="color: #555 !important" class="diy-icon-search"></text>
								<input class="flex1" name="search1" type="" v-model="name" placeholder="请输入关键字" />
							</view>
							<view style="color: #333 !important" class="diygw-tag margin-left-xs radius-xs"> 搜索 </view>
						</view>
					</view>
					<view class="diygw-col-24 text-clz diygw-text-md"> 近期最受欢迎 </view>
					<view class="flex flex-wrap diygw-col-24 flex-direction-column flex-clz">
						<view class="flex diygw-col-24 list-clz">
							<view class="diygw-list" v-if="exceptFilms">
								<view style="margin-bottom: 2px;margin-top: 2px;" class="diygw-item col-100 row solid-bottom" v-for="(except, index) in exceptFilms" :key="index">
									<view class="">
										<image style="width: 100px;height: 100px;" mode="aspectFit" class="" :src="except.img"></image>
									</view>
									<view class="content">
										<view class="title"> {{ except.name }} </view>
										<view><span style="color: red;">{{ except.wish }}</span>人想看<uni-tag style="float: right;" text="预售" type="success" /></view>
										<view class="diygw-text-line3 diygw-col-24 text1-clz"> {{ except.description }} </view>
									</view>
								</view>
							</view>
							<view v-else>
								暂无待映影片
							</view>
						</view>
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import { request } from '@/utils/request.js';
	import { HOT_EXCEPT_FILM } from '@/utils/api.js';
	export default {
		data() {
			return {
				//用户全局信息
				userInfo: {},
				//页面传参
				globalOption: {},
				//自定义全局变量
				globalData: {},
				tabsDatas: [
					{ text: `热映`, icon: `` },
					{ text: `待映`, icon: `` }
				],
				tabsLeft: 0,
				tabsWidth: 0,
				tabsItemWidth: 0,
				tabsIndex: 0,
				name: '',
				hotFilms: [],
				exceptFilms: []
			};
		},
		onShow() {
			this.setCurrentPage(this);
		},
		onLoad(option) {
			this.setCurrentPage(this);
			if (option) {
				this.setData({
					globalOption: this.getOption(option)
				});
			}

			this.hotAndExcept();
		},
		methods: {
			changeTabs(evt) {
				let { index } = evt.currentTarget.dataset;
				if (index == this.tabsIndex) return;
				this.setData({
					tabsIndex: index
				});
			},
			async hotAndExcept() {
				const data = await request(HOT_EXCEPT_FILM, 'GET', this.name)
				if (data.code != 200) {
					uni.showToast({
						title: data.msg != null ? data.msg : '获取失败请稍后重试'
					})
				}
				this.hotFilms = data.data.hotFilms
				this.exceptFilms = data.data.exceptFilms
			}
		}
	};
</script>

<style lang="scss" scoped>
	.tabs-item-title {
		color: #fc8076 !important;
	}
	.tabs-title {
	}
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
	.container27315 {
	}
</style>
