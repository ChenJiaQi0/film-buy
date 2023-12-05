import QQMapWX from './qqmap-wx-jssdk.min.js'

import {
	setAuthorize
} from '@/common/Page.js'


/**
 * 逆地址解析（坐标转具体位置信息）
 * @doc 文档参考：https://lbs.qq.com/qqmap_wx_jssdk/method-reverseGeocoder.html
 * @export
 * @param {*} location 坐标：{ latitude: 39.984060, longitude: 116.307520 }
 * @returns
 */
export function reverseGeocoder(location, makey) {
	let qqmapsdk = new QQMapWX({
		key: makey
	})
	return new Promise((resolve, reject) => {
		qqmapsdk.reverseGeocoder({
			location: location,
			get_poi: 1,
			poi_options: 'policy=1;page_size=20;page_index=1',
			success: res => {
				resolve(res)
			},
			fail: err => {
				reject(err)
				uni.showToast({
					title: err.message,
					icon: 'none',
					duration: 3000
				})
			}
		})
	})
}

/**
 * 地图关键词搜索
 * @doc 文档参考：https://lbs.qq.com/qqmap_wx_jssdk/method-search.html
 * @export
 * @param {*} keyword 搜索关键词
 * @param {*} location 坐标：{ latitude: 39.984060, longitude: 116.307520 }
 * @returns
 */
export function mapSearch(keyword, location) {
	let qqmapsdk = new QQMapWX({
		key: makey
	})
	return new Promise((resolve, reject) => {
		qqmapsdk.search({
			keyword: keyword,
			location: location,
			page_size: 20,
			auto_extend: 0,
			success: res => {
				resolve(res)
			},
			fail: err => {
				reject(err)
				uni.showToast({
					title: err.message,
					icon: 'none',
					duration: 3000
				})
			}
		})
	})
}


/**
 * 获取用户当前位置信息
 *
 * @export
 */
export function getLocation() {
	return new Promise((resolve, reject) => {
		const scope = 'scope.userLocation'
		const modal = {
			title: '授权',
			content: '需要您授权使用位置信息',
			confirmText: '设置'
		}
		setAuthorize(scope, modal)
		.then(() => {
			uni.getLocation({
				altitude: true,
				geocode: true,
				success: res => {
					 resolve(res)  
				},
				fail: err => {
					 reject(err)
				}
			})
		})
		.catch(err => {
			reject(err)
		})
	})
}

export function getLocationAndAddress(mapkey) {
	if(!mapkey){
		uni.showToast({
			title: '请设置腾讯地图密钥',
			icon: 'none',
			duration: 1500
		})
	}
	return new Promise((resolve, reject) => {
		getLocation().then(res => {
			//#ifdef APP-PLUS
			resolve(res)
			//如果是APP，直接支持
			resolve(res)  
			// #endif
			//#ifndef APP-PLUS
			const {
				longitude,
				latitude
			} = res
			reverseGeocoder({
				longitude,
				latitude
			},mapkey).then(res => {
				resolve(res)  
			}).catch(err => {
				reject(err)
			})
			// #endif
		}).catch(err => {
			reject(err)
		})
	})
}