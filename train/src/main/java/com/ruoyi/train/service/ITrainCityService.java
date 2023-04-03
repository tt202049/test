package com.ruoyi.train.service;

import java.util.List;
import com.ruoyi.train.domain.TrainCity;
import io.lettuce.core.dynamic.annotation.Param;

/**
 * 城际列车管理Service接口
 * 
 * @author YALO
 * @date 2023-03-27
 */
public interface ITrainCityService 
{
    /**
     * 查询城际列车管理
     * 
     * @param citytrainId 城际列车管理主键
     * @return 城际列车管理
     */
    public TrainCity selectTrainCityByCitytrainId(Long citytrainId);

    /**
     * 查询城际列车管理列表
     * 
     * @param trainCity 城际列车管理
     * @return 城际列车管理集合
     */
    public List<TrainCity> selectTrainCityList(TrainCity trainCity);

    /**
     * 新增城际列车管理
     * 
     * @param trainCity 城际列车管理
     * @return 结果
     */
    public int insertTrainCity(TrainCity trainCity);

    /**
     * 修改城际列车管理
     * 
     * @param trainCity 城际列车管理
     * @return 结果
     */
    public int updateTrainCity(TrainCity trainCity);


    /**
     * 根据id修改交路id
     *
     * @param trainId,groupId 列车集合 交路id
     * @return 结果
     */
     public int updateTrainCityGroupById(int[] trainId, int groupId);

    /**
     * 批量删除城际列车管理
     * 
     * @param citytrainIds 需要删除的城际列车管理主键集合
     * @return 结果
     */
    public int deleteTrainCityByCitytrainIds(Long[] citytrainIds);

    /**
     * 删除城际列车管理信息
     * 
     * @param citytrainId 城际列车管理主键
     * @return 结果
     */
    public int deleteTrainCityByCitytrainId(Long citytrainId);
}
