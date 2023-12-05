export function request(url,method,data){
	let token;
	if(uni.getStorageSync('token') == ''){
		token = 'no-token';
	}else{
		token = uni.getStorageSync('token')
	}
	
	return new Promise(function(resolve,reject){
		uni.request({
			url:url,
			method:method,
			data:data,
			header:{
				'Content-Type':'application/json',
				'token':token
			},
			success:function(res){
				resolve(res.data)
			},
			fail:function(err){
				uni.showModal({
					title:'错误',
					content:'网络请求异常',
					showCancel:false
				});
				reject(err);
			},
			
		})
	});
}