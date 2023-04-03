package com.ruoyi.train.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.train.mapper.TrainNormalMapper;
import com.ruoyi.train.domain.TrainNormal;
import com.ruoyi.train.service.ITrainNormalService;

/**
 * 普速调令管理Service业务层处理
 * 
 * @author YALO
 * @date 2023-03-22
 */
@Service
public class TrainNormalServiceImpl implements ITrainNormalService 
{
    @Autowired
    private TrainNormalMapper trainNormalMapper;

    /**
     * 查询普速调令管理
     * 
     * @param trainId 普速调令管理主键
     * @return 普速调令管理
     */
    @Override
    public TrainNormal selectTrainNormalByTrainId(Long trainId)
    {
        return trainNormalMapper.selectTrainNormalByTrainId(trainId);
    }

    /**
     * 查询普速调令管理列表
     * 
     * @param trainNormal 普速调令管理
     * @return 普速调令管理
     */
    @Override
    public List<TrainNormal> selectTrainNormalList(TrainNormal trainNormal)
    {
        return trainNormalMapper.selectTrainNormalList(trainNormal);
    }

    /**
     * 新增普速调令管理
     * 
     * @param trainNormal 普速调令管理
     * @return 结果
     */
    @Override
    public int insertTrainNormal(TrainNormal trainNormal)
    {
        return trainNormalMapper.insertTrainNormal(trainNormal);
    }

    /**
     * 修改普速调令管理
     * 
     * @param trainNormal 普速调令管理
     * @return 结果
     */
    @Override
    public int updateTrainNormal(TrainNormal trainNormal)
    {
        return trainNormalMapper.updateTrainNormal(trainNormal);
    }

    /**
     * 批量删除普速调令管理
     * 
     * @param trainIds 需要删除的普速调令管理主键
     * @return 结果
     */
    @Override
    public int deleteTrainNormalByTrainIds(Long[] trainIds)
    {
        return trainNormalMapper.deleteTrainNormalByTrainIds(trainIds);
    }

    /**
     * 删除普速调令管理信息
     * 
     * @param trainId 普速调令管理主键
     * @return 结果
     */
    @Override
    public int deleteTrainNormalByTrainId(Long trainId)
    {
        return trainNormalMapper.deleteTrainNormalByTrainId(trainId);
    }
}
