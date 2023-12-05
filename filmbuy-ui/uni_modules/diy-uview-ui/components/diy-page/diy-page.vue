<template>
	<view class="diy-page" :class="size=='large'?'size-large':size=='small'?'size-small':''">
		<view class="diy-page-wrap">
			<view class="page-scroll">
				<view class="diy-page-btns">
					<!-- 首页 -->
					<view class="diy-pag-btn start" :style="{color}"
						:class="[nowPage==1?'diy-page-btn-disable':'',btnText?'btn-text':'']" v-if="showAround && !numAround"
						@click="clickStart">
						<text v-if="btnText">首页</text>
						<text v-else class="diy diy-icon-diyiye"></text>
					</view>
					<!-- 上页 -->
					<view class="diy-pag-btn prev" :style="{color}" :class="[nowPage==1?'diy-page-btn-disable':'',btnText?'btn-text':'']"
						@click="clickPrev">
						<text v-if="btnText">上页</text>
						<text v-else class="icon diy-icon-back"></text>
					</view>
					<!-- 简单模式 -->
					<view v-if="mode=='simple'" class="page-num simple"><text :style="{color}"
							style="margin-right: 10rpx;">{{nowPage}}</text>/ {{pageNum}}</view>
					<!-- 复杂模式 -->
					<view class="page-num" v-else>
						<template v-if="pageNum <= showPageSize">
							<view v-for="page in pageNumArr" :key="page" class="diy-pag-btn"
								:style="{color, backgroundColor:(page==nowPage?color:'')}"
								:class="page==nowPage?'active':''" @click="clickPage(page)">{{page}}</view>
						</template>
						<template v-else>
							<!-- 第一页页码 -->
							<view class="diy-pag-btn" :style="{color, backgroundColor:(nowPage==1?color:'')}"
								v-if="numAround" :class="nowPage==1?'active':''" @click="clickPage(1)">1</view>
							<!-- 左侧省略号 -->
							<view class="diy-pag-btn ellipsis-btn" :style="{color}"
								v-show="(forceEllipses && getFirstPage != 1) || (numAround && getFirstPage != 2)"><text
									class="icon diy-icon-more"></text></view>
							<template v-for="(p, i) in showPageSize">
								<template v-if="i<showPageSize-2">
									<!-- 中间页码 -->
									<view :key="i" class="diy-pag-btn"
										:style="{color, backgroundColor:((getFirstPage+i)==nowPage?color:'')}"
										:class="(getFirstPage+i)==nowPage?'active':''"
										@click="clickPage(getFirstPage+i)">
										{{getFirstPage+i}}
									</view>
								</template>
								<template v-else>
									<!-- 若显示省略号，则页码只显示 showPageSize-2 页 -->
									<view :key="i" v-show="!forceEllipses && !numAround" class="diy-pag-btn"
										:style="{color, backgroundColor:((getFirstPage+i)==nowPage?color:'')}"
										:class="(getFirstPage+i)==nowPage?'active':''"
										@click="clickPage(getFirstPage+i)">
										{{getFirstPage+i}}
									</view>
								</template>
							</template>
							<!-- 右侧省略号 -->
							<view class="diy-pag-btn ellipsis-btn" :style="{color}"
								v-show="(forceEllipses && getFirstPage<pageNum-(showPageSize-3)) || (numAround && getFirstPage < pageNum-(showPageSize-2))">
								<text class="icon diy-icon-more"></text>
							</view>
							<!-- 最后一页页码 -->
							<view class="diy-pag-btn" :style="{color, backgroundColor:(nowPage==pageNum?color:'')}"
								v-if="numAround" v-show="getFirstPage < pageNum-(showPageSize-3)"
								:class="nowPage==pageNum?'active':''" @click="clickPage(pageNum)">{{pageNum}}</view>
						</template>
					</view>
					<!-- 下页 -->
					<view class="diy-pag-btn next" :style="{color}"
						:class="[pageNum<=nowPage?'diy-page-btn-disable':'',btnText?'btn-text':'']" @click="clickNext">
						<text v-if="btnText">下页</text>
						<text v-else class="icon diy-icon-right"></text>
					</view>
					<!-- 尾页 -->
					<view class="diy-pag-btn end" :style="{color}"
						:class="[pageNum<=nowPage?'diy-page-btn-disable':'',btnText?'btn-text':'']" v-if="showAround && !numAround"
						@click="clickEnd">
						<text v-if="btnText">尾页</text>
						<text v-else class="icon diy-icon-zuihouye"></text>
					</view>
				</view>
			</view>
		</view>
		<view class="diy-page-info"  v-if="showPageInfo||showGoPage">
			<slot />
			<view class="diy-page-info-con" v-if="showPageInfo">
				<view>共 {{total}} 条，</view>
				<view>每页 {{pageSize}} 条，</view>
				<view>当前页 {{nowPage}}/{{pageNum}}<text v-if="showGoPage">，</text></view>
			</view>
			<view class="diy-page-go" v-if="showGoPage">前往第
				<template v-if="trigger=='blur'">
					<input class="diy-page-input" type="text" v-model="inputPage" @blur="goPage" @input="onInput" />页
				</template>
				<template v-else>
					<input class="diy-page-input" type="text" v-model="inputPage" @input="onInput" />页
					<text v-if="trigger=='click'" class="diy-page-input-btn" @click="goPage">跳转</text>
				</template>
			</view>
		</view>
	</view>
</template>
<script>
	/**
	 * @property {Number} total 总条数，默认0
	 * @property {Number} pageSize 每页条数，默认10
	 * @property {Number} currentPage 当前页，默认1
	 * @property {Number} showPageSize 显示的页码个数，默认5
	 * @property {String} mode = [multi|simple] 显示模式，默认multi
	 *  @value multi 标准模式(默认)
	 *  @value simple 简单模式，只显示当前页/总页数
	 * @property {Boolean} forceEllipses = [true|false] 是否显示省略号，默认false
	 * @property {Boolean} btnText = [true|false] 上页、下页、首页和尾页按钮是否显示汉字，默认false
	 * @property {Boolean} showAround = [true|false] 是否显示首页和尾页，默认false
	 * @property {Boolean} numAround = [true|false] 是否用页码表示首尾页，默认false
	 * @property {String} size = [large|normal|small] 按钮大小，默认normal
	 *  @value large 大号按钮
	 *  @value normal 普通按钮(默认)
	 *  @value small 小型按钮
	 * @property {Boolean} showPageInfo = [true|false] 是否显示分页信息，如总页数等，默认false
	 * @property {Boolean} showGoPage = [true|false] 是否显示input输入框，默认false
	 * @property {String} trigger = [blur|click] 跳转页码触发方式，默认blur
	 *  @value blur 失去焦点时触发(默认)
	 *  @value click 点击跳转按钮触发
	 */
	export default {
		name: 'diy-page',
		emits: ["change"],
		props: {
			//总条数
			total: {
				type: Number,
				default: 0
			},
			//每页条数
			pageSize: {
				type: Number,
				default: 10
			},
			//当前页
			currentPage: {
				type: Number,
				default: 1
			},
			//显示的页码个数
			showPageSize: {
				type: Number,
				default: 5
			},
			//显示模式
			mode: {
				type: String,
				default: "multi"
			},
			//是否显示省略号
			forceEllipses: {
				type: Boolean,
				default: false
			},
			//是否显示汉字
			btnText: {
				type: Boolean,
				default: true
			},
			//是否显示首页和尾页
			showAround: {
				type: Boolean,
				default: false
			},
			//是否用页码表示首尾页
			numAround: {
				type: Boolean,
				default: false
			},
			//按钮大小
			size: {
				type: String,
				default: "normal"
			},
			//页码颜色
			color: {
				type: String,
				default: "#19be6b"
			},
			//是否显示页面信息
			showPageInfo: {
				type: Boolean,
				default: false
			},
			//是否显示前往跳转页
			showGoPage: {
				type: Boolean,
				default: false
			},
			//跳转页码触发方式
			trigger: {
				type: String,
				default: "blur"
			}
		},
		data() {
			return {
				nowPage: this.currentPage, //当前页
				inputPage: this.currentPage //input输入框绑定值
			}
		},
		watch: {
			currentPage(val) {
				this.nowPage = val > this.pageNum ? this.pageNum : val;
				this.inputPage = val > this.pageNum ? this.pageNum : val;
				if (val == 1) {
					this.nowPage = 1;
					this.inputPage = 1;
				}
			}
		},
		computed: {
			//总页数
			pageNum() {
				return Math.ceil(this.total / this.pageSize)
			},
			pageNumArr() { //解决uni-app某些版本中，存在v-for中循环数字时从0开始
				var pageNumArr = [];
				for (let i = 0; i < this.pageNum; i++) {
					pageNumArr.push(i + 1);
				}
				return pageNumArr;
			},
			//计算显示的第一个页码
			getFirstPage() {
				let firstPage = 0;
				let a = Math.floor((this.showPageSize - 1) / 2);
				let b = Math.floor(this.showPageSize / 2) - 1;
				if (this.nowPage <= a) {
					if (!this.numAround) firstPage = 1;
					else firstPage = 2;
				} else if (this.nowPage >= this.pageNum - b) {
					if (this.forceEllipses || this.numAround) firstPage = this.pageNum - this.showPageSize + 3;
					else firstPage = this.pageNum - this.showPageSize + 1;
				} else {
					if (this.forceEllipses || this.numAround) firstPage = this.nowPage - a + 1;
					else firstPage = this.nowPage - a;
				}
				return firstPage;
			}
		},
		methods: {
			//选择页码
			clickPage(page) {
				if (this.nowPage != page) {
					this.nowPage = page;
					this.change(page, 'page');
				}
			},
			//点击上页
			clickPrev() {
				if (this.nowPage > 1) {
					let nowPage = this.nowPage - 1;
					this.nowPage = nowPage;
					this.change(nowPage, 'prev');
				}
			},
			//点击下页
			clickNext() {
				if (this.nowPage < this.pageNum) {
					let nowPage = this.nowPage + 1;
					this.nowPage = nowPage;
					this.change(nowPage, 'next');
				}
			},
			//点击首页
			clickStart() {
				if (this.nowPage != 1) {
					let nowPage = 1;
					this.nowPage = nowPage;
					this.change(nowPage, 'homePage');
				}
			},
			//点击尾页
			clickEnd() {
				if (this.nowPage != this.pageNum) {
					let nowPage = this.pageNum;
					this.nowPage = nowPage;
					this.change(nowPage, 'endPage');
				}
			},
			//页码改变时触发
			change(nowPage, type) {
				this.inputPage = nowPage;
				this.$emit('change', nowPage, type);
			},
			onInput(event) {
				let self = this;
				let val = parseInt(event.target.value.replace(/[^\d]/g, ''));
				setTimeout(function() {
					self.inputPage = val ? (val > self.pageNum ? self.pageNum : val) : '';
				}, 10)
			},
			goPage() {
				this.nowPage = parseInt(this.inputPage ? this.inputPage : '1');
				this.inputPage = parseInt(this.inputPage ? this.inputPage : '1');
				this.change(parseInt(this.inputPage), 'goPage');
			}
		}
	};
</script>
<style lang="scss">
	.diy-page {
		width: 100%;
		
		.diy-page-wrap {
			width: 100%;
			display: flex;
			justify-content: center;
			.page-scroll {
				display: flex;
				overflow-x: auto;
				overflow-y: hidden;
				margin: 0 auto;
			}
			
			.diy-page-btns {
				display: flex;
				white-space: nowrap;
				height: 62rpx;
				line-height: 62rpx;
				flex-direction: row;
				
				.diy-pag-btn {
					background-color: #FFF;
					color: #19be6b;
					font-size: 28rpx;
					border: 1px solid #EBEEF5;
					border-left: none;
					padding: 0 22rpx;
					
					&.start, &.prev,&.next,&.end {
						padding: 0 14rpx;
					}
					
					&.ellipsis-btn {
						padding: 0 10rpx;
						color: #999999 !important;
					}
					
					&:has(> .diy-icon-more) {
						padding: 0 14rpx;
					}
					
					&:first-child {
						border-left: 1px solid #EBEEF5;
					}
					
					&.active {
						background-color: #19be6b;
						color: #FFFFFF !important;
					}
					
					&.diy-page-btn-disable {
						color: #C0C4CC !important;
						cursor: not-allowed;
					}
				}
				
				.page-num {
					display: flex;
					flex-direction: row;
					
					&.simple {
						padding: 0 80rpx;
						line-height: 68rpx;
						color: #303133;
						font-size: 32rpx;
						
						&+.diy-pag-btn{
							border-left:1px solid #EBEEF5 !important;
						}
					}
				}
				
			}
		}
		
		.diy-page-info {
			display: flex;
			justify-content: center;
			line-height: 56rpx;
			margin-top: 10rpx;
			color: #606266;
			font-size: 28rpx;
			text-align: center;
			
			.diy-page-info-con {
				display: flex;
				flex-direction: row;
				justify-content: center;
			}
			
			.diy-page-go {
				position: relative;
				top: -2rpx;
				display: flex;
				justify-content: center;
				flex-direction: row;
				
				.diy-page-input{
					 display: inline-block;
					 width: 80rpx;
					 height: 52rpx;
					 line-height: 52rpx;
					 border: 1px solid #dcdfe6;
					 border-radius: 8rpx;
					 background-color: #FFF;
					 padding: 0px 10rpx;
					 margin: 0 10rpx;
					 font-size: 28rpx;
					 overflow: inherit;
					 box-sizing: border-box;
					 vertical-align: middle;
				}
				
				.diy-page-input-btn {
					height: 52rpx;
					line-height: 52rpx;
					padding: 4rpx 14rpx;
					border-width: 1px;
					border-style: solid;
					border-radius: 3px;
					border-color: #DCDFE6;
					color: #303133;
					margin-left: 10rpx;
					opacity: 0.8;
					background-color: #FFF;
				}
			}
			
		}
		
		&.size-large{
			.diy-page-wrap .diy-page-btns {
				height: 78rpx;
				line-height: 78rpx;
				
				.diy-pag-btn {
					padding: 0 30rpx;
					font-size: 32rpx;
					&.start,&.prev,&.next,&.end,&.ellipsis-btn {
						padding: 0 24rpx;
					}
					&.btn-text {
						padding: 0 12rpx;
					}
				}
			}
		} 
		
		
		&.size-small{
			.diy-page-wrap .diy-page-btns {
				height: 52rpx;
				line-height: 52rpx;
				
				.diy-pag-btn {
					padding: 0 14rpx;
					font-size: 24rpx;
					
					&.start,&.prev,&.next,&.end,&.ellipsis-btn {
						padding: 0 10rpx;
					}
					&.btn-text {
						padding: 0 10rpx;
					}
				}
			}
		} 
	}

</style>
