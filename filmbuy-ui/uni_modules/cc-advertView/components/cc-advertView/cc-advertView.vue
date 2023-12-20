<template>
	<view class="cc-advert-content" :class="advertState===0 ? 'none' : advertState===1 ? 'show' : 'hide'"
		@click="advertTap">

		<image class="cc-advert-bg" :src="imageUrl" mode="scaleToFill"></image>
		<view class="cc-advert-btn" @click.stop.prevent="hideAdvert">
			<text class="cc-advert-timer">跳过 {{timer}}</text>
		</view>
	</view>
</template>

<script>
	import advert from './cc-advert.js';
	export default {
		data() {
			return {
				advertState: 0,
				interval: null,
				timer: 8,
			}
		},
		props: {
			timedown: {
				type: Number,
				default: 8
			},
			imageUrl: {
				type: String,
				default: '/static/advert.jpg'
			},

		},
		created() {
			this.timer = this.timedown;
		},
		methods: {
			initAdvert() {
				// #ifdef APP-PLUS
				let aaa = this.clickEvent;
				let params = {
					timer: this.timer,
					imageUrl: this.imageUrl,

				}
				advert.initAdvert(params);
				// #endif
				// #ifdef H5
				this.advertState = 1;
				this.startTimedown();
				// #endif
			},
			// #ifdef H5
			startTimedown() {
				this.interval = setInterval(() => {
					this.timer -= 1;
					if (this.timer < 1) {
						this.hideAdvert();
					}
				}, 1000)
			},

			hideAdvert(type) {
				let timer = type === 'show' ? 10 : 800;
				let state = type === 'show' ? 1 : 0;
				this.advertState = 2;
				clearInterval(this.interval);
				setTimeout(() => {
					this.advertState = state;
				}, timer)
			},
			advertTap() {
				
				
				this.$emit("advertClick");
				this.hideAdvert();
				
			},
			// #endif
		},
	}
</script>

<style>
	.cc-advert-content {
		position: fixed;
		left: 0;
		top: 0;
		width: 100vw;
		height: 100vh;
		z-index: 9999;
		transition: transform .6s, opacity 1s;
		opacity: 1;
	}

	.none {
		display: none;
	}

	.hide {
		opacity: 0;
		transform: scale(1.2);
	}

	.hide .cate-content {
		transform: translateX(0);
	}

	.cc-advert-bg {
		position: absolute;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
	}

	.cc-advert-btn {
		display: flex;
		justify-content: center;
		align-items: center;
		position: absolute;
		right: 30upx;
		top: 30upx;
		z-index: 10;
		height: 50upx;
		padding: 0 20upx;
		background: rgba(0, 0, 0, .3);
		border-radius: 100px;
	}

	.cc-advert-timer {
		color: #fff;
		font-size: 26upx;
		line-height: 1;
	}
</style>