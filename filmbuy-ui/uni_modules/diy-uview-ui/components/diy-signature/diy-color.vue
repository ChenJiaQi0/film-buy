<template>
	<view class="diy-color" v-if="colorShow" @click="checkModel">
		<view :class="[colorShow?'open-color':'close-color',horizontalScreen?'horizontal':'vertical']" @click.stop="()=>{}">
			<view :class="[horizontalScreen?'horizontal-line':'']">
				<view class="color-head">颜色选择器</view>
				
				<view class="color-box">
					<view v-for="(item,index) in colorData" :key="item" 
					 @click="checkColor(item)"
					:class="{'checkItem':checkItem==item}">
						<view>
							<view :style="{'background':item}"></view>
						</view>
					</view>
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
				colorShow:false,
				colorData:["red",'black','blue','yellow','green','#d925ff','#00b4ff','#ff00cc','#35ff81','#ff9c00','#ff7e00',
				'#b4ff00','#28caa6','#490086','#deb7fe','#acacad','#525252','#a5896f','#bb3a30','#0058b2'
				],
				checkItem:""
			}
		},
		methods:{
			checkModel() {
				this.colorShow = !this.colorShow;
			},
			//选择颜色
			checkColor(item) {
				this.checkItem = item;
				this.colorShow = false;
				this.$emit('setColor',item)
			}
		}
	}
</script>

<style scoped lang="scss">
.checkItem{
	border: 1px dashed #5667F5;
	box-sizing: border-box;
}
.diy-color{
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
		height: 470upx;
		background: #FFFFFF;
		box-shadow: 0 0 10upx #999999;
		border-radius: 60upx 60upx 0 0;
		box-sizing: border-box;
		padding: 0 40upx;
		overflow: hidden;
		.color-head{
			text-align: center;
			font-size: 30upx;
			height: 100upx;
			display: flex;
			align-items: center;
			justify-content: center;
			margin-bottom: 20upx;
		}
		.color-box{
			display: flex;
			align-items: center;
			flex-wrap: wrap;
			>view{
				width: 20%;
				height: 80upx;
				border-radius: 10upx;
				display: flex;
				align-items: center;
				justify-content: center;
				// margin-bottom: 30upx;
				>view{
					width: 50upx;
					height: 50upx;
					overflow: hidden;
					border-radius: 50%;
					box-sizing: border-box;
					padding: 3px;
					border: 1px solid #C0C0C0;
					>view{
						width: 100%;
						height: 100%;
						border-radius: 50%;
						background-color: red;
					}
				}
			}
		}
	}
}
.open-color{
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
			.color-head{
				transform: rotate(90deg);
			}
			.color-box{
				display: flex;
				align-items: center;
				flex-direction: row-reverse;
				width:120px;
				height:100vh;
				overflow: hidden;
				>view{
					margin-left:30upx;
				}
			}
		}
		
	}
	&.vertical{
		animation:fadeInUp 0.4s ;
		
		.color-box{
			box-sizing: border-box;
		}
	}
	

}
.close-color{
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
