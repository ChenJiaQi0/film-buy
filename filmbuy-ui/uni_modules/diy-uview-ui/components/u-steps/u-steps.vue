<template>
	<view class="diygw-steps-wrap" >
		<view v-if="mode == 'diy'||mode=='number'" class="diygw-steps" :class="[arrow?'steps-arrow':'']">
			<view class="diygw-step-item" :class="[index > current ? '' : item.textClazz]" v-for="(item, index) in list" :key="index">
				<text v-if="mode=='number'"  class="num" :data-index="index + 1" :class="[index > current ? item.icon : item.successIcon]"></text>
				<text v-else :class="[index > current ? item.icon : item.successIcon]"></text>
				<text>
					{{ item[labelName] }}
				</text>
			</view>
		</view>
		<view
			v-else
			class="u-steps"
			:style="{
				flexDirection: direction
			}"
		>
			<view class="u-steps__item" 
				:class="['u-steps__item--' + direction]" 
				v-for="(item, index) in list" :key="index"
			>
				<view
					class="u-steps__item__num"
					v-if="mode == 'number'"
					:style="{
						backgroundColor: current < index ? 'transparent' : activeColor,
						borderColor: current < index ? unActiveColor : activeColor
					}"
				>
					<text v-if="current < index" :style="{
						color: current < index ? unActiveColor : activeColor,
					}">
						{{ index + 1 }}
					</text>
					<u-icon v-else size="40" color="#ffffff" :name="item.successIcon||icon"></u-icon>
				</view>
				<view class="u-steps__item__dot" v-if="mode == 'dot'" :style="{ 
					backgroundColor: index <= current ? activeColor : unActiveColor 
				}"></view>
				<text class="u-line-1" :style="{ 
					color: index <= current ? activeColor : unActiveColor,
				}" :class="['u-steps__item__text--' + direction]">
					{{ item[labelName]}}
				</text>
				<view class="u-steps__item__line" :class="['u-steps__item__line--' + mode]" v-if="index < list.length - 1">
					<u-line :direction="direction" length="100%" :hair-line="false" :color="unActiveColor"></u-line>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
/**
 * steps 步骤条
 * @description 该组件一般用于完成一个任务要分几个步骤，标识目前处于第几步的场景。
 * @tutorial https://www.uviewui.com/components/steps.html
 * @property {String} mode 设置模式（默认dot）
 * @property {Array} list 数轴条数据，数组。具体见上方示例
 * @property {String} type type主题（默认primary）
 * @property {String} direction row-横向，column-竖向（默认row）
 * @property {Number String} current 设置当前处于第几步
 * @property {String} active-color 已完成步骤的激活颜色，如设置，type值会失效
 * @property {String} un-active-color 未激活的颜色，用于表示未完成步骤的颜色（默认#606266）
 * @example <u-steps :list="numList" active-color="#fa3534"></u-steps>
 */
export default {
	name: 'u-steps',
	props: {
		// 步骤条的类型，dot|number
		mode: {
			type: String,
			default: 'dot'
		},
		// 步骤条的数据
		list: {
			type: Array,
			default() {
				return [];
			}
		},
		// 主题类型, primary|success|info|warning|error
		type: {
			type: String,
			default: 'primary'
		},
		// 当前哪一步是激活的
		current: {
			type: [Number, String],
			default: 0
		},
		labelName:{
			type:String,
			default:'name'
		},
		// 激活步骤的颜色
		activeColor: {
			type: String,
			default: '#19be6b'
		},
		// 未激活的颜色
		unActiveColor: {
			type: String,
			default: '#909399'
		},
		// 自定义图标
		icon: {
			type: String,
			default: 'checkmark'
		},
		arrow:{
			type: String,
			default: ''
		},
		// step的排列方向，row-横向，column-竖向
		direction: {
			type: String,
			default: 'row'
		}
	},
	data() {
		return {};
	},
};
</script>

<style lang="scss" scoped>
@import '../../libs/css/style.components.scss';

$u-steps-item-number-width: 60rpx;
$u-steps-item-dot-width: 20rpx;
.diygw-steps-wrap{
	padding:10px 0;
}
.u-steps {
	@include vue-flex;
	
	.u-steps__item {
		flex: 1;
		text-align: center;
		position: relative;
		min-width: 100rpx;
		font-size: 26rpx;
		color: #8799a3;
		@include vue-flex;
		justify-content: center;
		flex-direction: column;
		align-items: center;
		
		&--row {
			@include vue-flex;
			flex-direction: column;
			
			.u-steps__item__line {
				position: absolute;
				z-index: 0;
				left: 75%;
				width: 50%;
				
				&--dot {
					top: calc(#{$u-steps-item-dot-width} / 2);
				}
				
				&--number {
					top: calc(#{$u-steps-item-number-width} / 2);
				}
			}
		}
		
		&--column {
			@include vue-flex;
			flex-direction: row;
			justify-content: flex-start;
			min-height: 120rpx;
			
			.u-steps__item__line {
				position: absolute;
				z-index: 0;
				height: 50%;
				top: 75%;
				
				&--dot {
					left: calc(#{$u-steps-item-dot-width} / 2);
				}
				
				&--number {
					left: calc(#{$u-steps-item-number-width} / 2);
				}
			}
		}
		
		&__num {
			@include vue-flex;
			font-size: 40rpx;
			align-items: center;
			justify-content: center;
			width: $u-steps-item-number-width;
			height: $u-steps-item-number-width;
			border: 1px solid #8799a3;
			border-radius: 50%;
			overflow: hidden;
			
		}
		
		&__dot {
			width: $u-steps-item-dot-width;
			height: $u-steps-item-dot-width;
			@include vue-flex;
			border-radius: 50%;
		}
		
		&__text--row {
			margin-top: 14rpx;
		}
		
		&__text--column {
			margin-left: 14rpx;
		}
	}
}
</style>
