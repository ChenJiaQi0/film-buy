# cc-advertView

#### 使用方法 
```使用方法
<!-- ref：唯一ref  timedown:开屏广告秒数  imageUrl：图片地址  advertClick：广告图点击 -->
<cc-advertView ref="ccAdvert" :timedown="12" :imageUrl="imgUrl" @advertClick="advertClick"></cc-advertView>


//初始化广告开屏广告	
onReady() {

	let myThis = this;
	// 模拟后台请求
	setTimeout(function() {
		myThis.imgUrl = 'https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_1280.jpg'
		// 初始化广告图
		myThis.$refs.ccAdvert.initAdvert();
	
	}, 200);
},					


```

#### HTML代码实现部分
```html
<template>
	<view class="content">

		<!-- ref：唯一ref  timedown:开屏广告秒数  imageUrl：图片地址  advertClick：广告图点击 -->
		<cc-advertView ref="ccAdvert" :timedown="12" :imageUrl="imgUrl" @advertClick="advertClick"></cc-advertView>

		<!-- mySrc:图片地址 title：标题 @menuClick：按钮点击 -->
		<cc-wxBtn mySrc="/static/image/member-menu4.png" title="我的余额" @menuClick="menuClick"></cc-wxBtn>
		<!-- mySrc:图片地址 title：标题 @menuClick：按钮点击 -->
		<cc-wxBtn mySrc="/static/image/member-menu2.png" title="在线客服" @menuClick="menuClick"></cc-wxBtn>
		<!-- mySrc:图片地址 title：标题 @menuClick：按钮点击 -->
		<cc-wxBtn mySrc="/static/image/member-menu3.png" title="邀请有礼" @menuClick="menuClick"></cc-wxBtn>
		<!-- mySrc:图片地址 title：标题 @menuClick：按钮点击 -->
		<cc-wxBtn mySrc="/static/image/member-menu5.png" title="关于我们" @menuClick="menuClick"></cc-wxBtn>


	</view>
</template>

<script>
	export default {

		data() {
			return {

				imgUrl: ''

			}
		},
		onReady() {

			let myThis = this;
			// 模拟后台请求
			setTimeout(function() {
				myThis.imgUrl = 'https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_1280.jpg'
				// 初始化广告图
				myThis.$refs.ccAdvert.initAdvert();

			}, 200);

		},
		mounted() {


		},
		methods: {

			// 广告图点击
			advertClick() {

				console.log("广告图点击");
				uni.showModal({
					title: '温馨提示',
					content: '跳转广告事件'
				})

			},


		}
	}
</script>

<style>
	page {

		background-color: white;
		margin-bottom: 50px;
	}
</style>
```