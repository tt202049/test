package com.ruoyi.train.service.impl;

import java.util.List;

import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.train.mapper.TrainCityMapper;
import com.ruoyi.train.domain.TrainCity;
import com.ruoyi.train.service.ITrainCityService;

/**
 * 城际列车管理Service业务层处理
 * 
 * @author YALO
 * @date 2023-03-27
 */
@Service
public class TrainCityServiceImpl implements ITrainCityService 
{
    @Autowired
    private TrainCityMapper trainCityMapper;

    /**
     * 查询城际列车管理
     * 
     * @param citytrainId 城际列车管理主键
     * @return 城际列车管理
     */
    @Override
    public TrainCity selectTrainCityByCitytrainId(Long citytrainId)
    {
        return trainCityMapper.selectTrainCityByCitytrainId(citytrainId);
    }

    /**
     * 查询城际列车管理列表
     * 
     * @param trainCity 城际列车管理
     * @return 城际列车管理
     */
    @Override
    public List<TrainCity> selectTrainCityList(TrainCity trainCity)
    {
        return trainCityMapper.selectTrainCityList(trainCity);
    }

    /**
     * 新增城际列车管理
     * 
     * @param trainCity 城际列车管理
     * @return 结果
     */
    @Override
    public int insertTrainCity(TrainCity trainCity)
    {
        return trainCityMapper.insertTrainCity(trainCity);
    }

    /**
     * 修改城际列车管理
     * 
     * @param trainCity 城际列车管理
     * @return 结果
     */
    @Override
    public int updateTrainCity(TrainCity trainCity)
    {
        return trainCityMapper.updateTrainCity(trainCity);
    }

    /**
     * 修改城际列车管理
     *
     * @param trainId,groupId 城际列车管理
     * @return 结果
     */
    @Override
    public int updateTrainCityGroupById(int[] trainId, int groupId){ return trainCityMapper.updateTrainCityGroupById(trainId ,groupId);}


    /**
     * 批量删除城际列车管理
     * 
     * @param citytrainIds 需要删除的城际列车管理主键
     * @return 结果
     */
    @Override
    public int deleteTrainCityByCitytrainIds(Long[] citytrainIds)
    {
        return trainCityMapper.deleteTrainCityByCitytrainIds(citytrainIds);
    }

    /**
     * 删除城际列车管理信息
     * 
     * @param citytrainId 城际列车管理主键
     * @return 结果
     */
    @Override
    public int deleteTrainCityByCitytrainId(Long citytrainId)
    {
        return trainCityMapper.deleteTrainCityByCitytrainId(citytrainId);
    }
}
