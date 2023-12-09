/******  后端接口基础地址  ******/
export const BASE_API_URL = 'http://10.20.68.187:8000';

/******  各服务基础地址  ******/
export const CINEMA_URL = BASE_API_URL + '/cinema';
export const FILM_URL = BASE_API_URL + '/film';
export const USER_URL = BASE_API_URL + '/user';
export const ORDER_URL = BASE_API_URL + '/order';

/******  影片模块  ******/
// 热映影片
export const HOT_FILM = FILM_URL + '/hot';
// 待映影片
export const EXCEPT_FILM = FILM_URL + '/except';
// 待映推荐
export const RECOMMEND_FILM = FILM_URL + '/recommend';

/******  影院模块  ******/
// 影院列表
export const CINEMA_LIST = CINEMA_URL
/******  订单模块  ******/
export const ORDER_LIST = ORDER_URL