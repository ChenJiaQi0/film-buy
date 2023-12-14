<template>
	<view>
		<anil-seat ref="anilSeat" :title="filmName" :info="info" :room-name="roomName">
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
				date: '',
				hour: '',
				roomName: '',
				// 电影座位格式
				seatData: [],
				cat: ''
			}
		},
		methods: {
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