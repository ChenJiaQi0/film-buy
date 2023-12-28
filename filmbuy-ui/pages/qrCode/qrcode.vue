<template>
	<view>
		该二维码被消费了...
	</view>
</template>

<script>
	import {
		ORDER_CONSUME
	} from '@/utils/api.js'
	import {
		request
	} from '@/utils/request.js'
	export default {
		data() {
			return {
				id: '',
			}
		},
		onLoad(opt) {
			this.id = opt.id
			this.cosume()
			// console.log(this.id);
		},
		onShow() {
			// console.log("该二维码被消费了...")
		},
		methods: {
			async cosume() {
				const res = await request(ORDER_CONSUME + '/' + this.id, 'POST');
				if (res.code === 200) {
					uni.showToast({
						icon: 'success',
						title: '消费成功'
					})
					// setTimeout(function() {
					// 	uni.navigateBack()
					// }, 1000)
				} else {
					uni.showToast({
						icon: 'error',
						title: res.msg || '网络异常，消费失败'
					})
				}
			}
		}
	}
</script>

<style>

</style>