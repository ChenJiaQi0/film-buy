import request from '@/utils/request'

// 查询actor列表
export function listActor(query) {
  return request({
    url: '/actor/actor/list',
    method: 'get',
    params: query
  })
}

// 查询actor详细
export function getActor(id) {
  return request({
    url: '/actor/actor/' + id,
    method: 'get'
  })
}

// 新增actor
export function addActor(data) {
  return request({
    url: '/actor/actor',
    method: 'post',
    data: data
  })
}

// 修改actor
export function updateActor(data) {
  return request({
    url: '/actor/actor',
    method: 'put',
    data: data
  })
}

// 删除actor
export function delActor(id) {
  return request({
    url: '/actor/actor/' + id,
    method: 'delete'
  })
}
