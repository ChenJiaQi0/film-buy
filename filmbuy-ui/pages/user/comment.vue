<template>
	<view>
		<view
			style="margin-top: 20rpx;margin-bottom: 20rpx;display: flex;text-align: center;font-size: 35rpx;border-bottom: 1px solid gray;">
			选择评分<uni-rate v-model="sc" active-color="#FF6E06" allowHalf="true" :size="30" max="10"
				color="gray" />{{sc}}分
		</view>
		<view style="font-size: 40rpx;">
			<textarea maxlength="-1" placeholder="大家都在问:剧情怎么样,画面好吗,演技如何？" v-model="comment"
				style="height: 500rpx;width: 100%;padding: 20rpx;" />
		</view>
		<button class="cu-btn bg-red margin-tb-sm lg" style="width: 100%;" @tap="sendComment">提交</button>
		<view style="text-align: center;">为保证公正，未购票用户评分不计入FILMBUY评分</view>
	</view>
</template>

<script>
	import {
		request
	} from '@/utils/request.js';
	import {
		COMMENT
	} from '@/utils/api.js';
	export default {
		data() {
			return {
				filmId: '',
				sc: 1,
				comment: ''
			}
		},
		methods: {
			async sendComment() {
				const data = await request(COMMENT, 'POST', {
					sc: this.sc,
					comment: this.comment,
					filmId: this.filmId
				})
				if (data.code === 200) {
					uni.navigateBack().then(() => {
						uni.showToast({
							duration: 2000,
							title: '评论成功'
						})
					})

				} else {
					uni.showToast({
						title: '网络异常请稍后重试',
						icon: "error"
					})
					this.sc = '1'
					this.comment = ''
				}
			}
		},
		onLoad(option) {
			this.filmId = option.id
		},
	}
</script>

<style>

</style>