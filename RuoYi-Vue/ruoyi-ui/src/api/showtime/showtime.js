import request from '@/utils/request'

// 查询showtime列表
export function listShowtime(query) {
  return request({
    url: '/showtime/showtime/list',
    method: 'get',
    params: query
  })
}

// 查询showtime详细
export function getShowtime(id) {
  return request({
    url: '/showtime/showtime/' + id,
    method: 'get'
  })
}

// 新增showtime
export function addShowtime(data) {
  return request({
    url: '/showtime/showtime',
    method: 'post',
    data: data
  })
}

// 修改showtime
export function updateShowtime(data) {
  return request({
    url: '/showtime/showtime',
    method: 'put',
    data: data
  })
}

// 删除showtime
export function delShowtime(id) {
  return request({
    url: '/showtime/showtime/' + id,
    method: 'delete'
  })
}
