import request from '@/utils/request'

// 查询comment列表
export function listComment(query) {
  return request({
    url: '/comment/comment/list',
    method: 'get',
    params: query
  })
}

// 查询comment详细
export function getComment(id) {
  return request({
    url: '/comment/comment/' + id,
    method: 'get'
  })
}

// 新增comment
export function addComment(data) {
  return request({
    url: '/comment/comment',
    method: 'post',
    data: data
  })
}

// 修改comment
export function updateComment(data) {
  return request({
    url: '/comment/comment',
    method: 'put',
    data: data
  })
}

// 删除comment
export function delComment(id) {
  return request({
    url: '/comment/comment/' + id,
    method: 'delete'
  })
}
