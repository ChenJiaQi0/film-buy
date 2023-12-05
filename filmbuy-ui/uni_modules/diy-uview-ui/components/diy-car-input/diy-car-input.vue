<template>
	<view class="diy-car-input" :style="{'--car-color':activeColor,'--car-alpha-color': $u.colorToRgba(activeColor,0.15)}">
		<view class="car-number-input">
			<view class="cell" :class="[item.focus?'focus':'',item.eco?'eco':'']"  @tap="changeNumber" v-for="(item,index) in numbers" :key="index" :data-index="index">
				<text class="value" :data-index="index" >{{item.value}}</text>
				<text class="cursor" v-if="item.focus&&item.value==''"></text>
			</view>
		</view>
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
					<view class="keyboard">
						<view class="row" v-for="(rows,rowIndex) in keyboard"  :key="rowIndex">
							<block v-for="(col,colIndex) in rows" key="col">
								<text v-if="col.disabled" class="col disabled">{{col.value}}</text>
								<text v-else-if="col.empty" class="col empty">{{col.value}}</text>
								<view v-else-if="col.backspace" class="col backspace" @tap="deleteNum">
									<u-icon :size="38" name="backspace" :bold="true"></u-icon>
								</view>
								<text v-else class="col" @tap="clickNum" :data-value="col">{{col}}</text>
							</block>
						</view>
					</view>
				</view>
			</view>
		</u-popup>
	</view>
</template>

<script>
	import Emitter from "../../libs/util/emitter.js";
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
		mixins: [Emitter],
		emits: ["update:modelValue", "change"],
		props: {
			// 通过双向绑定控制组件的弹出与收起
			value: {
				type: String,
				default: ''
			},
			modelValue: {
				type: String,
				default: ''
			},
			activeColor: {
				type: String,
				default: "#19be6b"
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
			// 顶部标题
			title: {
				type: String,
				default: '选择车牌号码'
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
			}
		},
		data() {
			return {
				isload:true,
				numberIndex:0,
				numbers: [{
					value: '',
					focus: true
				}, {
					value: '',
					focus: false
				}, {
					value: '',
					focus: false
				}, {
					value: '',
					focus: false
				}, {
					value: '',
					focus: false
				}, {
					value: '',
					focus: false
				}, {
					value: '',
					focus: false
				}, {
					value: '',
					focus: false,
					eco: true
				}],
				 keyboard: [],
				 popupValue:false,
				
			 
				 provinces: [
				   ['京', '津', '沪', '渝', '冀', '豫', '云', '辽', '黑'],
				   ['湘', '皖', '鲁', '新', '苏', '浙', '赣', '鄂', '桂'],
				   ['甘', '晋', '蒙', '陕', '吉', '闽', '贵', '粤', '青'],
				   ['藏', '川', '宁', '琼', '使', '无', {
					 value: '',
					 empty: true
				   }, {
					   value: '',
					   empty: true
					 }, {
					   value: '',
					   backspace: true
					 }],
				 ],
			 
				 nomals: [
				   ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
				   ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'O', 'P', '港'],
				   ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', '澳'],
				   ['Z', 'X', 'C', 'V', 'B', 'N', 'M', '学', '领', {
					 value: '',
					 backspace: true
				   }],
				 ],
			 
				 ecos: [
				   ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
				   ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'O', 'P', {
					   value: '港',
					   disabled: true
					 }],
				   ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', {
					 value: '澳',
					 disabled: true
				   }],
				   ['Z', 'X', 'C', 'V', 'B', 'N', 'M', {
					 value: '学',
					 disabled: true
				   }, {
					   value: '领',
					   disabled: true
					 }, {
					   value: '',
					   backspace: true
					 }],
				 ],
				 uForm:{
				 	inputAlign: "",
				 	clearable: ""
				 }
			};
		},
		watch: {
			// 在select弹起的时候，重新初始化所有数据
			value: {
				immediate: true,
				handler(val) {
					if (val) setTimeout(() => this.init(val), 10);
				}
			},
			modelValue: {
				immediate: true,
				handler(val) {
					if (val) setTimeout(() => this.init(val), 10);
				}
			}
		},
		computed: {
			uZIndex() {
				// 如果用户有传递z-index值，优先使用
				return this.zIndex ? this.zIndex : this.$u.zIndex.popup;
			},
		},
		mounted() {
			let parent = this.$u.$parent.call(this, 'u-form');
			if (parent) {
				Object.keys(this.uForm).map(key => {
					this.uForm[key] = parent[key];
				});
			}
		},
		methods: {
			init(val) {
				const _nums = this.numbers;
				for(let index=0;index<val.length;index++){
					let value = val.charAt(index)
					_nums[index].value = value
				}
				this.numbers = _nums
			},
			changeNumberFocus(_index){
				const _nums = this.numbers;
				_nums.forEach((item, index) => {
					item.focus = index == _index;
				});
				this.numbers = _nums
				if (_index == 0) {
					this.changeKeyboardType(1);
				} else if (_index == 7) {
					this.changeKeyboardType(3);
				} else {
					this.changeKeyboardType(2);
				}
			},
			changeNumber(e) {
			  const _index = e.currentTarget.dataset.index;
			  this.numberIndex = _index
			  this.changeNumberFocus(_index)
			  this.popupValue = true
			},
			changeKeyboardType(keyboardType) {
			  switch (keyboardType) {
				case 1:
				  this.setData({
					keyboard: this.provinces
				  });
				  break;
				case 2:
				  this.setData({
					keyboard: this.nomals
				  });
				  break;
				case 3:
				  this.setData({
					keyboard: this.ecos
				  });
				  break;
			  }
			},
		
			show() {
			  if (!this.show) {
				this.setData({
				  show: true
				});
			  }
			},
		
			hide(e) {
			  this.setData({
				show: false
			  });
			},		
			deleteNum(e) {
				this.numbers[this.numberIndex].value = ''
				if(this.numberIndex==0){
					return;
				}
				this.numberIndex = this.numberIndex-1
				this.changeNumberFocus(this.numberIndex)
			},		
			clickNum(e) {
				this.numbers[this.numberIndex].value = e.target.dataset.value
				if(this.numberIndex==7){
					let index = this.numbers.findIndex(item=>{return !item.value})
					if(index!=-1 && index<=6){
						uni.$u.toast("请输入正确的车牌号码")
						return;
					}
					this.confirm()
					return
				}
				this.numberIndex = this.numberIndex+1
				this.changeNumberFocus(this.numberIndex)
			},			
			//点击取消按钮触发
			close() {
				//默认加载不验证
				if(!this.isload){
					this.confirm()
					this.isload = false
				}
				this.popupValue = false
			},
			//提交触发
			confirm() {
				let index = this.numbers.findIndex(item=>{return !item.value})
				if(index>=0 && index<=6){
					uni.$u.toast("请选择正确车牌号码")
					return;
				}
				let value = this.numbers.map(item => item.value).join('')
				this.$emit("update:modelValue", value);
				this.popupValue = false
				// vue 原生的方法 return 出去
				this.$emit("change", value);
				// 将当前的值发送到 u-form-item 进行校验
				this.dispatch("u-form-item", "onFieldBlur", value);
			}
		}
	};
</script>

<style scoped lang="scss">
	@import "../../libs/css/style.components.scss";

	.diy-car-input{
		width:100%;
		padding:10rpx;
	}
	.car-number-input {
		display: flex;
		flex-direction: row;
		align-items: center;
		width: 100%;
		justify-content: space-around;
	}
	
	.car-number-input .cell {
		width: 70rpx;
		height: 90rpx;
		display: flex;
		flex-direction: row;
		align-items: center;
		justify-content: center;
		font-size: 40rpx;
		background-color: #f7f7f7;
		border-radius: 10rpx;
		color: #333;
	}
	
	.car-number-input .cell.focus {
		border: 1rpx solid var(--car-color);
		box-shadow: 0rpx 0rpx 10rpx var(--car-color);
	}
	
	.car-number-input .cell .cursor {
		width: 2rpx;
		height: 30rpx;
		background-color: var(--car-color);
		animation: flashing 1.2s infinite steps(1, start);
	}
	
	@keyframes flashing {
	
		0%,
		100% {
			background-color: var(--car-color);
		}
	
		50% {
			background-color: transparent;
		}
	}
	
	.car-number-input .cell.eco {
		background-color: var(--car-alpha-color);
	}
	
	.car-number-input .cell.eco.focus {
		border-color: #36d292;
		box-shadow: 0rpx 0rpx 10rpx #36d292;
	}
	
	.car-number-input .cell.eco .cursor {
		background-color: #36d292;
		animation: flashing-eco 1.2s infinite steps(1, start);
	}
	
	@keyframes flashing-eco {
	
		0%,
		100% {
			background-color: #36d292;
		}
	
		50% {
			background-color: transparent;
		}
	}
	
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
			height: 480rpx;
			overflow: hidden;
			background-color: #ebecec;

			.keyboard {
				
				display: flex;
				flex-direction: column;
				padding: 40rpx 10rpx;
			}

			.keyboard .row {
				display: flex;
				flex-direction: row;
				align-items: center;
				justify-content: space-around;
				margin-bottom: 20rpx;
			}

			.keyboard .row:last-child {
				margin-bottom: 0;
			}

			.keyboard .row .col {
				width: 65rpx;
				height: 84rpx;
				line-height: 84rpx;
				text-align: center;
				background-color: #ffffff;
				border-radius: 10rpx;
				margin-right: 15rpx;
				box-shadow: 0rpx 6rpx 5rpx #888888;
			}

			.keyboard .row .col:last-child {
				margin-right: 0;
			}

			.keyboard .row .col:active {
				box-shadow: 0rpx 0rpx 0rpx #888888;
			}


			.keyboard .row .col.disabled {
				color: #c6c6c8;
			}

			.keyboard .row .col.empty {
				background-color: transparent;
				box-shadow: unset;
			}

			.keyboard .row .col.backspace {
				display: flex;
				flex-direction: column;
				align-items: center;
				justify-content: center;
			}

			.keyboard .row .col.backspace .icon {
				width: 42rpx;
				height: 28rpx;
			}

		}
	}
</style>
