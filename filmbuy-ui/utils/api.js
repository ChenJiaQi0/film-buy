/******  后端接口基础地址  ******/
export const BASE_API_URL = 'http://localhost:8000';

/******  各服务基础地址  ******/
export const CINEMA_URL = BASE_API_URL + '/cinema';
export const FILM_URL = BASE_API_URL + '/film';
export const USER_URL = BASE_API_URL + '/user';

/******  影片模块  ******/
export const HOT_FILM = FILM_URL + '/hot';
export const EXCEPT_FILM = FILM_URL + '/except'

