<template>
	<view class="diy-line"  v-if="lineShow" @click="checkModel">
		<view :class="[lineShow?'open-line':'close-line',horizontalScreen?'horizontal':'vertical']"  @click.stop="()=>{}">
			<view :class="[horizontalScreen?'horizontal-line':'']">
				<view class="line-head">线条选择器</view>
				<view class="line-box">
					<view v-for="(item,index) in lineData" :key="item"
					 @click="checkline(item)"
					 :style="horizontalScreen?{'width':item+'px',height:'100vh'}:{width:'100%','height':item+'px'}"></view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		props: {
			//是否横屏
			horizontalScreen: {
				type: Boolean,
				default: false
			}
		},
		data() {
			return {
				lineShow:false,
				lineData:[4,8,12,16,18]
			}
		},
		methods:{
			checkModel() {
				this.lineShow = !this.lineShow;
			},
			checkline(item) {
				this.lineShow = false;
				this.$emit('setLine',item)
			}
		}
	}
</script>

<style scoped lang="scss">
.diy-line{
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,0.5);
	position: fixed;
	bottom: 0;
	left: 0;
	z-index: 100;
	display: flex;
	align-items: flex-end;
	&.horizontal{
		bottom: inherit;
		top:0;
		height:100%;
	}
	>view{
		width: 100%;
		height: 500upx;
		background: #FFFFFF;
		box-shadow: 0 0 10upx #999999;
		border-radius: 60upx 60upx 0 0;
	
		
		
		.line-head{
			text-align: center;
			font-size: 30upx;
			height: 100upx;
			display: flex;
			align-items: center;
			justify-content: center;
			margin-bottom: 20upx;
		}
		
	}
}
.open-line{
	 
	&.horizontal{
		animation:fadeInLeft 0.4s ;
		opacity: 1;
		width: 500upx;
		height: 100vh;
		border-radius: 0 60upx 60upx  0;
		.horizontal-line{
			height: 100vh;
			display: flex;
			align-items: center;
			flex-direction: row-reverse;
			.line-head{
				transform: rotate(90deg);
			}
			.line-box{
				display: flex;
				align-items: center;
				flex-direction: row-reverse;
				
				>view{
					margin-left:30upx;
					background-color: #000;
				}
			}
		}
		
	}
	&.vertical{
		animation:fadeInUp 0.4s ;
		
		.line-box{
			box-sizing: border-box;
			padding: 0 70upx;
			>view{
				margin-bottom:56upx;
				width: 100%;
				background-color: #000;
			}
		}
	}
	
}
.close-line{
	&.horizontal{
		animation:fadeOutLeft 0.5s ;
	}
	&.vertical{
		animation:fadeInDown 0.5s ;
	}
	
}

@keyframes fadeInLeft {
  from {
    opacity: 0;
    -webkit-transform: translate3d(-100%, 0, 0);
    transform: translate3d(-100%, 0, 0);
  }

  to {
    opacity: 1;
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0);
  }
}


@keyframes fadeOutLeft {
  from {
    opacity: 1;
  }

  to {
    opacity: 0;
    -webkit-transform: translate3d(-100%, 0, 0);
    transform: translate3d(-100%, 0, 0);
  }
}
@keyframes fadeInUp {
	0% {
		opacity: 0;
		-webkit-transform: translate3d(0, 100%, 0);
		transform: translate3d(0, 100%, 0)
	}

	to {
		opacity: 1;
		-webkit-transform: translateZ(0);
		transform: translateZ(0)
	}
}
@keyframes fadeInDown {
	0% {
		opacity: 0;
		-webkit-transform: translate3d(0, -100%, 0);
		transform: translate3d(0, -100%, 0)
	}

	to {
		opacity: 1;
		-webkit-transform: translateZ(0);
		transform: translateZ(0)
	}
}
</style>
