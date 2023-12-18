<template>
	<view>
		<view class='bg-set'></view>
		<view class='login'>
			<view class='logo'>
				<image src='/static/login.png'></image>
			</view>
			<view class='info'>忘记密码</view>
			<view class='form'>
				<input type="text" v-model='username' class='logininput' placeholder="请输入邮箱"
					placeholder-class="placeholder">
			</view>
			<view class='form'>
				<input type="password" controlled="true" v-model='code' class='codeinput' placeholder="请输入验证码"
					placeholder-class="placeholder">
				<view :class="disabled ? 'huoquzhong' : 'huoqu'" @click="get_code">{{ time }}{{ text }}</view>
			</view>
			<view class='form'>
				<input type="text" v-model="password" class='input' :password="show" placeholder="请输入密码"
					placeholder-class="placeholder">
			</view>
			<view class='btn'>
				<view class='button' @click='save()'>确定</view>
			</view>
		</view>
	</view>
</template>

<script>
	import {
		CODE_FORGET,
		REPWD
	} from '@/utils/api.js';
	export default {
		data() {
			return {
				username: '',
				code: '',
				password: '',
				show: true,
				text: '获取验证码',
				time: '',
				disabled: false,
				rules: {
					password: {
						rule: /.+/,
						msg: "密码不能为空"
					},
					username: {
						rule: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,
						msg: "邮箱格式错误"
					},
					code: {
						rule: /^[0-9]{4}$/,
						msg: "请输入4位数字验证码"
					}
				},
			}
		},
		methods: {
			showPass(e) {
				console.log(e);
				this.show = e;
			},
			validate(key) {
				let bool = true;
				if (!this.rules[key].rule.test(this[key])) {
					//提示信息
					uni.showToast({
						title: this.rules[key].msg,
						icon: 'none'
					})
					//取反
					bool = false;
					return false;
				}
				return bool;
			},
			goto(url) {
				uni.navigateTo({
					url: url
				})
			},
			//获取验证码
			async get_code() {
				if (this.disabled) {
					return;
				}
				if (!this.validate('username')) return;
				uni.showLoading({
					title: '发送中',
					mask: true
				});
				uni.request({
					url: CODE_FORGET,
					data: {
						username: this.username
					},
					method: 'get', //get、post、delete
					success: re => {
						setTimeout(function() {
							uni.hideLoading();
						}, 100);
						if (re.data.code == 200) {
							this.disabled = true;
							this.setInterValFunc(); //开启倒计时
						} else {
							uni.showToast({
								title: re.data.msg,
								icon: "none"
							})
						}
					}
				})
			},
			//开启倒计时
			setInterValFunc() {
				this.time = 60;
				this.text = '秒';
				this.setTime = setInterval(() => {
					if (this.time - 1 == 0) {
						this.time = '';
						this.text = '重新获取';
						this.code = '';
						this.disabled = false;
						clearInterval(this.setTime);
					} else {
						this.time--;
					}
				}, 1000);
			},
			save() {
				if (!this.validate('username')) return;
				if (!this.validate("password")) return;
				uni.showLoading({
					title: '提交中',
					mask: true
				});
				uni.request({
					url: REPWD,
					data: {
						username: this.username,
						password: this.password,
						code: this.code
					},
					method: 'post', //get、post、delete
					success: re => {
						setTimeout(function() {
							uni.hideLoading();
						}, 100);
						if (re.data.code == 200) {
							uni.showToast({
								title: '修改成功'
							})
							setTimeout(function() {
								uni.navigateBack()
							}, 1000);

						} else {
							uni.showToast({
								title: re.data.msg,
								icon: 'none'
							})
						}
					}
				})
			}
		}
	}
</script>

<style>
	.bg-set {
		position: fixed;
		width: 100%;
		height: 100%;
		top: 0;
		left: 0;
		z-index: -1;
		background: #FFFFFF;
	}

	.login {
		width: 90%;
		margin: 0 auto;
		color: #FFFFFF;
	}

	.login .logo {
		margin-top: 100rpx;
		width: 100%;
		height: 300rpx;
		text-align: center;
	}

	.login .logo image {
		width: 200rpx;
		height: 200rpx;
	}

	.login .info {
		width: 100%;
		height: 40rpx;
		line-height: 40rpx;
		text-align: center;
		font-size: 30rpx;
	}

	.login .form {
		width: 100%;
		height: 100rpx;
		/* background-color: #FFFFFF; */
		/* margin-top:40rpx; */
		/* border-radius: 40rpx; */
		border-bottom: 1px solid #f2f2f2;
	}

	.login .form .logininput {
		width: 90%;
		margin: 0 auto;
		height: 100rpx;
		line-height: 100rpx;
		color: #000000;
	}

	.login .form .codeinput {
		width: 60%;
		margin: 0 auto;
		height: 100rpx;
		line-height: 100rpx;
		color: #000000;
		float: left;
		margin-left: 5%;
		font-size: 26rpx;
	}

	.login .form .fasong {
		width: 30%;
		height: 100rpx;
		line-height: 100rpx;
		float: right;
		color: #0066FF;
		text-align: center;
		font-size: 26rpx;
	}

	.login .form .huoqu {
		width: 30%;
		height: 100rpx;
		line-height: 100rpx;
		float: right;
		font-size: 26rpx;
		text-align: center;
		font-family: PingFangSC-Regular, PingFang SC;
		font-weight: 400;
		color: #0066FF;
	}

	.login .form .huoquzhong {
		width: 30%;
		height: 100rpx;
		line-height: 100rpx;
		float: right;
		font-size: 26rpx;
		font-family: PingFangSC-Regular, PingFang SC;
		font-weight: 400;
		text-align: center;
		color: #999999;
	}

	.login .form .input {
		width: 75%;
		margin: 0 auto;
		height: 100rpx;
		line-height: 100rpx;
		color: #000000;
		float: left;
		margin-left: 5%;
	}

	.placeholder {
		font-size: 26rpx;
		color: #b8b8b8;
		line-height: 60rpx;
	}

	.login .forget {
		text-align: right;
		width: 100%;
		height: 80rpx;
		line-height: 80rpx;
		font-size: 26rpx;
	}

	.btn {
		width: 90%;
		margin: 0 auto;
		margin-top: 100rpx;
		text-align: center;
		font-size: 26rpx;
	}

	.btn .button {
		width: 100%;
		height: 80rpx;
		line-height: 80rpx;
		border-radius: 40rpx;
		color: #FFFFFF;
		background-color: #db5f54;
	}

	.btn .desc {
		width: 100%;
		height: 80rpx;
		line-height: 80rpx;
	}
</style>