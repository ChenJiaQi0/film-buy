<template>
	<view>
		<anil-seat ref="anilSeat" :title="filmName" :info="info" :room-name="roomName" @confirm="buySeat">
		</anil-seat>
	</view>
</template>

<script>
	import seat from '@/data/seat.js';
	import anilSeat from '@/components/anil-seat/anil-seat.vue';
	import {
		SEAT_LIST
	} from '@/utils/api.js';
	export default {
		components: {
			anilSeat
		},
		data() {
			return {
				showTimeId: '',
				price: '',
				filmName: '',
				cinemaName: '',
				date: '',
				hour: '',
				roomName: '',
				// 电影座位格式
				seatData: [],
				cat: ''
			}
		},
		methods: {
			buySeat(option) {
				// console.log(option);
				const data = {
					filmName: this.filmName,
					cinemaName: this.cinemaName,
					price: this.price * option.length,
					count: option.length,
					seat: option.map((ele) => ele.SeatCode),
					info: this.info,
					date: this.date + ' ' + this.hour,
				}
				// console.log(data);
				uni.redirectTo({
					url: '/pages/film/film-buy?data=' + JSON.stringify(data) + '&seatInfo=' + JSON.stringify(
						option)
				})
			},
			getSeatList() {
				const _this = this;
				uni.request({
					url: SEAT_LIST,
					method: 'GET',
					data: {
						id: _this.showTimeId
					},
					success(res) {
						if (res.data.code === 200) {
							const list = res.data.data
							for (let i = 0; i < list.length; i++) {
								const n = list[i];
								_this.seatData[i] = new seat(n.cn, n.rn, n.id, n.status, n.rn, n.cn,
									_this.price);
							}
							_this.$refs['anilSeat'].initData(_this.seatData);
						}
					}
				});
			},
		},
		onLoad(option) {
			this.showTimeId = option.showTimeId;
			this.price = option.price;
			this.date = option.date;
			this.hour = option.hour;
			this.roomName = option.roomName + "号厅";
			this.cat = option.cat;
			this.filmName = option.filmName;
			this.cinemaName = option.cinemaName;
			uni.setNavigationBarTitle({
				title: option.cinemaName,
			});
			this.getSeatList();
			// console.log(this.seatData);
			// this.$refs['anilSeat'].initData(this.seatData);

		},
		computed: {
			info() {
				return this.date + ' ' + this.hour + ' ' + this.cat;
			}
		}
	}
</script>

<style>

</style>