<template>
	<view class="barcode" >
		<!-- #ifndef MP-ALIPAY -->
		<canvas :canvas-id="elid" :id="elid"  type="2D" :style="{width:canvasWidth+'px',height:canvasHeight+'px'}" />
		<!-- #endif -->
		<!-- #ifdef MP-ALIPAY -->
		<canvas :id="elid" :width="canvasWidth" :height="canvasHeight" />
		<!-- #endif -->
	</view>
</template>

<script>
	import JsBarcode from "./jsbarcode/JsBarcode.js"
	export default {
		data() {
			return {
				canvasWidth: 0,
				canvasHeight: 0,
				elid: this.$u.guid()
			}
		},
		props: {
			format:{
				type: String,
				default: 'CODE128'
			},
			text: {
				type: String,
				default: '123'
			},
			width: {
				type: Number,
				default: 2
			},
			height: {
				type: Number,
				default: 60
			},
			background: {
				type: String,
				default: '#ffffff'
			},
			fontSize:{
				type: Number,
				default: 20
			},
			margin:{
				type: Number,
				default: 5
			},
			// fontColor: {
			// 	type: String,
			// 	default: '#000000'
			// },
			lineColor: {
				type: String,
				default: '#000000'
			},
			displayValue: {
				type: Boolean,
				default: true
			},
			//bottom 或者 top
			textPosition:{
				type: String,
				default: 'bottom'
			}	
		},
		// 在实例挂载完成后被立即调用
		//兼容非动态取值(二维码为固定内容)
		mounted() { 
			this.renderCode()
		},
		watch: {
			text(newVal, oldVal) { //监测到text值发生改变时重新绘制
				this.renderCode()
			}
		},
		methods: {
			// 二维码生成工具
			renderCode() {
				let ctx = uni.createCanvasContext(this.elid,this)
				JsBarcode(ctx, this.text, {
					  format:this.format,
					  thiz:this,
					  width:this.width,
					  height:this.height,
					  background:this.background,
					  lineColor:this.lineColor,
					  margin:this.margin,
					  fontSize:this.fontSize,
					  fontColor:this.fontColor,
					  textPosition:this.textPosition,
					  displayValue: this.displayValue
				});
			}
		}
	}
</script>

<style>
	.barcode {
		display: flex;
		align-items: center;
		justify-content: center;
	}
</style>