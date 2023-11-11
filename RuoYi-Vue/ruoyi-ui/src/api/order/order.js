import request from '@/utils/request'

// 查询order列表
export function listOrder(query) {
  return request({
    url: '/order/order/list',
    method: 'get',
    params: query
  })
}

// 查询order详细
export function getOrder(id) {
  return request({
    url: '/order/order/' + id,
    method: 'get'
  })
}

// 新增order
export function addOrder(data) {
  return request({
    url: '/order/order',
    method: 'post',
    data: data
  })
}

// 修改order
export function updateOrder(data) {
  return request({
    url: '/order/order',
    method: 'put',
    data: data
  })
}

// 删除order
export function delOrder(id) {
  return request({
    url: '/order/order/' + id,
    method: 'delete'
  })
}
