<template>
	<view class="container container27315">
		<view class="flex diygw-dropdown diygw-col-24 dropdowns-clz">
			<u-dropdown class="flex-sub" direction="down" ref="refDropdowns">
				<u-dropdown-item @change="changeDropdowns0" v-model="dropdowns0" title="全城" :options="dropdownsDatas0"></u-dropdown-item>
				<u-dropdown-item @change="changeDropdowns1" v-model="dropdowns1" title="品牌" :options="dropdownsDatas1"></u-dropdown-item>
			</u-dropdown>
		</view>
		<view class="flex diygw-col-24 flex-wrap flex-clz">
			<view class="diygw-title flex diygw-col-24 title-clz">
				<view class="title font-normal"> 幸福蓝海国际影城 </view>
				<view class="more"> 39.9元起 </view>
			</view>
			<view class="diygw-col-24 text1-clz"> 江宁区麒麟街道悦民路128号天赋广场23栋3楼 </view>
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
</template>

<script>
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
				dropdowns1: '',
				dropdownsDatas0: [
					{ text: '全部商品', value: 0 },
					{ text: '新款商品', value: 1 },
					{ text: '活动商品', value: 2 }
				],
				dropdownsDatas1: [
					{ text: '默认排序', value: 0 },
					{ text: '好评排序', value: 1 },
					{ text: '销量排序', value: 2 }
				]
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
			closeDropdowns() {
				this.$refs.refDropdowns.close();
			},
			changeDropdowns0(evt) {
				let item = this.dropdownsDatas0.find((item) => {
					return item.value == evt;
				});
				item && item.action && this.navigateTo(item.action);
			},
			changeDropdowns1(evt) {
				let item = this.dropdownsDatas1.find((item) => {
					return item.value == evt;
				});
				item && item.action && this.navigateTo(item.action);
			}
		}
	};
</script>

<style lang="scss" scoped>
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
