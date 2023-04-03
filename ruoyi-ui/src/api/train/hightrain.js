import request from '@/utils/request'

// 查询高铁车辆管理列表
export function listHightrain(query) {
  return request({
    url: '/train/hightrain/list',
    method: 'get',
    params: query
  })
}

// 查询高铁车辆管理详细
export function getHightrain(hightrainId) {
  return request({
    url: '/train/hightrain/' + hightrainId,
    method: 'get'
  })
}

// 新增高铁车辆管理
export function addHightrain(data) {
  return request({
    url: '/train/hightrain',
    method: 'post',
    data: data
  })
}

// 修改高铁车辆管理
export function updateHightrain(data) {
  return request({
    url: '/train/hightrain',
    method: 'put',
    data: data
  })
}

// 删除高铁车辆管理
export function delHightrain(hightrainId) {
  return request({
    url: '/train/hightrain/' + hightrainId,
    method: 'delete'
  })
}
