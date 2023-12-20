<template>
	<view class="container container27315" style="margin-top: 100rpx;">
		<view class="flex diygw-col-24 justify-center items-end flex-wrap flex-clz">
			<image style="height: 100px;width: 100px" src="/static/my2.jpg"
				class="image3-size diygw-image diygw-col-0 image3-clz" mode="widthFix">
			</image>
			<view class="diygw-col-24 text-clz diygw-text-xl" style="text-align: center;"> FilmBuy电影 </view>
		</view>
		<view class="flex diygw-col-24 list-clz">
			<view class="diygw-list">
				<view style="" class="diygw-item col-100 row solid-bottom solid-small-bottom list-item-clz">
					<view class="diygw-avatar list-icon-clz diy-icon-tag"> </view>
					<view class="content">
						<view class="title"> 当前版本 </view>
						<view class="text-sm remark"> 1.0.0 </view>
					</view>
				</view>
				<view style="" class="diygw-item col-100 row solid-bottom solid-small-bottom list-item-clz">
					<view class="diygw-avatar list-icon-clz diy-icon-discover"> </view>
					<view class="content">
						<view class="title"> 访问官网 </view>
						<view class="text-sm remark"> https://github.com/ChenJiaQi0/film-buy </view>
					</view>
				</view>
				<view style="" class="diygw-item col-100 row solid-bottom solid-small-bottom list-item-clz">
					<view class="diygw-avatar list-icon-clz diy-icon-phone"> </view>
					<view class="content">
						<view class="title"> 违法和不良信息举报电话 </view>
						<view class="text-sm remark"> 00-140-22222 </view>
					</view>
				</view>
				<view style="" class="diygw-item col-100 row solid-bottom solid-small-bottom list-item-clz">
					<view class="diygw-avatar list-icon-clz diy-icon-global"> </view>
					<view class="content">
						<view class="title"> 品牌 </view>
						<view class="text-sm remark"> v9. 4.0 Build xiaomi 6b12b21 20200323 </view>
					</view>
				</view>
			</view>
		</view>
		<view class="version text-grey flex-direction-column flex diygw-col-24 justify-center align-center">
			<view> 有问题email开发人员 </view>
			<view> 3465976682@qq.com </view>
		</view>
		<view class="clearfix"></view>
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
				globalData: {}
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
			async init() {}
		}
	};
</script>

<style lang="scss" scoped>
	.icon {
		font-size: 64rpx;
	}

	.list-item-clz {
		margin: 0px;
		padding: 10px;
	}

	.list-item-clz .list-icon-clz {
		width: 50px;
		height: 50px;
		font-size: calc(50px - 4px) !important;
	}

	.container27315 {
		padding-left: 0px;
		padding-right: 0px;
	}

	.container27315 {}
</style>