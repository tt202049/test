import request from '@/utils/request'

// 查询调令管理列表
export function listCommondTrain(query) {
  return request({
    url: '/train/commondTrain/list',
    method: 'get',
    params: query
  })
}

// 查询调令管理详细
export function getCommondTrain(commondId) {
  return request({
    url: '/train/commondTrain/' + commondId,
    method: 'get'
  })
}

// 新增调令管理
export function addCommondTrain(data) {
  return request({
    url: '/train/commondTrain',
    method: 'post',
    data: data
  })
}

// 修改调令管理
export function updateCommondTrain(data) {
  return request({
    url: '/train/commondTrain',
    method: 'put',
    data: data
  })
}

// 删除调令管理
export function delCommondTrain(commondId) {
  return request({
    url: '/train/commondTrain/' + commondId,
    method: 'delete'
  })
}

//使用日期查询调令
export function selectCommondByDay(date){
  return request({
    url:'/train/commondTrain/selectCommondByDay',
    method:'post',
    date:date
  })
}
