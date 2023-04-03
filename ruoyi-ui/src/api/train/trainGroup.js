import request from '@/utils/request'

// 查询交路管理列表
export function listTrainGroup(query) {
  return request({
    url: '/train/trainGroup/list',
    method: 'get',
    params: query
  })
}

// 查询交路管理详细
export function getTrainGroup(groupId) {
  return request({
    url: '/train/trainGroup/' + groupId,
    method: 'get'
  })
}

// 新增交路管理
export function addTrainGroup(data) {
  return request({
    url: '/train/trainGroup',
    method: 'post',
    data: data
  })
}

// 修改交路管理
export function updateTrainGroup(data) {
  return request({
    url: '/train/trainGroup',
    method: 'put',
    data: data
  })
}

// 删除交路管理
export function delTrainGroup(groupId) {
  return request({
    url: '/train/trainGroup/' + groupId,
    method: 'delete'
  })
}
