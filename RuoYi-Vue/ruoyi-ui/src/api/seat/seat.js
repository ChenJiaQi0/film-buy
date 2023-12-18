import request from '@/utils/request'

// 为场次生成 8*8 seat
export function generate(id) {
  return request({
    url: '/seat/seat/' + id,
    method: 'post'
  })
}

// 查询seat列表
export function listSeat(query) {
  return request({
    url: '/seat/seat/list',
    method: 'get',
    params: query
  })
}

// 查询seat详细
export function getSeat(id) {
  return request({
    url: '/seat/seat/' + id,
    method: 'get'
  })
}

// 新增seat
export function addSeat(data) {
  return request({
    url: '/seat/seat',
    method: 'post',
    data: data
  })
}

// 修改seat
export function updateSeat(data) {
  return request({
    url: '/seat/seat',
    method: 'put',
    data: data
  })
}

// 删除seat
export function delSeat(id) {
  return request({
    url: '/seat/seat/' + id,
    method: 'delete'
  })
}
