<template>
	<view>
		<view class="u-upload">
			<view style="display: inline-block;" @tap="showSignature">
				<view
					v-if="!defaultValue"
					class="u-list-item u-add-wrap"
					hover-class="u-add-wrap__hover"
					hover-stay-time="150"
					:style="{
						width: $u.addUnit(200),
						height: $u.addUnit(200)
					}"
				>
					<u-icon name="plus" class="u-add-btn" size="40"></u-icon>
					<view class="u-add-tips">{{ title }}</view>
				</view>
				
				<image class="u-list-item u-add-wrap" v-if="defaultValue" :style="{
						width: $u.addUnit(200),
						height: $u.addUnit(200)
					}" :src="defaultValue"></image>
			</view>
		</view>
		<view class="mask" v-if="isShow" @touchmove.stop.prevent="moveHandle"></view>
		<view class="diy-signature"  v-if="isShow" :class="!isShow?'hide':'show'"  :style="{top: `${customBarHeight}px`, height: `calc(100% - ${customBarHeight}px)`}">
			<view class="diy-signature-wrap">
				<canvas class="diy-signature-canvas" :canvas-id="canvasId" :id="canvasId" @touchstart="canvasStart($event)"
					@touchmove="canvasMove($event)">
				</canvas>
				<view :class="['action-box',horizontalScreen?'horizontalScreen':'']">
					<view class="action-bar" :style="{color:color}">
						<view class="action-open">
							<text class="flex icon diy-icon-write" @click="openAction('diyLine')"
								v-if="judge('pencli')"></text>
							<text class="flex icon diy-icon-colorlens" @click="openAction('diyColor')"
								v-if="judge('color')"></text>
							<text class="flex icon diy-icon-weibiaoti545" @click="goBack" v-if="judge('back')"></text>
							<text class="flex icon diy-icon-rubber" @click="clear" v-if="judge('clear')"></text>
							<text class="flex icon diy-icon-close" @click="close" v-if="judge('clear')"></text>
						</view>
					</view>
					<view class="diy-submit" :style="{background:color}" @click="saveCanvas">确定</view>
				</view>
				<diy-color :horizontalScreen="horizontalScreen" ref="diyColor" @setColor="setColor"></diy-color>
				<diy-line  :horizontalScreen="horizontalScreen" ref="diyLine" @setLine="setLine"></diy-line>
			</view>
		</view>
	</view>
</template>

<script>
	import Emitter from "../../libs/util/emitter.js";
	/**
	 * @property {Array} actionBar 操作按钮配置 pencli(线条)  color(颜色)  back(返回)  clear(清空)
	 * @property {String} canvasId CanvasId
	 * @property {Boolean} isDownload 是否下载签名
	 * @property {Boolean} horizontalScreen 是否横屏
	 * @property {String} fileName 文件名称
	 * @property {String} delineColor 线颜色
	 * @property {Number} delineWidth 线宽度
	 **/
	import diyColor from "./diy-color.vue"
	import diyLine from "./diy-line.vue"
	export default {
		mixins: [Emitter],
		props: {
			value: {
				type: [String, Number],
				default: ""
			},
			modelValue: {
				type: [String, Number],
				default: ""
			},
			customBarHeight:{
				type: [String, Number],
				default: 0
			},
			//canvasId
			canvasId: {
				type: String,
				default: `diy-${Date.now()}`
			},
			title:{
				type: String,
				default: `点击签名`
			},
			//配置栏
			actionBar: {
				type: Array,
				default: () => {
					return [
						'pencli',
						'color',
						'back',
						'clear'
					]
				}
			},
			//是否下载签名
			isDownload: {
				type: Boolean,
				default: false
			},
			//是否横屏
			horizontalScreen: {
				type: Boolean,
				default: true
			},
			//文件名称
			fileName: {
				type: String,
				default: '签名'
			},
			//线颜色
			delineColor: {
				type: String,
				default: '#000'
			},
			//线宽度
			delineWidth: {
				type: Number,
				default: 4
			},
			color:{
				type: String,
				default: '#19be6b'
			}
		},
		data() {
			return {
				defaultValue: "",
				context: "",
				isShow:false,
				actionShow: true,
				history: [],
				lineColor: "#000",
				lineWidth: 4
			}
		},
		watch: {
			// 在select弹起的时候，重新初始化所有数据
			value: {
				immediate: true,
				handler(val) {
					this.defaultValue = val;
				}
			},
			modelValue: {
				immediate: true,
				handler(val) {
					this.defaultValue = val;
				}
			},
		},
		components: {
			diyColor,
			diyLine
		},
		created() {
			// #ifndef VUE3
			this.defaultValue = return this.value;
			// #endif
					
			// #ifdef VUE3
			this.defaultValue = this.modelValue;
			// #endif
		},
		mounted() {
			this.lineColor = this.delineColor
			this.lineWidth = this.delineWidth
			const ctx = uni.createCanvasContext(this.canvasId, this)
			this.context = ctx;
		},
		methods: {
			moveHandle(){
				
			},
			showSignature(){
				this.isShow = true 
			},
			//操作栏显示控制
			judge(key) {
				if (this.actionBar.includes(key)) {
					return true
				} else {
					return false;
				}
			},
			//打开选择器
			openAction(ref) {
				this.$refs[ref].checkModel()
			},
			//设置颜色
			setColor(color) {
				this.lineColor = color;
			},
			//设置线条
			setLine(width) {
				this.lineWidth = width;
			},
			//保存
			async saveCanvas() {
				const tempFilePath = await this.canvasToFilPath()
				this.defaultValue = tempFilePath;
				this.$emit("update:modelValue", tempFilePath);
				this.$emit("change", tempFilePath);
				// 将当前的值发送到 u-form-item 进行校验
				setTimeout(() => {
					// 将当前的值发送到 u-form-item 进行校验
					this.dispatch("u-form-item", "onFieldChange", tempFilePath);
				}, 60);
				this.isShow = false
				if (!this.isDownload) {
					return false;
				}
				return new Promise((resolve, reject) => {
					// #ifdef H5
					try {
						const a = document.createElement('a')
						a.href = tempFilePath
						a.download = this.fileName
						document.body.appendChild(a)
						a.click()
						a.remove()
						resolve()
					} catch (e) {
						reject(e)
					}
					// #endif
					// #ifndef H5
					uni.saveImageToPhotosAlbum({
						filePath: tempFilePath,
						success(resObj) {
							this.$emit('confirm', tempFilePath)
							resolve(resObj)
						},
						fail(err) {
							this.$emit('dowmloadErr', err)
							reject(err)
						}
					})
					// #endif
				})
			},
			imgToBase64Func(filePath){
				return new Promise((resolve, reject) => {
					let baseFormat = 'data:image/png;base64,';
					let base64 = wx.getFileSystemManager().readFileSync(filePath, 'base64');
					resolve(baseFormat + base64);
				});
			},
			// 保存临时路径
			canvasToFilPath(conf = {}) {
				let thiz = this
				return new Promise((resolve, reject) => {
					uni.canvasToTempFilePath({
						canvasId: thiz.canvasId,
						success: async res => {
							// #ifdef MP-WEIXIN
							 let base64Image = await thiz.imgToBase64Func(res.tempFilePath);
							 resolve(base64Image)
							 // #endif
							 // #ifndef MP-WEIXIN
							resolve(res.tempFilePath)
							 // #endif
						},
						fail: err => {
							reject(err)
						}
					},this)
				})
			},
			//撤回
			goBack() {
				this.context.draw()
				this.history.pop();
				this.history.forEach((item, index) => {
					let {
						color,
						width
					} = item.style
					this.context.beginPath()
					this.context.setLineCap('round')
					this.context.setStrokeStyle(color)
					this.context.setLineWidth(width)
					if (item.coordinates.length >= 2) {
						item.coordinates.forEach(it => {
							if (it.type == 'touchstart') {
								this.context.moveTo(it.x, it.y)
							} else {
								this.context.lineTo(it.x, it.y)
							}
						})
					} else {
						const point = item.coordinates[0]
						this.context.moveTo(point.x, point.y)
						this.context.lineTo(point.x + 1, point.y)
					}
					this.context.stroke()
				})
				this.context.draw(true)
			},
			close(){
				this.clear()
				let tempFilePath = ''
				this.defaultValue = tempFilePath;
				this.$emit("update:modelValue", tempFilePath);
				this.$emit("change", tempFilePath);
				// 将当前的值发送到 u-form-item 进行校验
				setTimeout(() => {
					// 将当前的值发送到 u-form-item 进行校验
					this.dispatch("u-form-item", "onFieldChange", tempFilePath);
				}, 60);
				this.isShow = false
			},
			//清空画布
			clear() {
				this.history = [];
				this.context.draw()
			},
			canvasStart(event) {
				let {
					x,
					y
				} = event.touches[0]
				this.history.push({
					style: {
						color: this.lineColor,
						width: this.lineWidth
					},
					coordinates: [{
						type: event.type,
						x: x,
						y: y
					}]
				})
				this.drawGraphics()
			},
			canvasMove(e) {
				// e.preventDefault()
				let {
					x,
					y
				} = e.touches[0]
				this.history[this.history.length - 1].coordinates.push({
					type: e.type,
					x: x,
					y: y
				})
				this.drawGraphics()
			},
			//绘制
			drawGraphics() {
				let historyLen = this.history.length
				if (!historyLen) return
				let currentData = this.history[historyLen - 1]
				let coordinates = currentData.coordinates
				if (!coordinates.length) return
				let startPoint, endPoint;
				if (coordinates.length < 2) {
					startPoint = coordinates[coordinates.length - 1]
					endPoint = {
						x: startPoint.x + 1,
						y: startPoint.y
					}
				} else {
					startPoint = coordinates[coordinates.length - 2]
					endPoint = coordinates[coordinates.length - 1]
				}
				let style = currentData.style
				this.context.beginPath()
				this.context.setLineCap('round')
				this.context.setStrokeStyle(style.color)
				this.context.setLineWidth(style.width)
				this.context.moveTo(startPoint.x, startPoint.y)
				this.context.lineTo(endPoint.x, endPoint.y)
				this.context.stroke()
				this.context.draw(true)
			}
		}
	}
</script>

<style lang="scss" scoped>
	@import "../../libs/css/style.components.scss";
	.diy-signature-canvas {
		width: 100%;
		height: 100%;
		box-sizing: border-box;
		background-color: #E6E6E6;
	}
	
	.u-list-item {
		width: 200rpx;
		height: 200rpx;
		overflow: hidden;
		margin: 10rpx;
		background: rgb(244, 245, 246);
		position: relative;
		border-radius: 10rpx;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.u-add-wrap {
		flex-direction: column;
		color: $u-content-color;
		font-size: 26rpx;
	}

	.u-add-tips {
		margin-top: 20rpx;
		line-height: 40rpx;
	}

	.u-add-wrap__hover {
		background-color: rgb(235, 236, 238);
	}
	.horizontalScreen {
		left: -150upx !important;
		bottom: 0 !important;
		right: auto !important;
		transform: rotate(90deg);
		transform-origin: bottom right;
	}

	.rote-text {
		transform: rotate(90deg);
	}

	.action-box {
		position: absolute;
		bottom: 0;
		right: 0;
		z-index: 50;
		display: flex;
		flex-direction: column;
		align-items: flex-end;
	}

	.diy-submit {
		width: 150upx;
		height: 100upx;
		background-color: #19be6b;
		border-radius: 60upx 0 0 0;
		display: flex;
		align-items: center;
		justify-content: center;
		color: #FFFFFF;
		font-size: 30upx;
	}

	.action-bar {
		margin-bottom: 30upx;
		margin-right: 35upx;

		.icon {
			padding: 5px;
			font-size: 48rpx;
			transition: all 0.3s;
		}

	}
    .mask{
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		overflow: hidden;
		background-color: #fff;
		z-index: 999999998;
	}
	.diy-signature {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		overflow: hidden;
		background-color: #fff;
		z-index: 999999999;
		padding: 20px;
		box-sizing: border-box;
		&.hide{
			display: none;
		}
		.show{
			display: flex;
		}

		.diy-signature-wrap {
			box-sizing: border-box;
			background-color: #fff;
			border-radius: 20rpx;
			padding: 12px 12px;
			width: 100%;
			height: 100%;
			position: relative;
			box-shadow: 0 6rpx 42rpx rgba(0, 0, 0, 0.05);
		}
	}

	.roteRight {
		transform: rotate(136deg);
	}

	.roteLeft {
		transform: rotate(0deg);
	}

	.action-open {
		animation: bounceIn 1s;
	}

	.action-close {
		animation: bounceOut 0.5s forwards;
	}

	@keyframes bounceIn {

		0%,
		20%,
		40%,
		60%,
		80%,
		to {
			-webkit-animation-timing-function: cubic-bezier(.215, .61, .355, 1);
			animation-timing-function: cubic-bezier(.215, .61, .355, 1)
		}

		0% {
			opacity: 0;
			-webkit-transform: scale3d(.3, .3, .3);
			transform: scale3d(.3, .3, .3)
		}

		20% {
			-webkit-transform: scale3d(1.1, 1.1, 1.1);
			transform: scale3d(1.1, 1.1, 1.1)
		}

		40% {
			-webkit-transform: scale3d(.9, .9, .9);
			transform: scale3d(.9, .9, .9)
		}

		60% {
			opacity: 1;
			-webkit-transform: scale3d(1.03, 1.03, 1.03);
			transform: scale3d(1.03, 1.03, 1.03)
		}

		80% {
			-webkit-transform: scale3d(.97, .97, .97);
			transform: scale3d(.97, .97, .97)
		}

		to {
			opacity: 1;
			-webkit-transform: scaleX(1);
			transform: scaleX(1)
		}
	}

	@keyframes bounceOut {
		20% {
			-webkit-transform: scale3d(.9, .9, .9);
			transform: scale3d(.9, .9, .9)
		}

		50%,
		55% {
			opacity: 1;
			-webkit-transform: scale3d(1.1, 1.1, 1.1);
			transform: scale3d(1.1, 1.1, 1.1)
		}

		to {
			opacity: 0;
			-webkit-transform: scale3d(.3, .3, .3);
			transform: scale3d(.3, .3, .3);
			display: none;
		}
	}
</style>
