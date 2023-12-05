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
								<input class="flex1" name="search" type="" v-model="search" placeholder="请输入关键字" />
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
							<view class="diygw-list">
								<view style="" class="diygw-item col-100 row solid-bottom">
									<view class="diygw-avatar">
										<image mode="aspectFit" class="diygw-avatar-img" src="/static/my2.jpg"></image>
									</view>
									<view class="content">
										<view class="title"> 少年的你 </view>
										<view class="text-sm remark"> 777777777777777777777777777 </view>
									</view>
								</view>
								<view style="" class="diygw-item col-100 row solid-bottom">
									<view class="diygw-avatar">
										<image mode="aspectFit" class="diygw-avatar-img" src="/static/my2.jpg"></image>
									</view>
									<view class="content">
										<view class="title"> 无价之宝 </view>
										<view class="text-sm remark"> 777777777777777777777777777 </view>
									</view>
								</view>
							</view>
						</view>
					</view>
				</view>
				<view v-if="tabsIndex == 1" class="flex-sub">
					<view class="diygw-col-24 search1-clz">
						<view class="diygw-search">
							<view class="flex1 align-center flex padding-xs solid radius">
								<text style="color: #555 !important" class="diy-icon-search"></text>
								<input class="flex1" name="search1" type="" v-model="search1" placeholder="请输入关键字" />
							</view>
							<view style="color: #333 !important" class="diygw-tag margin-left-xs radius-xs"> 搜索 </view>
						</view>
					</view>
					<view class="diygw-col-24 text-clz diygw-text-md"> 近期最受欢迎 </view>
					<view class="flex diygw-col-24 list1-clz">
						<view class="diygw-list">
							<view style="" class="diygw-item col-100 row solid-bottom diygw-card diygw-shadow list1-item-clz">
								<view class="diygw-avatar list1-icon-clz">
									<image mode="aspectFit" class="diygw-avatar-img" src="/static/grid1.png"></image>
								</view>
								<view class="content">
									<view class="title"> 哈利奎因：猛禽小队 </view>
									<view class="text-sm remark"> 这部电影并不只是小丑女的个人电影。DC漫画《猛禽小队》实际上讲述了.... </view>
								</view>
							</view>
							<view style="" class="diygw-item col-100 row solid-bottom diygw-card diygw-shadow list1-item-clz">
								<view class="diygw-avatar list1-icon-clz">
									<image mode="aspectFit" class="diygw-avatar-img" src="/static/global/grid2.png"></image>
								</view>
								<view class="content">
									<view class="title"> 囧妈 </view>
									<view class="text-sm remark"> 徐伊万（徐峥 饰） </view>
								</view>
							</view>
							<view style="" class="diygw-item col-100 row solid-bottom diygw-card diygw-shadow list1-item-clz">
								<view class="diygw-avatar list1-icon-clz">
									<image mode="aspectFit" class="diygw-avatar-img" src="/static/global/grid3.png"></image>
								</view>
								<view class="content">
									<view class="title"> 菜单三 </view>
									<view class="text-sm remark"> 说明文字 </view>
								</view>
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
	// import { LATEST_NOTICE_URL,SHARE_LIST_URL } from '@/utils/api.js';
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
				search: '',
				search1: ''
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

			this.init();
		},
		methods: {
			async init() {},
			changeTabs(evt) {
				let { index } = evt.currentTarget.dataset;
				if (index == this.tabsIndex) return;
				this.setData({
					tabsIndex: index
				});
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
