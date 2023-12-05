<template>
	<view class="u-select">
		<u-popup :blur="blur" :maskCloseAble="maskCloseAble" mode="bottom" :popup="false" v-model="popupValue"
			length="auto" :safeAreaInsetBottom="safeAreaInsetBottom" @close="close" :z-index="uZIndex">
			<view class="u-select">
				<view class="u-select__header" @touchmove.stop.prevent="">
					<view class="u-select__header__cancel u-select__header__btn" :style="{ color: cancelColor }"
						hover-class="u-hover-class" :hover-stay-time="150" @tap="close">
						{{cancelText}}
					</view>
					<view class="u-select__header__title">
						{{title}}
					</view>
					<view class="u-select__header__confirm u-select__header__btn"
						:style="{ color: moving ? cancelColor : confirmColor }" hover-class="u-hover-class"
						:hover-stay-time="150" @touchmove.stop="" @tap.stop="confirm">
						{{confirmText}}
					</view>
				</view>
				<view class="u-select__body">
					 <scroll-view :scroll-top="scrollTop" scroll-y="true" class="scroll-Y">
					 <diy-tree v-if="popupValue" v-model="selectData" @select="treeSelect" @change="changeTreeSelect" :selectParent="selectParent" :checkStrictly="checkStrictly" :mode="mode" :list="ulist" :foldAll="flod" :valueName="valueName" :labelName="labelName"></diy-tree>
					 </scroll-view>
				</view>
			</view>
		</u-popup>
	</view>
</template>

<script>
	/**
	 * diy-select 
	 * @description 此选择器用于下拉单选或者多选，支持过滤
	 * @tutorial http://uviewui.com/components/select.html
	 * @property {String} mode 模式选择，"single-column"-单列模式，"mutil-column"-多列模式，"mutil-column-auto"-多列联动模式
	 * @property {Array} list 列数据，数组形式，见官网说明
	 * @property {Boolean} v-model 布尔值变量，用于控制选择器的弹出与收起
	 * @property {Boolean} safe-area-inset-bottom 是否开启底部安全区适配(默认false)
	 * @property {String} cancel-color 取消按钮的颜色（默认#606266）
	 * @property {String} confirm-color 确认按钮的颜色(默认#19be6b)
	 * @property {String} confirm-text 确认按钮的文字
	 * @property {String} cancel-text 取消按钮的文字
	 * @property {String} default-value 提供的默认选中的下标，见官网说明
	 * @property {Boolean} mask-close-able 是否允许通过点击遮罩关闭Picker(默认true)
	 * @property {String Number} z-index 弹出时的z-index值(默认10075)
	 * @property {String} value-name 自定义list数据的value属性名 1.3.6
	 * @property {String} label-name 自定义list数据的label属性名 1.3.6
	 * @property {String} child-name 自定义list数据的children属性名，只对多列联动模式有效 1.3.7
	 * @event {Function} confirm 点击确定按钮，返回当前选择的值
	 * @example <diy-select v-model="show" :list="list"></diy-select>
	 */

	export default {
		emits: ["update:modelValue", "input", "confirm"],
		props: {
			// 通过双向绑定控制组件的弹出与收起
			value: {
				type: Boolean,
				default: false
			},
			modelValue: {
				type: Boolean,
				default: false
			},
			// 列数据
			list: {
				type: Array,
				default () {
					return [];
				}
			},
			// 是否显示边框
			border: {
				type: Boolean,
				default: true
			},
			// 选中状态下的颜色，如设置此值，将会覆盖checkboxGroup的activeColor值
			activeColor: {
				type: String,
				default: ""
			},
			// "取消"按钮的颜色
			cancelColor: {
				type: String,
				default: '#606266'
			},
			// "确定"按钮的颜色
			confirmColor: {
				type: String,
				default: '#19be6b'
			},
			// 弹出的z-index值
			zIndex: {
				type: [String, Number],
				default: 0
			},
			safeAreaInsetBottom: {
				type: Boolean,
				default: false
			},
			// 是否允许通过点击遮罩关闭Picker
			maskCloseAble: {
				type: Boolean,
				default: true
			},
			// 默认选中值
			defaultValue: {
				type: Array,
				default () {
					return [];
				}
			},
			// 模式选择，radio，checkbox-多选
			mode: {
				type: String,
				default: 'radio'
			},
			range: {
				type: Array,
				default: function() {
					return []
				}
			},
			mode: {
				type: String,
				default: ''
			},
			valueName: {
				type: String,
				default: 'id'
			},
			labelName: {
				type: String,
				default: 'label'
			},
			openName:{
				type: String,
				default: 'open'
			},
			selectParent: { //是否可以选父级
				type: Boolean,
				default: false
			},
			checkStrictly:{
				type: Boolean,
				default: true
			},
			foldAll: { //折叠时关闭所有已经打开的子集，再次打开时需要一级一级打开
				type: Boolean,
				default: false
			},
			confirmColor: { // 确定按钮颜色
				type: String,
				default: ' #07bb07'
			},
			titleColor: { // 标题颜色
				type: String,
				default: '#07bb07'
			},
			// 顶部标题
			title: {
				type: String,
				default: ''
			},
			// 取消按钮的文字
			cancelText: {
				type: String,
				default: '取消'
			},
			// 确认按钮的文字
			confirmText: {
				type: String,
				default: '确认'
			},
			// 遮罩的模糊度
			blur: {
				type: [Number, String],
				default: 0
			},
			showSearch: {
				default: true,
				type: Boolean
			},
			placeholder: {
				default: '请输入搜索内容'
			},
			radioValue: {
				type: String,
				default: ''
			}
		},
		data() {
			return {
				 ulist:[],
				 popupValue: false,
				 keyword: '',
				 scrollTop: 0,
				 selectData: [],
				 // 列是否还在滑动中，微信小程序如果在滑动中就点确定，结果可能不准确
				 moving: false
			};
		},
		watch: {
			// 在select弹起的时候，重新初始化所有数据
			value: {
				immediate: true,
				handler(val) {
					this.popupValue = val;
				}
			},
			modelValue: {
				immediate: true,
				handler(val) {
					this.popupValue = val;
					
				}
			},
			list: {
				immediate: true,
				handler(val) {
					this.ulist = val
				}
			},
			defaultValue:{
				immediate: true,
				handler(val) {
					this.selectData = val
				}
			}
		},
		computed: {
			uZIndex() {
				// 如果用户有传递z-index值，优先使用
				return this.zIndex ? this.zIndex : this.$u.zIndex.popup;
			},
		},
		methods: {
			//点击取消按钮触发
			close() {
				this.$emit("update:modelValue", false);
			},
			treeSelect(item){
				if(this.mode==''){
					this.selectData = [item]
				}
			},
			changeTreeSelect(r){
				this.selectData = r
			},
			//提交触发
			confirm() {
				this.$emit("update:modelValue", false);
				if(this.mode=='checkbox'){
					this.$emit('confirm', this.selectData)
				}else if(this.selectData.length>0){
					this.$emit('confirm', this.selectData[0])
				}
				
			}
		}
	};
</script>

<style scoped lang="scss">
	@import "../../libs/css/style.components.scss";

	.u-select {

		&__action {
			position: relative;
			line-height: $u-form-item-height;
			height: $u-form-item-height;

			&__icon {
				position: absolute;
				right: 20rpx;
				top: 50%;
				transition: transform .4s;
				transform: translateY(-50%);
				z-index: 1;

				&--reverse {
					transform: rotate(-180deg) translateY(50%);
				}
			}
		}

		&__hader {
			&__title {
				color: $u-content-color;
			}
		}

		&--border {
			border-radius: 6rpx;
			border-radius: 4px;
			border: 1px solid $u-form-item-border-color;
		}

		&__header {
			@include vue-flex;
			align-items: center;
			justify-content: space-between;
			height: 80rpx;
			padding: 0 40rpx;
		}

		&__body {
			width: 100%;
			overflow: hidden;
			background-color: #fff;
			padding: 0;
			.scroll-Y {
				height: 600rpx;
			}
			&__picker-view {
				height: 100%;
				box-sizing: border-box;

				&__item {
					@include vue-flex;
					align-items: center;
					justify-content: center;
					font-size: 32rpx;
					color: $u-main-color;
					padding: 0 8rpx;
				}
			}
		}
	}
</style>
