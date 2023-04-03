import request from '@/utils/request'

// 查询普速调令管理列表
export function listNormalTrain(query) {
  return request({
    url: '/train/normalTrain/list',
    method: 'get',
    params: query
  })
}

// 查询普速调令管理详细
export function getNormalTrain(trainId) {
  return request({
    url: '/train/normalTrain/' + trainId,
    method: 'get'
  })
}

// 新增普速调令管理
export function addNormalTrain(data) {
  return request({
    url: '/train/normalTrain',
    method: 'post',
    data: data
  })
}

// 修改普速调令管理
export function updateNormalTrain(data) {
  return request({
    url: '/train/normalTrain',
    method: 'put',
    data: data
  })
}

// 删除普速调令管理
export function delNormalTrain(trainId) {
  return request({
    url: '/train/normalTrain/' + trainId,
    method: 'delete'
  })
}
