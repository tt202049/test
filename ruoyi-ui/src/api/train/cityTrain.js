import request from '@/utils/request'
import da from "element-ui/src/locale/lang/da";

// 查询城际列车管理列表
export function listCityTrain(query) {
  return request({
    url: '/train/cityTrain/list',
    method: 'get',
    params: query
  })
}

// 查询城际列车管理详细
export function getCityTrain(citytrainId) {
  return request({
    url: '/train/cityTrain/' + citytrainId,
    method: 'get'
  })
}

// 新增城际列车管理
export function addCityTrain(data) {
  return request({
    url: '/train/cityTrain',
    method: 'post',
    data: data
  })
}

// 修改城际列车管理
export function updateCityTrain(data) {
  return request({
    url: '/train/cityTrain',
    method: 'put',
    data: data
  })
}

// 根据Id修改列车交路
export function updateCityTrainGroupById(data){
  return request({
    url:'/train/cityTrain/editWithId',
    method: 'post',
    data: data
  })
}

//删除城际列车管理
export function delCityTrain(citytrainId) {
  return request({
    url: '/train/cityTrain/' + citytrainId,
    method: 'delete',
  })
}


