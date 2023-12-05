//登录相关方法
var Login = {
	//微信登录
	weixin(thiz,dataset) {
		if(uni.getUserProfile){
			uni.getUserProfile({
				lang: 'zh_CN',
				desc: '用于登陆',
				success: function (wxInfo) {
					uni.login({
						provider:'weixin',
						success: function (res) {
							let data={
								code:res.code,
								type: dataset.logintype,
								userInfo: JSON.stringify(wxInfo.userInfo)
							}
							thiz.$http.post(dataset.loginurl,data).then(res=>{
								if(res.code==200){
									thiz.setData({
										userInfo:res.data
									})
									thiz.$session.setUser(res.data)
								}
								if(thiz[dataset.callback]){
									thiz[dataset.callback](res)
								}else if(thiz[dataset.callback+"Function"]){
									thiz[dataset.callback+"Function"](res)
								}else if(thiz[dataset.callback+"Api"]){
									thiz[dataset.callback+"Api"](res)
								}
							})
						},
						fail: function () {
							wx.showModal({
								title: '获取用户信息',
								content: '请允许授权以便为您提供给服务',
								success: function (res) {
									if (res.confirm) {
										thiz.navigateTo(dataset)
									}
								}
							})
						}
					});
				},
				fail: function (res) {
					wx.showModal({
						title: '友情提示',
						content: '已拒绝小程序获取信息',
						showCancel: !1,
					})
				}
			})
		}else{
			uni.showToast({
				title: '登录失败，请在小程序上登录',
				icon: 'none'
			})
		}
	}
}

export default Login
