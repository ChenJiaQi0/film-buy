import ServiceBase from './ServiceBase';
import Session from './Session';
class Service extends ServiceBase {
	constructor() {
		super();
		this.$$prefix = '';
	}

	/**
	 * 初始化默认拦截器
	 */
	__initInterceptor() {
		this.interceptors.push({
			request(request) {
				request.header = request.header || {};
				//比如在头增加参数Authorization，默认已经加了，根据你的需求来改造
				if (Session.getToken()) {
					request.header.Authorization = Session.getToken();
				}
				return request;
			},
			requestError(requestError) {
				return Promise.reject(requestError);
			},
			response(response) {
				//如果你的API返回了一个code等于401,我希望跳转至登录页啥
				if (response.data.code == 401) {
					Session.clearUser();
					uni.reLaunch({
						url: getApp().globalData.homePage
					});
					return;
				}
				return response;
			},
			responseError(responseError) {
				return Promise.reject(responseError);
			}
		});
	}

	//获取POST数据
	postData(params, url) {
		return this.post(url || this.$$path.data, params);
	}

	//获取GET数据
	getData(params, url) {
		return this.get(url || this.$$path.data, params);
	}

	//保存数据
	saveData(params, url) {
		return this.post(url || this.$$path.save, params);
	}

	//删除数据
	delData(params, url) {
		return this.post(url || this.$$path.del, params);
	}
}

export default Service;
