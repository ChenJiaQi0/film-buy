<template>
	<view>
		<anil-seat ref="anilSeat" title="皮皮鲁与鲁西西之罐头小人" info="2021年01月22日 国语 奇幻 喜剧 儿童" room-name="5号厅">
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
				// cinemaName: '',
				// filmName: '',
				// date: '',
				// 电影座位格式
				seatData: [],
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
			this.getSeatList();
			// console.log(this.seatData);
			// this.$refs['anilSeat'].initData(this.seatData);

		},
	}
</script>

<style>

</style>