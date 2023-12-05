import __config from '../siteinfo'
var SESSION_SUFFIX = "session_com_"
var SESSION_KEY = 'user_session'
var REDIRECT_SESSION_KEY = 'redirect_session';

var Session = {
	getRedirecturl() {
		return uni.getStorageSync(SESSION_SUFFIX+__config.appid+"_"+REDIRECT_SESSION_KEY) || null;
	},

	setRedirecturl(url) {
		if(url==null){
			uni.removeStorageSync(SESSION_SUFFIX+__config.appid+"_"+REDIRECT_SESSION_KEY)
		}else{
			uni.setStorageSync(SESSION_SUFFIX+__config.appid+"_"+REDIRECT_SESSION_KEY, url);
		}
		
	},
	getUser() {
		return uni.getStorageSync(SESSION_SUFFIX+__config.appid+SESSION_KEY) || null;
	},

	setUser(session) {
		uni.setStorageSync(SESSION_SUFFIX+__config.appid+SESSION_KEY, session);
	},

	clearUser() {
		uni.removeStorageSync(SESSION_KEY+__config.appid);
		const res = uni.getStorageInfoSync();	
		res.keys.forEach(key=>{
			if(key.startsWith(SESSION_SUFFIX+__config.appid)){
				uni.removeStorageSync(key);
			}
		})
	},
	getToken() {
		var userInfo = this.getUser();
		return userInfo ? userInfo.token : null
	},
	getOpenId() {
		var userInfo = this.getUser();
		return userInfo ? userInfo.openid : null
	},
	
	setValue(key,value) {
		if(value==null){
			uni.removeStorageSync(SESSION_SUFFIX+__config.appid+key)
		}else{
			uni.setStorageSync(SESSION_SUFFIX+__config.appid+key, value);
		}
	},
	
	getValue(key){
		return uni.getStorageSync(SESSION_SUFFIX+__config.appid+key) || null;
	}
	
}

export default Session
