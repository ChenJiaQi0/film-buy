<template>
	<view class="diy-sku-item flex flex-direction-column">
		<view class="spec-title diygw-text-md">{{ title }}</view>
		<view class="spec-list">
			<view @click="updateActive(index)" v-for="(specItem, index) in specList" :key="index" :style="getItemStyle(index,specItem)" :class="{'spec-item': true, 'active': active==index, 'disable': specItem.disable}">{{ specItem.title }}
			</view>
		</view>
	</view>
</template>

<script>
	/**
	 * sku样式-js内容基本都必须保留,页面结构及css只保留页面的点击事件即可
	 */
	export default {
		name: "diy-sku-item",
		props: {
			/**
			 * 属性项对象
			 */
			specMap: {
				type: Object,
				default: {}
			},
			/**
			 * 当前属性项所属行
			 */
			row: {
				type: Number,
				default: -1
			},
			/**
			 * 当前活动项
			 */
			active: {
				type: Number,
				default: -1
			},
			activeColor: {
				type: String,
				default: '#19be6b'
			},
			inactiveColor: {
				type: String,
				default: '#606266'
			},
			disableBgColor:{
				type: String,
				default: '#e8e8e8'
			},
			/**
			 * 是否禁止选择
			 */
			disable: {
				type: Boolean,
				default: false
			},
			/**
			 * 属性项列表的key
			 */
			specListKey: {
				type: String,
				default: 'datas'
			},
			/**
			 * 属性项标题key
			 */
			titleKey: {
				type: String,
				default: 'title'
			}
		},
		computed: {
			/**
			 * 属性项标题
			 * @returns {string}
			 */
			title() {
				return this.specMap[this.titleKey] ?? '';
			},
			/**
			 * 属性列表
			 * @returns {*[]}
			 */
			specList() {
				return this.specMap[this.specListKey] ?? [];
			}
		},
		methods: {
			getItemStyle(index,specItem){
				let style = {
					color: this.active==index ? this.activeColor : this.inactiveColor,
					borderColor: this.active==index ? this.activeColor : this.inactiveColor
				}
				if(specItem.disable){
					style.backgroundColor = this.disableBgColor
				}
				return style;
			},
			/**
			 * 属性项点击事件，本事件是必须存在的
			 * @param index
			 */
			updateActive(index) {
				if (!this.disable && !this.specList[index].disable) {
					if (index == this.active) {
						index = -1;
					}

					let param = {
						index,
						row: this.row
					};
					this.$emit('updateItemActive', param); //直接在sku-cc内部使用时事件
					uni.$emit('updateSkuSpecItemActive', param); //适配器模式时事件
				}
			}
		}
	}
</script>

<style lang="scss">
	.diy-sku-item {
		margin-bottom: 24rpx;

		.spec-title {}

		.spec-list {
			display: flex;
			flex-wrap: wrap;
			
			.spec-item {
				margin-right: 12rpx;
				margin-top: 10rpx;
				padding:8rpx;
				position: relative;
				border: 2rpx solid #e0e0e0;
				cursor: pointer;
				float: left;
				min-width: 100rpx;
				font-size: 28rpx;
				border-radius: 3px;
				text-align: center;
			}

			.spec-item.active {
				border-color: #ff6700;
				color: #ff6700;
			}

			.spec-item.disable {
				border-color: #d4d4d4;
				color: #b0b0b0;
				background: #dedede;
			}
		}
	}
</style>
