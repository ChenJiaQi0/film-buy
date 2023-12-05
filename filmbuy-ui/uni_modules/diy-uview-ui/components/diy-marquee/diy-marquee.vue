<template>
	<view class="diy-marquee" @touchstart="mouseover" @mouseover="mouseover" @touchend="mouseout" @mouseout="mouseout" :style="'height:'+(lineHeight*showLine)+'rpx;'">
		<view class="diy-marquee-content flex flex-direction-column" :style="'margin-top:-'+marginTop+'rpx;'">
			<slot v-for="(item,index) in showdata" :item="item" :height='lineHeight'></slot>
		</view>
	</view>
</template>

<script>
	export default {
		name: 'maoScroll',
		data() {
			return {
				showdata: [],
				marginTop: 0,
				showLine: 0,
			}
		},
		props:{
			data: {
				type: Array,
				default: []
			},
			showNum: {
				type: Number,
				default: 4,
			},
			lineHeight: {
				type: Number,
				default: 80,
			},
			lineAnimation: {
				type: Number,
				default: 500,
			},
			animation: {
				type: Number,
				default: 2000,
			}
		},
		methods: {
			init: function(){
				this.showLine = this.showNum < this.data.length ? this.showNum : this.data.length;
				for(let i = 0; i < this.data.length; i++){
					this.showdata.push(this.data[i]);
				}
				for(let i = 0; i < this.showLine; i++){
					this.showdata.push(this.data[i]);
				}
				this.timer = setInterval(this.animationFunc, this.animation);
			},
			 //鼠标悬停或触摸
			mouseover() {
				clearInterval(this.timer);
				this.timer = null;
			},
			//鼠标或触摸离开，继续滚动
			mouseout() {
				this.init();
			},
			animationFunc: function(){
				if(this.marginTop >= this.data.length*this.lineHeight){
					this.marginTop = 0;
				}
				let stepTime = this.lineAnimation/this.lineHeight;
				
				var step = 0;
				let self = this;
				var index = setInterval(function(){
					self.marginTop = self.marginTop + 1;
					step++;
					if (step >= self.lineHeight) {
						clearInterval(index);
					}
				}, stepTime);
			}
		},
		watch: {
			data(outdata, newdata) {
				this.init();
			}
		}
	}
</script>

<style>
	.diy-marquee{width: 100%;overflow: hidden;}
</style>
