<template>
	<view>

	</view>
</template>

<script>
	export default {
		data() {
			return {

			}
		},
		methods: {

		},
		onLoad(option) {
			this.film = JSON.parse(option.film)
			uni.setNavigationBarTitle({
				title: this.film.name
			})
			console.log(this.film);
		}
	}
</script>

<style>

</style>