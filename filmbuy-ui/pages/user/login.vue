<template>
	<view>
		<view class='bg-set'></view>
		<view class='login'>
			<view class='logo'>
				<image src='/static/login.png'></image>
			</view>
			<view class='form'>
				<input type="text" v-model="username" class='input' placeholder="请输入邮箱号"
					placeholder-class="placeholder">
			</view>
			<view class='form' v-if='usernamelogin'>
				<input type='text' v-model="password" class='input' :password="show" placeholder="请输入密码"
					placeholder-class="placeholder">
			</view>
			<view class='form' v-if='codelogin'>
				<input type="digit" controlled="true" v-model="code" class='codeinput' :password="show"
					placeholder="请输入验证码" placeholder-class="placeholder">
				<view :class="disabled ? 'huoquzhong' : 'huoqu'" @tap="get_code">{{ time }}{{ text }}</view>
			</view>
			<view class='forget' @tap="goForget">
				忘记密码？
			</view>
			<checkbox-group @change="choose">
				<view class='info1'>
					<label class="radio">
						<checkbox :value="isCheck" color="#0066ff" style="float:left;transform:scale(0.7)" />
						<view style='float:left;' @click='showxieyi'>我已阅读并同意</view>
						<view style='float:left;color:#0066ff;' @click='showxieyi'>《用户协议》</view>
						<view style='float:left;color:#0066ff;' @click='showyinsi'>《隐私政策》</view>
					</label>
				</view>
			</checkbox-group>
			<view class='btn'>
				<view class='button' :class="[rtrues()]" @click='login'>登录</view>
				<view class='desc' @click='changeway(usernamelogin)' v-if='usernamelogin'>验证码登录</view>
				<view class='desc' @click='changeway(usernamelogin)' v-if='!usernamelogin'>手机密码登录</view>
			</view>
			<view class='footer'>
				<view class='desc'>未注册的用户使用验证码登录自动注册</view>
			</view>
		</view>
	</view>
</template>

<script>
	import {
		LOGIN_URL,
		CODE_URL
	} from '@/utils/api.js'
	export default {
		data() {
			return {
				xieyi: '',
				usernamelogin: true,
				codelogin: false,
				show: true,
				isCheck: '1',
				isCheckEd: false,
				disabled: false,
				username: '3465976682@qq.com',
				password: '123456',
				code: '',
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
				ltype: '',
				text: '获取验证码',
				time: '',
				hasshowfirst: '',
			}
		},
		onLoad(option) {},
		methods: {
			//跳转忘记密码
			goForget() {
				uni.navigateTo({
					url: '/pages/user/forget'
				})
			},
			//查看用户协议
			showxieyi() {
				console.log('查看用户协议')
			},
			//查看隐私政策
			showyinsi() {
				console.log('查看隐私政策')
			},
			rtrues() {
				if (this.isCheckEd) {
					return 'isCheckEd'
				}
			},
			//选中协议
			choose(e) {
				if (e.detail.value.length > 0) {
					this.isCheckEd = true;
				} else {
					this.isCheckEd = false;
				}
			},
			//显示密码
			showPass(e) {
				this.show = e;
			},
			//选择登录方式
			changeway(r) {
				if (r) {
					this.usernamelogin = false;
					this.codelogin = true;
				} else {
					this.usernamelogin = true;
					this.codelogin = false;
				}
			},
			//验证
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
					url: CODE_URL,
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
			//倒计时
			setInterValFunc() {
				this.time = 300;
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
			//跳转
			goto(url) {
				uni.navigateTo({
					url: url
				})
			},
			//登录
			login() {
				if (!this.isCheckEd) return;
				if (!this.validate('username')) return;
				if (this.usernamelogin) {
					//手机号密码登录
					if (!this.validate("password")) return;
					uni.showLoading({
						title: '登录中',
						mask: true
					});
					uni.request({
						url: LOGIN_URL,
						data: {
							username: this.username,
							password: this.password
						},
						method: 'POST', //get、post、delete
						success: re => {
							uni.hideLoading();
							if (re.data.code == 200) {
								console.log(re.data.data);
								uni.showToast({
									title: '登录成功',
									duration: 1000,
									success() {
										// uni.switchTab({
										// 	url: '/pages/film/index'
										// })
										uni.navigateBack()
									}
								})
								uni.setStorageSync(
									'user',
									re.data.data.user
								)
								uni.setStorageSync(
									'token',
									re.data.data.token
								)
							} else {
								uni.showToast({
									title: re.data.msg,
									icon: 'none'
								});

							}
						}
					})
				} else {
					//手机号验证码登录
					if (!this.validate("code")) return;
					uni.showLoading({
						title: '登录中',
						mask: true
					});
					uni.request({
						url: LOGIN_URL,
						data: {
							username: this.username,
							code: this.code
						},
						method: 'POST', //get、post、delete
						success: re => {
							uni.hideLoading();
							if (re.data.code == 200) {
								console.log(re.data.data);
								uni.showToast({
									title: '登录成功',
									duration: 1000,
									success() {
										// uni.switchTab({
										// 	url: '/pages/film/index'
										// })
										uni.navigateBack()
									}
								})
								uni.setStorageSync(
									'user',
									re.data.data.user
								)
								uni.setStorageSync(
									'token',
									re.data.data.token
								)
							} else {
								uni.showToast({
									title: re.data.msg,
									icon: 'none'
								});

							}
						}
					})
				}

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
		background-color: #FFFFFF;
		/* margin-top:40rpx; */
		/* border-radius: 40rpx; */
		border-bottom: 1px solid #F2F2F2;
	}

	.login .form .left {
		width: 100rpx;
		height: 100rpx;
		line-height: 100rpx;
		float: left;
		color: #807E7E;
		text-align: center;
	}

	.login .form .next {
		float: left;
		width: 8px;
		height: 8px;
		border-top: 2px solid #807E7E;
		border-right: 2px solid #807E7E;
		transform: rotate(135deg);
		margin-top: 35rpx;
		margin-left: 20rpx;
		margin-right: 20rpx;
	}

	.login .form .right {
		height: 100rpx;
		float: left;
	}

	.login .form .right .logininput {
		width: 90%;
		margin: 0 auto;
		height: 100rpx;
		line-height: 100rpx;
		color: #000000;
		font-size: 26rpx;
	}

	.login .form .input {
		width: 75%;
		margin: 0 auto;
		height: 100rpx;
		line-height: 100rpx;
		color: #000000;
		float: left;
		margin-left: 5%;
		font-size: 26rpx;
	}

	.placeholder {
		font-size: 26rpx;
		color: #807E7E;
		line-height: 60rpx;
	}

	.login .forget {
		text-align: right;
		width: 100%;
		height: 80rpx;
		line-height: 80rpx;
		font-size: 26rpx;
		color: #000;
	}

	.login .info1 {
		color: #807E7E;
		font-size: 24rpx;
		text-align: left;
		width: 100%;
		height: 100rpx;
		line-height: 100rpx;
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

	.btn {
		width: 90%;
		margin: 0 auto;
		text-align: center;
		font-size: 26rpx;
	}

	.btn .button {
		background-color: #ECECEC;
		width: 100%;
		height: 80rpx;
		line-height: 80rpx;
		border-radius: 40rpx;
		color: #ffffff;
		letter-spacing: 10rpx;
	}

	.btn .desc {
		width: 100%;
		height: 80rpx;
		line-height: 80rpx;
		color: #807E7E;
	}

	.btn .isCheckEd {
		width: 100%;
		height: 80rpx;
		line-height: 80rpx;
		border-radius: 40rpx;
		color: #ffffff;
		letter-spacing: 10rpx;
		background-color: #db5f54;
	}

	.footer {
		width: 90%;
		height: 140rpx;
		margin: 0 auto;
		margin-top: 100rpx;

	}

	.footer .desc {
		width: 100%;
		margin: 0 auto;
		height: 80rpx;
		line-height: 80rpx;
		color: #807E7E;
		text-align: center;
		font-size: 26rpx;
	}
</style>