<template>
	<view
		class="u-slider"
		:class="[disabled ? 'u-slider--disabled' : '']"
		:style="{
			backgroundColor: blockColor
		}"
	>
		 <slider
		 	:min="min"
		 	:max="max"
		 	:step="step"
		 	:value="valueCom"
		 	:activeColor="activeColor"
		 	:inactiveColor="inactiveColor"
		 	:blockColor="blockColor"
		 	:showValue="showValue"
		 	:disabled="disabled"
		 	@change="changeHandler"
		 ></slider>
	</view>
</template>

<script>
/**
 * slider 滑块选择器
 * @tutorial https://uviewui.com/components/slider.html
 * @property {Number | String} value 滑块默认值（默认0）
 * @property {Number | String} min 最小值（默认0）
 * @property {Number | String} max 最大值（默认100）
 * @property {Number | String} step 步长（默认1）
 * @property {Number | String} blockWidth 滑块宽度，高等于宽（30）
 * @property {Number | String} height 滑块条高度，单位rpx（默认6）
 * @property {String} inactiveColor 底部条背景颜色（默认#c0c4cc）
 * @property {String} activeColor 底部选择部分的背景颜色（默认#19be6b）
 * @property {String} blockColor 滑块颜色（默认#ffffff）
 * @property {Object} blockStyle 给滑块自定义样式，对象形式
 * @property {Boolean} disabled 是否禁用滑块(默认为false)
 * @event {Function} start 滑动触发
 * @event {Function} moving 正在滑动中
 * @event {Function} end 滑动结束
 * @example <u-slider v-model="value" />
 */
export default {
	name: "u-slider",
	emits: ["update:modelValue", "input", "start", "moving", "end"],
	props: {
		// 当前进度百分比值，范围0-100
		value: {
			type: [Number, String],
			default: 0
		},
		modelValue: {
			type: [Number, String],
			default: 0
		},
		showValue:{
			type: Boolean,
			default: true
		},
		// 是否禁用滑块
		disabled: {
			type: Boolean,
			default: false
		},
		// 滑块宽度，高等于宽，单位rpx
		blockWidth: {
			type: [Number, String],
			default: 30
		},
		// 最小值
		min: {
			type: [Number, String],
			default: 0
		},
		// 最大值
		max: {
			type: [Number, String],
			default: 100
		},
		// 步进值
		step: {
			type: [Number, String],
			default: 1
		},
		// 滑块条高度，单位rpx
		height: {
			type: [Number, String],
			default: 6
		},
		// 进度条的激活部分颜色
		activeColor: {
			type: String,
			default: "#19be6b"
		},
		// 进度条的背景颜色
		inactiveColor: {
			type: String,
			default: "#c0c4cc"
		},
		// 滑块的背景颜色
		blockColor: {
			type: String,
			default: "#ffffff"
		},
		// 用户对滑块的自定义颜色
		blockStyle: {
			type: Object,
			default() {
				return {};
			}
		}
	},
	data() {
		return {
			startX: 0,
			status: "end",
			newValue: 0,
			distanceX: 0,
			startValue: 0,
			barStyle: {},
			sliderRect: {
				left: 0,
				width: 0
			}
		};
	},
	computed: {
		valueCom() {
			// #ifndef VUE3
			return this.value;
			// #endif

			// #ifdef VUE3
			return this.modelValue;
			// #endif
		}
	},
	methods: {
		// 滑动结束时触发
		changeHandler(e) {
			const {
				value
			} = e.detail
			// 更新v-model的值
			this.$emit('input', value)
			this.$emit("update:modelValue", value);
			// 触发事件
			this.$emit('change', value)
		}
	}
};
</script>

<style lang="scss" scoped>
@import "../../libs/css/style.components.scss";

</style>
