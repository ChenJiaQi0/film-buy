import ValidateClazz from './Validate'
import Login from './Login.js'
import Pay from './Pay.js'
export const Validate = (rules, messages) => new ValidateClazz(rules, messages)


export function setData(dataset) {
	for (let field in dataset) {
		// 通过正则表达式  查找路径数据
		const regex = /([\w$]+)|\[(:\d)\]/g
		const patten = field.match(regex)
		let result = this // 指向调用的数据 如data
		// 遍历路径  逐级查找  最后一级用于直接赋值
		for (let i = 0; i < patten.length - 1; i++) {
		  const key = patten[i]
		  result = result[key]
		}
		result[patten[patten.length - 1]] = dataset[field] 
	}
}

var flagArr=[]
export function navigateTo(e) {
    let dataset = e.currentTarget?e.currentTarget.dataset:e
	let  {id,type}= dataset
	// #ifndef VUE3
	let thiz = getApp().globalData.currentPage 
	// #endif
	// #ifdef VUE3
	let thiz = this
	// #endif
	
	//节流原理：在一定时间内，只能触发一次
	if(e.currentTarget){
		if (!flagArr[type]) {
			flagArr[type] = true;
			setTimeout(() => {
				flagArr[type] = false;
			}, 500);
		}else{
			return;
		}
	}
	if(type == 'openmodal'){
		thiz[id] =  'open'
		setTimeout(()=>{
			thiz[id] = 'show'
		},1)
	}else if(type == 'closemodal'){
		thiz[id] = ''
	}else if(type == 'page'||type=='inner'||type=='href'){
		thiz.$tools.navigateTo(dataset.url, dataset);
	}else if(type=='submit'){
		showToast('将执行表单提交动作')
	}else if(type=='reset'){
		showToast('将执行表单重置动作')
	}else if(type=='tip'){
		showToast(dataset.tip)
	}else if(type=='confirm'){
		uni.showModal({
			title: '提示',
			content: dataset.tip,
			showCancel: !1,
		});
	}else if(type=='daohang'){
		uni.openLocation({
			latitude: Number(dataset.lat),
			longitude: Number(dataset.lng),
			address:dataset.address,
			success: function () {
				console.log('success');
			}
		});
	}else if(type=='phone'){
		thiz.$tools.makePhoneCall(e)
	}else if(type=='previewImage'||type=='preview'){
		uni.previewImage({
			current: thiz.$tools.renderImage(dataset.img), // 当前显示图片的http链接
			urls: [thiz.$tools.renderImage(dataset.img)] // 需要预览的图片http链接列表
		})
	}else if(type=='copy'){
		uni.setClipboardData({
			data: dataset.copy,
			showToast:false,
			success: function () {
				showToast(dataset.tip||'复制成功','none')
			}
		});
	}else if(type=='xcx'){
		uni.navigateToMiniProgram({
			appId: dataset.appid,
			path: dataset.path,
			success(res) {
				// 打开成功
			}
		})
	}else if(typeof thiz[type]=='function'){
		thiz[type](dataset)
	}else if(type=='login'){
		let logintType = dataset.logintype;
		if(Login[logintType]){
			Login[logintType](thiz,dataset)
		}else{
			showToast(type+'登录有待实现')
		}
	}else if(type=='pay'){
		Pay.pay(dataset)
	}else{
		let formType = dataset['form-type'];
		if(formType&&typeof thiz[formType+"Form"]=='function'){
			thiz[formType+"Form"](dataset)
		}else{
			showToast(type+'类型有待实现')
		}
	}
}


export function showModal(message,title='提示',iscancel=true) {
	return new Promise((resolve) => {
		uni.showModal({
			title: title,
			content: message,
			showCancel: iscancel,
			success: function (res) {
				if (res.confirm) {
					resolve(true)
				} else if (res.cancel) {
					resolve(false)
				}
			}
		});
    })
}

export function showToast(title,icon){
	uni.showToast({
		title: title,
		icon: icon?icon:'none'
	})
}

export function getPickerChildren(data,chindInex1,childIndex2){
	if(chindInex1!=null && data[chindInex1] && data[chindInex1].children && data[chindInex1].children){
		let children = data[chindInex1].children
		//只判断一级
		if(childIndex2==null){
			if(children!=null && children.length>0){
				return children.map(item=>item.label)
			}else{
				return []
			}
		}else{
			//判断二级
			//有可能并设置下级结点
			if(children[childIndex2]==null){
				return []
			}
			let children2 = children[childIndex2].children
			if(children2!=null && children2.length>0){
				return children2.map(item=>item.label)
			}else{
				return []
			}
		}
	}else{
		return []
	}
}


//根据field获取数据
export function getData(thiz,field){
	// 通过正则表达式  查找路径数据
	const regex = /([\w$]+)|\[(:\d)\]/g
	const patten = field.match(regex)
	let result = thiz // 指向调用的数据 如data
	// 遍历路径  逐级查找  最后一级用于直接赋值
	for (let i = 0; i < patten.length - 1; i++) {
	  let key = patten[i]
	  result = result[key]
	}
	return result[patten[patten.length - 1]]
}
export function uploadImage(thiz,field,fieldData,uploadUrl,count=9,type='img'){
	return new Promise((resolve) => {
		if(!uploadUrl){
			showToast('请配置上传地址')
			resolve()
			return;
		}
		uni.chooseImage({
			count: count,
			sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
			sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有javascript:;
			success: function (res) {
				// 返回选定照片的本地文件路径列表，tempFilePath可以作为img标签的src属性显示图片
				let tempFilePaths = res.tempFilePaths;
				for (let i = 0; i < tempFilePaths.length; i++) {
					uni.uploadFile({
						url: thiz.$http.setUrl(uploadUrl), //仅为示例，非真实的接口地址
						filePath: tempFilePaths[i],
						name: 'file',
						header:{
							Authorization : thiz.$session.getToken()||''
						},
						success(res) {
							let data = thiz.$tools.fromJson(res.data);
							let url = ''
							if(data.url){
								url = thiz.$tools.renderImage(data.url);
							}
							if(data.data &&thiz.$tools.isObject(data.data) && data.data.url){
								url = thiz.$tools.renderImage(data.data.url);
							}
							if(type=='avatar'){
								thiz.setData({
									[field]: url,
								});
							}else{
								let files = getData(thiz,fieldData).concat(url);
								thiz.setData({
									[fieldData]: files,
									[field]: (files || []).join(',').replace(/^[]/, ''),
								});
							}
							
						},
						complete(){
							if(i==tempFilePaths.length-1){
								resolve()
							}
						}
					});
				}
			},
		});
	})
}


/**
 * 授权请求
 * @export
 * @param {*} authorizeScope 更多scope参考：https://developers.weixin.qq.com/miniprogram/dev/framework/open-ability/authorize.html
 * @param {*} modal modal弹窗参数信息
 * @returns
 */
export function setAuthorize(authorizeScope, modal,errortip='获取当前设置异常') {
	
	return new Promise((resolve, reject) => {
		//#ifdef H5 || APP-PLUS
		resolve()
		// #endif
		// #ifndef H5 && APP-PLUS
		if (!modal) {
			modal = {
				title: '授权',
				content: '需要您设置授权已使用相应功能',
				confirmText: '设置'
			}
		}
		uni.getSetting({
			success(res) {
				// hasAuthor === undefined  表示 初始化进入，从未授权
				// hasAuthor === true       表示 已授权
				// hasAuthor === false      表示 授权拒绝
				const hasAuthor = res.authSetting[authorizeScope]
				switch (hasAuthor) {
					case undefined:
						uni.authorize({
							scope: authorizeScope,
							success: res => {
								resolve(res)
							},
							fail: err => {
								uni.showToast({
									title: '授权失败',
									icon: 'none',
									duration: 3000
								})
								reject(err)
							}
						})
						break
					case true:
						resolve()
						break
					case false:
						uni.showModal({
							...modal,
							success: res => {
								if (res.confirm) {
									uni.openSetting({
										success: res => {
											if (res.authSetting[
													authorizeScope]) {
												resolve(res)
											} else {
												reject(res)
												uni.showToast({
													title: '授权失败',
													icon: 'none',
													duration: 3000
												})
											}
										},
										fail: err => {
											reject(err)
											uni.showToast({
												title: '打开设置异常',
												icon: 'none',
												duration: 3000
											})
										}
									})
								} else {
									reject(res)
									uni.showToast({
										title: '授权失败',
										icon: 'none',
										duration: 3000
									})
								}
							},
							fail: err => {
								reject(err)
								uni.showToast({
									title: '弹窗异常',
									icon: 'none',
									duration: 3000
								})
							}
						})
						break
				}
			},
			fail: err => {
				reject(err)
				uni.showToast({
					title: errortip,
					icon: 'none',
					duration: 3000
				})
			}
		})
		// #endif
	})
}



//页面点击时对参数进行了转义，要进行反转义
export function getOption(option){
	if(option !== null && typeof option === 'object'){
		for (let key in option) {
			option[key] = decodeURIComponent(option[key])
		}
	}
	return option
}

export function setCurrentPage(page){
    if(this.$session.getUser()){
		page.userInfo = this.$session.getUser()
	}
	if(this.$session.getValue("redirect_page")){
		let value = this.$session.getValue("redirect_page")
		this.$session.setValue("redirect_page",null)
		this.$tools.navigateTo(value.url, value);
	}
	getApp().globalData.currentPage = page
}
