import request from '@/utils/request'

// 查询cinema列表
export function listCinema(query) {
  return request({
    url: '/cinema/cinema/list',
    method: 'get',
    params: query
  })
}

// 查询cinema详细
export function getCinema(id) {
  return request({
    url: '/cinema/cinema/' + id,
    method: 'get'
  })
}

// 新增cinema
export function addCinema(data) {
  return request({
    url: '/cinema/cinema',
    method: 'post',
    data: data
  })
}

// 修改cinema
export function updateCinema(data) {
  return request({
    url: '/cinema/cinema',
    method: 'put',
    data: data
  })
}

// 删除cinema
export function delCinema(id) {
  return request({
    url: '/cinema/cinema/' + id,
    method: 'delete'
  })
}
