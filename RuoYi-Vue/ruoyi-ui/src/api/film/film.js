import request from '@/utils/request'

// 查询film列表
export function listFilm(query) {
  return request({
    url: '/film/film/list',
    method: 'get',
    params: query
  })
}

// 查询film详细
export function getFilm(id) {
  return request({
    url: '/film/film/' + id,
    method: 'get'
  })
}

// 新增film
export function addFilm(data) {
  return request({
    url: '/film/film',
    method: 'post',
    data: data
  })
}

// 修改film
export function updateFilm(data) {
  return request({
    url: '/film/film',
    method: 'put',
    data: data
  })
}

// 删除film
export function delFilm(id) {
  return request({
    url: '/film/film/' + id,
    method: 'delete'
  })
}
