/******  后端接口基础地址  ******/
export const BASE_API_URL = 'http://10.20.68.187:8000';

/******  各服务基础地址  ******/
export const CINEMA_URL = BASE_API_URL + '/cinema';
export const FILM_URL = BASE_API_URL + '/film';
export const USER_URL = BASE_API_URL + '/user';
export const ORDER_URL = BASE_API_URL + '/order';
export const ACTOR_URL = BASE_API_URL + '/actor';
export const COMMENT_URL = BASE_API_URL + '/comment';
export const SHOWTIME_URL = BASE_API_URL + '/showtime';
export const SEAT_URL = BASE_API_URL + '/seat';

/******  影片模块  ******/
// 热映影片
export const HOT_FILM = FILM_URL + '/hot';
// 待映影片
export const EXCEPT_FILM = FILM_URL + '/except';
// 待映推荐
export const RECOMMEND_FILM = FILM_URL + '/recommend';
// 获取演员信息
export const ACTORS = ACTOR_URL;

/******  影院模块  ******/
// 影院列表
export const CINEMA_LIST = CINEMA_URL;
export const MOVIE_LIST = CINEMA_URL + '/films'
export const SHOWtIME_LIST = SHOWTIME_URL;
// 根据场次返回座位
export const SEAT_LIST = SEAT_URL;

/******  订单模块  ******/
export const ORDER_LIST = ORDER_URL;
export const ORDER_PAY = ORDER_URL + '/buy';
export const ORDER_CONSUME = ORDER_URL;

/******  用户模块  ******/
// 注册登录
export const LOGIN_URL = USER_URL + '/login';
// 获取验证码
export const CODE_URL = USER_URL + '/code';
// 影片的评论信息
export const COMMENTS = COMMENT_URL;
// 评论
export const COMMENT = COMMENT_URL;
// 余额查询
export const BALANCE = USER_URL + '/balance';
// 余额充值
export const TOPUP = USER_URL + '/topup';