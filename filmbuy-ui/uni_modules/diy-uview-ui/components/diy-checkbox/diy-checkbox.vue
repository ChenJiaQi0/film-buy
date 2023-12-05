<template>
	<view  class="diy-checkbox diygw-col-24" :class="{'scroll-view':horizontal}" :style="{'--active-color':activeColor,'--active-bg-color':activeBgColor,'--item-color':itemColor,'--item-bg-color':itemBgColor,'--item-border-color':itemBorderColor,'--item-disabled-bg-color':itemDisableBgColor,'--item-disabled-color':itemDisableColor,'--item-radius':radius}">
		<view v-for="(item,i) in renderList" class="diy-checkbox-item" :class="'diygw-col-'+col" :key="i">
			<view class="item" :class="{
				'noslot':!$slots.default && !$slots.$default,
				'nogouxuan':!isGouxuan,
				'disabled':item[disabledField]||isDisabled,
				'active':item.checked,
			}" :data-i="i" @tap="selectItem" :data-id="item[valueField]">
			<text v-if="!$slots.default && !$slots.$default">{{item[labelField]}}</text>
			<slot v-else style="width: 100%;" :item="item"  :index="i"/>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		emits: ["update:modelValue", "change"],
		props: {
			// 通过双向绑定控制组件的弹出与收起
			// 绑定的值
			value: {
				type: [String, Number,Array],
				default: []
			},
			// 通过双向绑定控制组件的弹出与收起
			// 绑定的值
			modelValue: {
				type: [String, Number,Array],
				default: []
			},
			//选择类型
			mode:{
				type:String,
				default:'checkbox' //type:checkbox 或者radio
			},
			valueField:{
				type:String,
				default: "value"
			},
			labelField:{
				type:String,
				default: "label"
			},
			disabledField:{
				type:String,
				default: "disabled"
			},
			//布局占位
			col:{
				type:String,
				default: "8"
			},
			// 选中颜色
			activeColor: {
				type: String,
				default: "#19be6b"
			},
			// 选中背景颜色
			activeBgColor: {
				type: String,
				default: "#f5fff9"
			},
			// 默认颜色
			itemColor:{
				type: String,
				default: "#333333"
			},
			// 默认边框颜色
			itemBorderColor:{
				type: String,
				default: "#e5e5e5"
			},
			// 默认背景颜色
			itemBgColor:{
				type: String,
				default: "#fefefe"
			},
			// 禁止背景颜色
			itemDisableBgColor:{
				type:String,
				default:'#f1f1f1'
			},
			// 禁止字体颜色
			itemDisableColor:{
				type:String,
				default:'#d8d8d8'
			},
			
			// 列数据
			list: {
				type: Array,
				default () {
					return [];
				}
			},
			//最大可选
			maxSize:{
				type:Number,
				default:0
			},
			// //是否所有禁止
			allDisabled:{
				type:Boolean,
				default:false
			},
			//圆角大小
			radius:{
				type:String,
				default:'0px'
			},
			//强制水平,如开启后，会水平滚动
			horizontal:{
				type:Boolean,
				default:false
			},
			//是否钩选
			isGouxuan:{
				type:Boolean,
				default:true
			}
		},
		data() {
			return {
				renderList: [],
				isDisabled: false,
				uForm: {
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
					setTimeout(() => this.init(), 10);
				}
			},
			modelValue: {
				immediate: true,
				handler(val) {
					setTimeout(() => this.init(), 10);
				}
			},
			list: {
				immediate: true,
				deep:true,
				handler(val) {
					setTimeout(() => this.init(), 10);
				}
			},
		},
		mounted() {
			this.init()
		},
		methods: {
			init() {
				this.renderList = JSON.parse(JSON.stringify(this.list))
				let value = []
				// #ifndef VUE3
				if(this.mode=='radio'){
					value = [this.value];
				}else{
					value = this.value;
				}
				// #endif
				
				// #ifdef VUE3
				if(this.mode=='radio'){
					value = [this.modelValue];
				}else{
					value = this.modelValue;
				}
				// #endif
				this.isDisabled = this.allDisabled
				this.renderList.forEach(item => {
					item.checked = value.includes(item[this.valueField])
				})
			},
			emitSelect(){
				const values = []
				this.renderList.forEach(item => {
					if (item.checked) {
						values.push(item[this.valueField])
					}
				})
				if(this.mode=='radio'){
					if(values.length>0){
						this.$emit("update:modelValue", values[0]);
						this.$emit("change", values[0]);
					}else{
						this.$emit("update:modelValue", undefined);
						this.$emit("change", undefined);
					}
				}else{
					this.$emit("update:modelValue", values);
					this.$emit("change", values);
				}
				
			},
			/* 切换 */
			selectItem(e) {
				let i = Number(e.currentTarget.dataset.i);
				if (this.isDisabled||this.renderList[i][this.disabledField]) {
					return;
				}
				/* 单选框 */
				if (this.mode == 'radio') {
					this.index = i;
					let checked = this.renderList[i].checked
					this.renderList.forEach(item => {
						item.checked = false
					})
					this.renderList[i].checked = !checked
					this.emitSelect()
					return;
				}
				/* 复选框 */
				
				if(this.renderList[i].checked){
					this.renderList[i].checked = !this.renderList[i].checked
					this.emitSelect()
				}else{
					if(this.maxSize){
						let pickerSize = 0;
						this.renderList.forEach((item,index)=>{
							if(item.checked){
								pickerSize++;
							}
						});
						// 当已选值数量 >= 允许的最大选择值时触发
						if(pickerSize >= this.maxSize){
							uni.$u.toast('超出最大选择')
							return;
						}
					}
					this.renderList[i].checked = !this.renderList[i].checked
					this.emitSelect()
				}
			},
			/* 全部选中 */
			checkAll() {
				if (this.isDisabled) {
					return;
				}
				if (this.mode == 'radio') {
					return null;
				}
				
			},
			/* 取消全部选中 */
			cancelAll() {
				if (this.isDisabled) {
					return;
				}
				if (this.mode == 'radio') {
					this.index = -1;
					return null;
				}
				this.renderList.forEach(item => {
					item.checked = false
				})
				this.emitSelect()
			},
			/* 反选全部 */
			invertAll() {
				if (this.isDisabled) {
					return;
				}
				if (this.mode == 'radio') {
					this.index = -1;
					return null;
				}
				this.renderList.forEach(item => {
					item.checked = !item.checked
				})
				this.emitSelect()
			},
			/* 禁用 */
			disabled(flag = undefined) {
				this.isDisabled = flag;
			}
		}
	};
</script>
<style lang="scss">
	
	 /* #ifdef MP-WEIXIN */
	.diy-checkbox .item > view {
	  width:100%;
	  height: 100%;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  box-sizing: border-box;
	  border-radius: var(--item-radius);
	  border: var(--item-border-color) solid 1px;
	  background-color: var(--item-bg-color);
	  position: relative;
	  overflow: hidden;
	  .flex-content{
		  width:100%;
		  height:100%;
	  }
	}
	
	.diy-checkbox .item.active> view  {
			background-color: var(--active-bg-color);
			color: var(--active-color);
			border: var(--active-color) solid 1px;
			
			&::before {
				content: '';
				display: block;
				width: 20px;
				height: 20px;
				background-color: var(--active-color);
				position: absolute;
				right: -1px;
				bottom: -1px;
				z-index: 1;
				clip-path: polygon(100% 0, 0% 100%, 100% 100%);
			}
			
			&::after {
				content: '';
				display: block;
				width: 3px;
				height: 6px;
				border-right: #fff solid 2px;
				border-bottom: #fff solid 2px;
				transform: rotate(25deg);
				position: absolute;
				right: 3px;
				bottom: 3px;
				z-index: 2;
			}
			
			// 选中状态下的禁用样式
			&.disabled {
				background-color: #f1f1f1;
				color: #d8d8d8;
				border: #e5e5e5 solid 1px;
			
				&::before {
					background-color: #d9d9d9;
				}
			}
			
			&.nogouxuan{
				&::before,&:after {
					display: none;
				}
			}
	}
	/* #endif */
</style>
<style scoped lang="scss">
	.diy-checkbox {
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
		justify-content: flex-start;
		align-items: stretch;
		align-content: center;
		padding:0px;
		text-align: center;
		&.scroll-view {
			overflow-x: auto;
			flex-wrap: nowrap;
		}
		.diy-checkbox-item {
			padding: 10rpx;
			box-sizing: border-box;
		}

		.noslot>view,.item>view{
			width:100%;
		}
		
		.noslot {
			width:100%;
			height: 100%;
			display: flex;
			justify-content: center;
			align-items: center;
			box-sizing: border-box;
			border-radius: var(--item-radius);
			border: var(--item-border-color) solid 1px;
			background-color: var(--item-bg-color);
			color: var(--item-color);
			position: relative;
			overflow: hidden;
			padding: 20rpx;
			
			// 未选中状态下的禁用样式
			&.disabled {
				background-color:var(--item-disabled-bg-color);
				color:var(--item-disabled-color);
			}
			
           
			&.active {
				background-color: var(--active-bg-color);
				color: var(--active-color);
				border: var(--active-color) solid 1px;

				&::before {
					content: '';
					display: block;
					width: 20px;
					height: 20px;
					background-color: var(--active-color);
					position: absolute;
					right: -1px;
					bottom: -1px;
					z-index: 1;
					clip-path: polygon(100% 0, 0% 100%, 100% 100%);
				}

				&::after {
					content: '';
					display: block;
					width: 3px;
					height: 6px;
					border-right: #fff solid 2px;
					border-bottom: #fff solid 2px;
					transform: rotate(25deg);
					position: absolute;
					right: 3px;
					bottom: 3px;
					z-index: 2;
				}

				// 选中状态下的禁用样式
				&.disabled {
					background-color: #f1f1f1;
					color: #d8d8d8;
					border: #e5e5e5 solid 1px;

					&::before {
						background-color: #d9d9d9;
					}
				}
				
				&.nogouxuan{
					&::before,&:after {
						display: none;
					}
				}
			}
		}
		
		/* #ifndef MP-WEIXIN */
		.item {
			width:100%;
			height: 100%;
			display: flex;
			justify-content: center;
			align-items: center;
			box-sizing: border-box;
			border-radius: var(--item-radius);
			border: var(--item-border-color) solid 1px;
			background-color: var(--item-bg-color);
			color: var(--item-color);
			position: relative;
			overflow: hidden;
			&.noslot{
				padding: 20rpx;
			}
			// 未选中状态下的禁用样式
			&.disabled {
				background-color:var(--item-disabled-bg-color);
				color:var(--item-disabled-color);
			}
			
		   
			&.active {
				background-color: var(--active-bg-color);
				color: var(--active-color);
				border: var(--active-color) solid 1px;
		
				&::before {
					content: '';
					display: block;
					width: 20px;
					height: 20px;
					background-color: var(--active-color);
					position: absolute;
					right: -1px;
					bottom: -1px;
					z-index: 1;
					clip-path: polygon(100% 0, 0% 100%, 100% 100%);
				}
		
				&::after {
					content: '';
					display: block;
					width: 3px;
					height: 6px;
					border-right: #fff solid 2px;
					border-bottom: #fff solid 2px;
					transform: rotate(25deg);
					position: absolute;
					right: 3px;
					bottom: 3px;
					z-index: 2;
				}
		
				// 选中状态下的禁用样式
				&.disabled {
					background-color: #f1f1f1;
					color: #d8d8d8;
					border: #e5e5e5 solid 1px;
		
					&::before {
						background-color: #d9d9d9;
					}
				}
				
				&.nogouxuan{
					&::before,&:after {
						display: none;
					}
				}
			}
		}
		/* #endif */
	}
</style>