# cc-couponList


#### 使用方法 
```使用方法
<!-- color：主题色 couponList：优惠券数组  @itemClick：条目点击-->
<cc-couponList :colors="colors" :couponList="couponList" @itemClick="jumpNext"></cc-couponList>
```

#### HTML代码实现部分
```html
<template>
	<view>

		<!-- color：主题色 couponList：优惠券数组  @itemClick：条目点击-->
		<cc-couponList :colors="colors" :couponList="couponList" @itemClick="jumpNext"></cc-couponList>


	</view>
</template>

<script>
	export default {
		data() {
			return {
				colors: '#e54d42',
				couponList: [{
						name: '满105减5',
						dates: '2023-07-09 2023-08-02',
						status: 0,
						money: 105,
						sub: 5
					},
					{
						name: '满200减10',
						dates: '2023-07-19 2023-08-22',
						status: 0,
						money: 200,
						sub: 10
					}, {
						name: '满100减10',
						dates: '2023-05-09 2023-06-02',
						status: 1,
						money: 100,
						sub: 10
					},
					{
						name: '满400减20',
						dates: '2023-04-09 2023-05-08',
						status: 1,
						money: 400,
						sub: 20
					}
				],

			};
		},


		props: {},

		/**
		 * 生命周期函数--监听页面加载
		 */
		onLoad: function(options) {


		},

		/**
		 * 生命周期函数--监听页面初次渲染完成
		 */
		onReady: function() {},

		/**
		 * 生命周期函数--监听页面显示
		 */
		onShow: function() {},

		/**
		 * 生命周期函数--监听页面隐藏
		 */
		onHide: function() {},

		/**
		 * 生命周期函数--监听页面卸载
		 */
		onUnload: function() {},

		/**
		 * 页面相关事件处理函数--监听用户下拉动作
		 */
		onPullDownRefresh: function() {},

		/**
		 * 页面上拉触底事件的处理函数
		 */
		onReachBottom: function() {},

		/**
		 * 用户点击右上角分享
		 */
		onShareAppMessage: function() {},
		methods: {
			jumpNext(item) {

				uni.showModal({
					title: '点击优惠券条目',
					content: '点击优惠券条目 = ' + JSON.stringify(item)
				})
			}
		}
	};
</script>
<style lang="scss" scoped>

</style>



```