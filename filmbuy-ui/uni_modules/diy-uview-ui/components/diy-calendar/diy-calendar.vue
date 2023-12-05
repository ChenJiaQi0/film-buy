<template>
	<view class="diy-calendar">
		<view class="calendar-heander" :style="{color:titleColor}">
			<view v-if="changeYear" class="calendar-heander-icon" @click="changeYearHandler(0)">
				<u-icon  name="arrow-left-double" :color="titleColor" ></u-icon>
			</view>
			<view v-if="changeMonth" class="calendar-heander-icon" @click="changeMonthHandler(0)">
				<u-icon  name="arrow-left" :color="titleColor"></u-icon>
			</view>
			<u-icon v-if="changeMonth" name="" :color="titleColor">
			</u-icon>	
			<text>{{timeStr}}</text>
			<view v-if="changeMonth" class="calendar-heander-icon" @click="changeMonthHandler(1)">
				<u-icon  name="arrow-right" :color="titleColor"></u-icon>
			</view>
			<view v-if="changeYear" class="calendar-heander-icon"   @click="changeYearHandler(1)">
				<u-icon  name="arrow-right-double" :color="titleColor"></u-icon>
			</view>
			<view class="back-today" @click="goback" v-if="showBack">
				返回今日
			</view>
		</view>
		<view class="calendar-weeks">
			<view class="calendar-week" v-for="(week, index) in weeks" :key="index">
				{{week}}
			</view>
		</view>
		<view class="calendar-content">
		   <swiper class="calendar-swiper" :style="{
			   width: '100%',
			   height: sheight
		   }" :indicator-dots="false" :autoplay="false" :duration="duration" :current="current" @change="changeSwp" :circular="true">
				<swiper-item class="calendar-item" v-for="sitem in swiper" :key="sitem">
					<view class="calendar-days">
						<template v-if="sitem === current">
							<view class="calendar-day" v-for="(item,index) in days" :key="index"
							:class="{
								'u-hover-class':openDisAbled(item.time),
								'day-hidden': !item.show
							}" @click="clickItem(item)">
							<view
								class="date"
								:style="item.fullDate === selectedDate?{backgroundColor:selectBgColor,color:selectColor}:{color:item.isToday?currentColor:defaultColor}"
							>
							{{item.time.getDate()}}
							</view>
							<view class="dot-show" v-if="item.info" :style="{backgroundColor:dotColor}">	
			
							</view>
							<view class="dot-text" v-if="item.info&&item.info.text" :style="{color:dotColor}">
								{{item.info.text}}
							</view>
							</view>
						</template>
						<template v-else>
							<template v-if="current - sitem === 1 || current-sitem ===-2">
								<view class="calendar-day" v-for="(item,index) in predays" :key="index"
									:class="{
										'u-hover-class':openDisAbled(item.time),
										'day-hidden': !item.show
									}">
									<view
										class="date"
										:style="{color:item.isToday?currentColor:defaultColor}"
									>
									{{item.time.getDate()}}
									</view>
								</view>
							</template>
							<template v-else>
								<view class="calendar-day" v-for="(item,index) in nextdays" :key="index"
									:class="{
										'u-hover-class':openDisAbled(item.time),
										'day-hidden': !item.show
									}">
									<view
										class="date"
										:style="{color:item.isToday?currentColor:defaultColor}"
									>
									{{item.time.getDate()}}
									</view>
								</view>
							</template>
						</template>
					</view>				
				</swiper-item>			
			</swiper>
			<view class="mode-change" v-if="changeWeek" @click="changeMode">
				<view :style="{color:bottomArrowColor}" :class="weekMode ? 'diy-icon-unfold' : 'diy-icon-fold'">	
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import {gegerateDates, dateEqual,formatDate} from './generateDates.js';
	export default {
		props: {
			// 是否允许切换年份
			changeYear: {
				type: Boolean,
				default: true
			},
			// 是否允许切换月份
			changeMonth: {
				type: Boolean,
				default: true
			},
			// 是否星期月份切换
			changeWeek: {
				type: Boolean,
				default: true
			},
			// 月份切换按钮箭头颜色
			titleColor: {
				type: String,
				default: '#606266'
			},
			currentColor:{
				type: String,
				default: '#07c160'
			},
			// 底部切换颜色
			bottomArrowColor:{
				type: String,
				default: '#606266'
			},
			//切换时长
			duration: {
				type: Number,
				default: 500
			},
			// 最小可选日期(不在范围内日期禁用不可选)
			minDate: {
				type: [Number, String],
				default: '1950-01-01'
			},
			/**
			 * 最大可选日期
			 * 默认最大值为今天，之后的日期不可选
			 * 2030-12-31
			 * */
			maxDate: {
				type: [Number, String],
				default: ''
			},
			/**
			 * 禁用过期日期，不要跟minDate混用,选择其中一个
			 */
			disabledDate:{
				type: Boolean,
				default: false
			},
			// 显示模式
			mode: {
				type: String,
				default: 'week'
			},
			//一周显示星期一开始monday 星期天开始sunday
			weekType:{
				type: String,
				default: 'monday'
			},
			//打点日期列表
			dotList: {
				type: Array, 
				default () {
					return [
					]
				}
			},
			// 返回显示文本
			backText:{
				type:String,
				default:'返回今天'
			},
			// 是否返回今日
			showBack: {
				type: Boolean, 
				default: true
			},
			// 选中背景颜色
			selectBgColor:{
				type: String,
				default: '#07c160'
			},
			// 选中字体颜色
			selectColor:{
				type: String, 
				default: '#fff'
			},
			// 默认日期颜色
			defaultColor:{
				type: String, 
				default: '#000'
			},
			// 打点背景颜色
			dotColor: {
				type: String, 
				default: '#c6c6c6'
			}
		},
		watch:{
			dotList: function(newvalue){
				const days = this.days.slice(0);
				newvalue.forEach(item => {
					const index = days.findIndex(ditem => ditem.fullDate === item.date);
					if (index > 0) {
						days[index].info = item
					}
				});
				this.days = days;
			}
		},
		computed: {
			sheight() {
				// 根据年月判断有多少行
				// 判断该月有多少天
				let h = '70rpx';
				if (!this.weekMode) {
					const d = new Date(this.currentYear, this.currentMonth, 0);
					const days = d.getDate(); // 判断本月有多少天
					let day = new Date(d.setDate(1)).getDay();
					if(this.weekType=='monday'){
						if (day === 0) {
							day = 7;
						}
					}else{
						if (day === 6) {
							day = 8;
						}
					}
					const pre = 8 - day;
					const rows = Math.ceil((days-pre)  / 7) + 1;
					h = 70 * rows + 'rpx'
				}
				return h
			},
			timeStr() {
				let str = '';
			    const d = new Date(this.currentYear, this.currentMonth - 1, this.currentDate);
				const y = d.getFullYear();
				const m = (d.getMonth()+1) <=9 ? `0${d.getMonth()+1}` : d.getMonth()+1;
				str = `${y}年${m}月`;
				return str;
			},
			predays() {
				let pres = [];
				if (this.weekMode) {
					const d = new Date(this.currentYear, this.currentMonth - 1,this.currentDate)
					d.setDate(d.getDate() - 7);
					pres = gegerateDates(d, 'week',this.weekType)
				} else {
					const d = new Date(this.currentYear, this.currentMonth - 2,1)
					pres = gegerateDates(d, 'month',this.weekType)
				}
				return pres;
			},
			nextdays() {
				let nexts = [];
				if (this.weekMode) {
					const d = new Date(this.currentYear, this.currentMonth - 1,this.currentDate)
					d.setDate(d.getDate() + 7);
					nexts = gegerateDates(d, 'week',this.weekType)
				} else {
					const d = new Date(this.currentYear, this.currentMonth,1)
					nexts = gegerateDates(d, 'month',this.weekType)
				}
				return nexts;
			}
		},
		data() {
			return {
				weeks: this.weekType=='monday'?['一', '二', '三', '四', '五', '六', '日']:[ '日','一', '二', '三', '四', '五', '六'],
				current: 1,
				currentYear: '',
				currentMonth: '',
				currentDate: '',
				days: [],
				min: null,
				max: null,
				weekMode: this.mode=='week',
				swiper: [0,1,2],
				// dotList: [], // 打点的日期列表
				selectedDate: formatDate(new Date(), 'yyyy-MM-dd')
			};
		},
		methods: {
			openDisAbled: function(date) {
				let bool = true;
				let timestamp = date.getTime();
				// let today = this.today.replace(/\-/g, '/');
				if(this.min&&!this.max){
					let min = `${this.min.year}/${this.min.month}/${this.min.day}`;
					if (timestamp >= new Date(min).getTime()){
						bool = false;
					}
					return bool
				}
				if(!this.min&&this.max){
					let max = `${this.max.year}/${this.max.month}/${this.max.day}`;
					if(timestamp <= new Date(max).getTime()){
						bool = false;
					}
					return bool
				}
				if(this.min&&this.max){
					let min = `${this.min.year}/${this.min.month}/${this.min.day}`;
					let max = `${this.max.year}/${this.max.month}/${this.max.day}`;
					if (timestamp >= new Date(min).getTime() && timestamp <= new Date(max).getTime()) {
						bool = false;
					}
					return bool;
				}
				return bool
			},
			changeSwp(e) {
				// console.log(e);
				const pre = this.current;
				const current = e.detail.current;
				/* 根据前一个减去目前的值我们可以判断是下一个月/周还是上一个月/周 
				*current - pre === 1, -2时是下一个月/周
				*current -pre === -1, 2时是上一个月或者上一周
				*/
				this.current = current;
				if (current - pre === 1 || current - pre === -2) {
					this.daysNext();
				} else {
					this.daysPre();
				}
			},
			changeMonthHandler(isAdd) {
				let month = isAdd ? this.currentMonth : this.currentMonth - 2;
				const d = new Date(this.currentYear, month,this.currentDate);
				this.initDate(d);  
			},
			changeYearHandler(isAdd) {
				 let year = isAdd ? this.currentYear + 1 : this.currentYear - 1;
				 const d = new Date(year, this.currentMonth - 1,this.currentDate);
				 this.initDate(d);  	
			},
			//日期处理
			toDate(date) {
				if(date){
					let fdate = date.split('-');
					return {
						year: Number(fdate[0] || 1920),
						month: Number(fdate[1] || 1),
						day: Number(fdate[2] || 1)
					}
				}else{
					return null;
				}
			},
			// 初始化日历的方法
			initDate(cur) {
				let date = ''
				if (cur) {
				  date = new Date(cur)
				} else {
				  date = new Date()
				}
				this.currentDate = date.getDate()          // 今日日期 几号
				this.currentYear = date.getFullYear()       // 当前年份
				this.currentMonth = date.getMonth() + 1    // 当前月份
				this.min = this.toDate(this.minDate);
				if(this.disabledDate){
					 this.min = {
						year: this.currentYear,
						month: this.currentMonth,
						day: this.currentDate
					};
				}
				this.max = this.toDate(this.maxDate);
				
				this.currentWeek = date.getDay() === 0 ? 7 : date.getDay() // 1...6,0   // 星期几
				const nowY = new Date().getFullYear()       // 当前年份
				const nowM = new Date().getMonth() + 1
				const nowD = new Date().getDate()          // 今日日期 几号
				const nowW = new Date().getDay();
				// this.selectedDate = formatDate(new Date(), 'yyyy-MM-dd')
				this.days = [];
				let days = [];
				if (this.weekMode) {
					days = gegerateDates(date, 'week',this.weekType);
					// this.selectedDate = days[0].fullDate;
				} else {
					days = gegerateDates(date, 'month',this.weekType);
					// const sel = new Date(this.selectedDate.replace('-', '/').replace('-', '/'));
					// const isMonth = sel.getFullYear() === this.currentYear && (sel.getMonth() + 1) === this.currentMonth;
					// if(!isMonth) {
					// 	this.selectedDate = formatDate(new Date(this.currentYear, this.currentMonth-1,1), 'yyyy-MM-dd')
					// }
				}
				days.forEach(day => {
					const dot = this.dotList.find(item => {
						return dateEqual(item.date, day.fullDate);
					})
					if (dot) {
						day.info = dot;
					}
				})
				this.days = days;
				//  派发事件,时间发生改变
				let obj = {
					start: '',
					end: ''
				};
				if (this.weekMode) {
					obj.start = this.days[0].time;
					obj.end = this.days[6].time
				} else {
					const start = new Date(this.currentYear, this.currentMonth - 1, 1);
					const end =  new Date(this.currentYear, this.currentMonth , 0);
					obj.start = start;
					obj.end = end;
				}
				this.$emit('days-change', obj)
			},
			//  上一个
			daysPre () {
			  if (this.weekMode) {
				const d = new Date(this.currentYear, this.currentMonth - 1,this.currentDate);
				d.setDate(d.getDate() - 7);
				this.initDate(d);  
			  } else {
				  const d = new Date(this.currentYear, this.currentMonth -2, 1);
				  this.initDate(d);
			  }
			},
			//  下一个
			daysNext () {
				 if (this.weekMode) {
					const d = new Date(this.currentYear, this.currentMonth - 1,this.currentDate);
					d.setDate(d.getDate() + 7);
					this.initDate(d);  
				 } else {
					const d = new Date(this.currentYear, this.currentMonth, 1);
					this.initDate(d);
				 }
			},
			changeMode() {
				const premode = this.weekMode;
				let isweek = false;
				if (premode) {
					isweek = !!this.days.find(item => item.fullDate === this.selectedDate)
				}
				this.weekMode = !this.weekMode;
				let d = new Date(this.currentYear, this.currentMonth - 1, this.currentDate)
				const sel = new Date(this.selectedDate.replace('-', '/').replace('-', '/'));
				const isMonth = sel.getFullYear() === this.currentYear && (sel.getMonth() + 1) === this.currentMonth;
				if ((this.selectedDate && isMonth) || isweek) {
					d = new Date(this.selectedDate.replace('-', '/').replace('-', '/'))
				}
				this.initDate(d)
			},
			// 点击日期
			clickItem(e) {
				//判断是否可点击
				if(!this.openDisAbled(e.time)){
					this.selectedDate = e.fullDate;
					this.$emit('change', {result:e.fullDate,isToday:e.isToday});
				}
			},
			goback() {
				const d = new Date();
				this.initDate(d);
			}
		},
		created() {
			this.initDate();
		},
		mounted() {
		}
	}
</script>

<style lang="scss" scoped>
.diy-calendar {
	width: 100%;
	height: auto;
	
	.calendar-heander {
		text-align: center;
		height: 60rpx;
		line-height: 60rpx;
		position: relative;
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 30rpx;
		
		.calendar-heander-icon{
			margin:0 10rpx
		}
		.back-today {
			position: absolute;
			right: 10rpx;
			width: 100rpx;
			height: 30rpx;
			line-height: 30rpx;
			font-size: 20rpx;
			top: 15rpx;
			border-radius: 15rpx 0 0 15rpx;
		}
	}
	.calendar-weeks {
		width: 100%;
		display: flex;
		flex-flow:row nowrap;
		height: 60rpx;
		line-height: 60rpx;
		justify-content: center;
		align-items: center;
		font-size: 30rpx;
		.calendar-week {
			width: calc(100% / 7);
			height: 100%;
			text-align: center;
		}
	}
	swiper {
		width: 100%;
		height: 60rpx;
	}
	.calendar-content {
		min-height: 60rpx;
	}
	.calendar-swiper {       
		min-height: 70rpx;
		transition: height ease-out 0.3s;
	}
	.calendar-item {
		margin: 0;
		padding: 0;
		height: 100%;
	}
	.calendar-days {
		display: flex;
		flex-flow: row wrap;
		width: 100%;
		height: 100%;
		overflow: hidden;
		font-size: 28rpx;
		
		
		.calendar-day {
			width: calc(100% / 7);
			height: 70rpx;
			text-align: center;
			position:relative;
			display: flex;
			flex-flow: column nowrap;
			justify-content: flex-start;
			align-items: center;
		}
	}
	.day-hidden {
		visibility: hidden;
	}
	.mode-change {
		display: flex;
		justify-content: center;
		margin-top:10rpx;
	}
	
	.date {
		width: 50rpx;
		height: 50rpx;
		line-height: 50rpx;
		margin: 0 auto;
		position: relative;
		border-radius: 50rpx;
	}
	.dot-show {
		margin-top:4rpx;
		width: 10rpx;
		height: 10rpx;
		background: #c6c6c6;
		border-radius: 50%;
	}
	.dot-text{
		position: absolute;
		right: calc(50% - 40rpx);
		bottom:0px;
	}
}
</style>
