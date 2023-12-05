<template>
	<view class="diy-qrcode-page" v-if="popupValue">
		<view class="diy-code-close" @click="closeClick()">
			<text class="diy-icon-close"></text>
		</view>
		<view class="box diy-video-nav">
			<video id="video_nav_id" class="diy-qrcode-video" autoplay :controls="false"></video>
		</view>
		<view class="box">
			<view class="line"></view>
			<view class="angle"></view>
		</view>
	</view>
</template>

<script>
	import ZXing from "./zxing.js"
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
			}
		},
		watch: {
			// 在select弹起的时候，重新初始化所有数据
			value: {
				immediate: true,
				handler(val) {
					if (val) setTimeout(() => this.initEvent(), 10);
					this.popupValue = val;
				}
			},
			modelValue: {
				immediate: true,
				handler(val) {
					if (val) setTimeout(() => this.initEvent(), 10);
					this.popupValue = val;
				}
			},
		},
		data() {
			return {
				popupValue: false,
				codeReader: null,
				videoInputDevices: [],
				deviceId: null
			}
		},
		methods: {
			initEvent() {
				this.windowWidth = document.documentElement.clientWidth || document.body.clientWidth
				this.windowHeight = document.documentElement.clientHeight || document.body.clientHeight
				this.maskWidth = this.windowWidth / 2 - this.canvasWidth / 2
				this.maskHeight = this.windowHeight / 2 - this.canvasHeight / 2
				var video = document.getElementById('video_nav_id').getElementsByTagName('video')[0]
				video.setAttribute('id', 'video_id')
				video.setAttribute('class','diy-video-class')
				video.style.width = 300
				video.style.height = 300

				this.codeReader = new ZXing.BrowserMultiFormatReader();
				this.codeReader.listVideoInputDevices().then(res => {
					if (res.length > 0) {
						this.videoInputDevices = res
						this.deviceId = res[1].deviceId
					} else {
						uni.showModal({
							title: '提示',
							content: '当前没有可用视频通道',
							showCancel: false
						});
					}
				}).catch(err => {
					console.log(err)
					// uni.showToast({
					// 	title: `初始化失败`,
					// 	icon: 'none'
					// });
				})
				this.startScanning()
			},

			startScanning() {
				try {
					let thiz = this
					this.codeReader.decodeFromVideoDevice(this.deviceId, 'video_id', (res, err) => {
						if (res) {
							this.codeReader.reset()
							this.codeReader = null
							thiz.$emit("result", res);
							thiz.$emit("update:modelValue", false);
						}
					})
				} catch (err) {
					console.log(err)
					// uni.showToast({
					// 	title: `初始化失败${err}`,
					// 	icon: 'none'
					// });
				}
			},
			closeClick() {
				this.codeReader.reset()
				this.codeReader = null
				this.$emit("update:modelValue", false);
			}
		}
	}
</script>

<style scoped lang="scss">
	.diy-qrcode-page {
		width: 100vw;
		height: 100vh;
		position: fixed;
	    top:0;
		left:0;
		background-size: 3rem 3rem;
		background-position: -1rem -1rem;
		z-index: 99999999;
		background-image: linear-gradient(
		    0deg,
		    transparent 24%,
		    rgba(32, 255, 77, 0.1) 25%,
		    rgba(32, 255, 77, 0.1) 26%,
		    transparent 27%,
		    transparent 74%,
		    rgba(32, 255, 77, 0.1) 75%,
		    rgba(32, 255, 77, 0.1) 76%,
		    transparent 77%,
		    transparent
		  ),
		  linear-gradient(
		    90deg,
		    transparent 24%,
		    rgba(32, 255, 77, 0.1) 25%,
		    rgba(32, 255, 77, 0.1) 26%,
		    transparent 27%,
		    transparent 74%,
		    rgba(32, 255, 77, 0.1) 75%,
		    rgba(32, 255, 77, 0.1) 76%,
		    transparent 77%,
		    transparent
		  );
		background-color: #FFFFFF;
	}

	.box {
		width: 300px;
		height: 300px;
		position: absolute;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
		overflow: hidden;
		border: 0.1rem solid rgba(0, 255, 51, 0.2);
		z-index: 11;
	}

	.line {
		height: calc(100% - 2px);
		width: 100%;
		background: linear-gradient(180deg, rgba(0, 255, 51, 0) 43%, #00ff33 211%);
		border-bottom: 3px solid #00ff33;
		transform: translateY(-100%);
		animation: radar-beam 2s infinite alternate;
		animation-timing-function: cubic-bezier(0.53, 0, 0.43, 0.99);
		animation-delay: 1.4s;
	}

	.box:after,
	.box:before,
	.angle:after,
	.angle:before {
		content: '';
		display: block;
		position: absolute;
		width: 3vw;
		height: 3vw;
		z-index: 12;
		border: 0.2rem solid transparent;
	}

	.box:after,
	.box:before {
		top: 0;
		border-top-color: #00ff33;
	}

	.angle:after,
	.angle:before {
		bottom: 0;
		border-bottom-color: #00ff33;
	}

	.box:before,
	.angle:before {
		left: 0;
		border-left-color: #00ff33;
	}

	.box:after,
	.angle:after {
		right: 0;
		border-right-color: #00ff33;
	}

	@keyframes radar-beam {
		0% {
			transform: translateY(-100%);
		}

		100% {
			transform: translateY(0);
		}
	}
  
	.diy-code-close {
		height: 50rpx;
		width: 50rpx;
		position: absolute;
		right: 30rpx;
		top: 30rpx;
		color: #fff;

		.diy-icon-close {
			font-size: 30px;
			color: #00ff33;
		}
		z-index: 999999;
	}
  
	#video_nav_id {
		height: 100%;
		width: 100%;
	}
</style>
