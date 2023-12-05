<template>
	<view class="diygw-modal basic" v-if="showPrivacy" :class="showPrivacy?'show':''" style="z-index: 1000000">
		<view class="diygw-dialog diygw-dialog-modal basis-lg">
			<view class="justify-end diygw-bar">
				<view class="content"> {{title}} </view>
			</view>
			<view>
				<view class="flex diygw-dialog-content flex-direction-column privacy-content">
					<view class="diygw-col-24"> {{contentstart}}<text :style="{color:agreebg}"  @tap="handleOpenPrivacyContract">{{privacy}}</text>。{{contentend}} </view>
					<view class="flex diygw-col-24">
						<button id="agree-btn" :style="{background:agreebg,color:agreecolor}" open-type="agreePrivacyAuthorization" @agreeprivacyauthorization="handleAgree" class="diygw-btn  radius flex-sub margin-xs">同意并继续</button>
					</view>
					<view class="flex diygw-col-24">
						<button id="disagree-btn" :style="{background:disagreebg,color:disagreecolor}" class="diygw-btn  radius flex-sub margin-xs" @tap="handleDisagree">不同意</button>
					</view>
				</view>
			</view>
		</view>	
	</view> 
</template>

<script>
	export default {
		props: {
			title: {
				type: String,
				default: '用户隐私保护提示'
			},
			contentstart:{
				type: String,
				default:'亲爱的用户，感谢您信任并使用本小程序。请您在点击同意之前仔细阅读并充分理解',
			},
			privacy:{
				type: String,
				default:'《用户隐私保护指引》',
			},
			contentend:{
				type: String,
				default:'当点击同意并继续时，即表示您已理解并同意该条款内容，该条款将对您产生法律约束力；如您不同意，将无法继续使用小程序相关功能。',
			},
			agreebg:{
				type: String,
				default:'#07c160',
			},
			agreecolor:{
				type: String,
				default:'#fff',
			},
			disagreebg:{
				type: String,
				default:'#aaaaaa',
			},
			disagreecolor:{
				type: String,
				default:'#fff',
			},
			isexit:{
				type:Boolean,
				default:true
			},
		},
		data() {
			return {
				showPrivacy: false,
				resolvePrivacyAuthorization: null,
				privacyResolves: new Set()
			}
		},
		mounted() {
			this.init()
		},
		methods: {
			// 监听何时需要提示用户阅读隐私政策
			init() {
				let thiz = this;
				wx.requirePrivacyAuthorize({
					success: (e) => {
						// 用户同意授权
						// 继续小程序逻辑
						console.log(e)
					  // 用户同意授权
					  // 继续小程序逻辑
					},
					fail: (e) => {
						console.log(e)
					}, // 用户拒绝授权
					complete: () => {}
				})
				if (wx.onNeedPrivacyAuthorization) {
					wx.onNeedPrivacyAuthorization((resolve) => {
						thiz.resolvePrivacyAuthorization = resolve
						thiz.openPrivacy()
					})
				}
			},
			//打开隐私协议
			openPrivacyContract() {
				wx.openPrivacyContract({
					success(res) {
						console.log('打开隐私协议', res);
					},
					fail(err) {
						console.error('打开隐私协议失败', err)
					}
				});
			},
			// 不同意
			handleDisagree() {
				this.resolvePrivacyAuthorization({
						event: 'disagree',
						buttonId: 'disagree-btn'
				});
				//关闭弹窗
				this.disopenPrivacy()
				if(this.isexit){
					//退出小程序
					wx.exitMiniProgram();
				}
				
			},
			// 同意并继续
			handleAgree() {
				this.resolvePrivacyAuthorization({
						event: 'agree',
						buttonId: 'agree-btn'
				});
				//关闭弹窗
				this.disopenPrivacy()
			},
			//打开弹窗
			openPrivacy() {
				if (this.showPrivacy === false) {
					this.showPrivacy = true
				}
			},
			//关闭弹窗
			disopenPrivacy() {
				if (this.showPrivacy === true) {
					this.showPrivacy = false
				}
			},
		}
	}
</script>

<style>
	.privacy-content{
		padding:10px;
		line-height: 1.5;
		font-size: 28rpx;
	}
</style>
