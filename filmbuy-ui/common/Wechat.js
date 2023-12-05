//公众号相关方法
var jwx = {
	getCode(){
		let params= getApp().$tools.getUrlParams(location.search)
		let code =  params.code; // 截取code
		return code
	},
	async login() {
		if(this.isWechat()){
			//如果已经登录过不登录
			if(!getApp().$session.getUser()){
				//获取浏览器code
				let code = this.getCode()
				// 获取之前的code 
				let oldCode = getApp().$session.getValue('wechatCode')
				let pages = getCurrentPages()
				let page = pages[pages.length-1]
				// 如果没有code，就去请求获取code
				if (code == null || code === '' || code == 'undefined' || code == oldCode) {
					let globalOption = page.globalOption
					if(!globalOption.url){
						globalOption.url = page.route
					}
					//记住当前登录地址
					getApp().$session.setValue("redirect_page",globalOption)
					let local = window.location.href; // 获取页面url 
					if(local.indexOf("#")>=0){
						local = local.split("#")[0]
					}
					if(local.indexOf("?")>=0){
						local = local.split("?")[0]
					}
					// 获取公众号appid
					let appid  = getApp().$session.getValue('appid')
					if(!appid){
						let appdata =await getApp().$http.get('/api/wechat/getAppid',{},{},'json')
						if(!appdata || (appdata && appdata.code!=200)){
							getApp().showToast('获取公众号APPID配置错误')
							return
						}
						appid = appdata.data.appid 
						getApp().$session.setValue('appid',appid)
					}		
					
					if(!appid){
						getApp().showToast('获取公众号APPID配置错误')
						return
					}		
					let uri = encodeURIComponent(local)
					// 设置旧的code为0，避免死循环
					getApp().$session.setValue('wechatCode',null)
					location.replace(`https://open.weixin.qq.com/connect/oauth2/authorize?appid=${appid}&redirect_uri=${uri}&response_type=code&scope=snsapi_userinfo&state=diygwwechatlogin#wechat_redirect`)
				} else {
					console.log('存在code，使用code换取用户信息')
					// 保存最新code 
					getApp().$session.setValue('wechatCode',code)
					let accessdata = await getApp().$http.get('/api/wechat/login',{
						code
					},{},'json')
					if(!accessdata|| (accessdata && accessdata.code!=200)){
						getApp().showToast('获取用户信息失败')
					}else{
						getApp().$session.setUser(accessdata.data)
						getApp().globalData.currentPage.userInfo = accessdata.data 
						let href = location.href;
						let params= getApp().$tools.getUrlParams(location.search)
						href = href.replace("code="+params.code,"").replace("&state=diygwwechatlogin","")
						if(href.indexOf("?#/")>0){
							href = href.replace("?#/","#/")
						}
						location.replace(href)
					}
				}
			}else{
				getApp().globalData.currentPage.userInfo = getApp().$session.getUser()
			}
		}else{
			getApp().showToast('请使用微信打开')
		}
	},
	//判断是否在微信中    
	isWechat() {
		var ua = window.navigator.userAgent.toLowerCase();
		if (ua.match(/micromessenger/i) == 'micromessenger') {
			//console.log('是微信客户端')  
			return true;
		} else {
			//console.log('不是微信客户端')  
			return false;
		}
	},
	// 初始化
	initJssdk(callback) {
		// 获取页面url
		let url = window.location.href; 
		if(url.indexOf("#")>=0){
			url = url.split("#")[0]
		}
		//服务端进行签名
		getApp().$http.post('/api/wechat/getSignPackage',{
			url: url
		},{},'json').then(res=>{
			console.log('------签名返回数据------')
			console.log(res.data)
			//返回需要的参数appId,timestamp,noncestr,signature等  
			//注入config权限配置
			jWeixin.config({
				debug: false,
				appId: res.data.appId,
				timestamp: res.data.timestamp,
				nonceStr: res.data.nonceStr,
				signature: res.data.signature,
				jsApiList: res.data.jsApiList
			});
			jWeixin.ready(function() {
				console.log('config注入成功')
				if (callback) {
					callback();
				}
			})
		})
	},
	async pay(param){
		if(!getApp().$session.getToken() || !getApp().$session.getUser().openid){
			//如果参数自带openid跳过验证
			if(!param.openid){
				getApp().showToast('请先登录')
				setTimeout(async ()=>{
					await this.login()
				},1500)
				return;
			}
		}
		if(!param.total){
			getApp().showToast('请配置价格参数total')
			return;
		}
		let data = await getApp().$http.post('/api/wepay/order',{
			total:param.total,
			body:param.body,
			openid:param.openid||getApp().$session.getUser().openid,
		},{},'json')
		
		if(data.code!=200){
			getApp().showToast(data.msg)
			return;
		}
		this.wxpay(Object.assign(data,param))
	},
	//在需要定位页面调用  
	getlocation(callback) {
		if (!this.isWechat()) {
			getApp().showToast('请使用微信打开')
			return;
		}
		this.initJssdk(function(res) {
			jWeixin.ready(function() {
				jWeixin.getLocation({
					// type: 'gcj02', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'  
					success(res) {
						// console.log(res);  
						callback(res)
					},
					fail(res) {
						console.log(res)
					},
					// complete:function(res){  
					//     console.log(res)  
					// }  
				});
			});
		});
	},
	openlocation(data, callback) { //打开位置  
		if (!this.isWechat()) {
			getApp().showToast('请使用微信打开')
			return;
		}
		this.initJssdk(function(res) {
			jWeixin.ready(function() {
				jWeixin.openLocation({ //根据传入的坐标打开地图  
					latitude: data.latitude,
					longitude: data.longitude
				});
			});
		});
	},
	chooseImage(callback) { //选择图片  
		if (!this.isWechat()) {
			getApp().showToast('请使用微信打开')
			return;
		}
		//console.log(data);  
		this.initJssdk(function(res) {
			jWeixin.ready(function() {
				jWeixin.chooseImage({
					count: 1,
					sizeType: ['compressed'],
					sourceType: ['album'],
					success(res) {
						callback(res)
					}
				})
			});
		});
	},
	
	//微信支付  
	wxpay(params = {}) {
		if (!this.isWechat()) {
			getApp().showToast('请使用微信打开')
			return;
		}
		this.initJssdk(function() {
			jWeixin.chooseWXPay({
				timestamp: params.data.timeStamp, // 支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符  
				nonceStr: params.data.nonceStr, // 支付签名随机串，不长于 32 位  
				package: params.data.package, // 统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=\*\*\*）  
				signType: params.data.signType, // 签名方式，默认为'SHA1'，使用新版支付需传入'MD5'  
				paySign: params.data.paySign, // 支付签名  
				success(res) {
					if(params.success && typeof params.success=='function'){
						params.success(res)
					}else{
						console.log('配置支付回调成功方法')
					}
				},
				cancel(res) {
					if(params.fail && typeof params.fail=='function'){
						params.fail(res)
					}else{
						console.log('配置支付回调失败方法')
					}
				},
				// complete:function(res){  
				//     console.log(res)  
				// }  
			});
		});
	},
	//在需要自定义分享的页面中调用
	share(data) {
		//每次都需要重新初始化配置，才可以进行分享  
		this.initJssdk(function() {
			var shareData = {
				title: data && data.title ? data.title : 'DIY可视化',
				desc: data && data.desc ? data.desc : 'DIY可视化设计生成UNIAPP源码',
				link: data && data.link ? data.link : window.location.href,
				imgUrl: data && data.imgUrl ? data.imgUrl : '',
				success(res) {
					//用户点击分享后的回调，这里可以进行统计，例如分享送金币之类的  
					// request.post('/api/member/share');
					console.log('设置成功')
				},
				cancel(res) {}
			};
			//分享给朋友接口  
			jWeixin.onMenuShareAppMessage(shareData);
			//分享到朋友圈接口  
			jWeixin.onMenuShareTimeline(shareData);
		});
	},
	// 选择通讯地址
	chooseAddress(callback) {
		this.initJssdk(function() {
			jWeixin.openAddress({
				success(res) {
					callback(res)
				}
			})
		})
	}
}

export default jwx