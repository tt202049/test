package com.ruoyi.train.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.train.domain.TrainCity;
import com.ruoyi.train.mapper.TrainGroupMapper;
import com.ruoyi.train.domain.TrainGroup;
import com.ruoyi.train.service.ITrainGroupService;

/**
 * 交路管理Service业务层处理
 * 
 * @author YALO
 * @date 2023-03-27
 */
@Service
public class TrainGroupServiceImpl implements ITrainGroupService 
{
    @Autowired
    private TrainGroupMapper trainGroupMapper;

    /**
     * 查询交路管理
     * 
     * @param groupId 交路管理主键
     * @return 交路管理
     */
    @Override
    public TrainGroup selectTrainGroupByGroupId(Long groupId)
    {
        return trainGroupMapper.selectTrainGroupByGroupId(groupId);
    }

    /**
     * 查询交路管理列表
     * 
     * @param trainGroup 交路管理
     * @return 交路管理
     */
    @Override
    public List<TrainGroup> selectTrainGroupList(TrainGroup trainGroup)
    {
        return trainGroupMapper.selectTrainGroupList(trainGroup);
    }

    /**
     * 新增交路管理
     * 
     * @param trainGroup 交路管理
     * @return 结果
     */
    @Transactional
    @Override
    public int insertTrainGroup(TrainGroup trainGroup)
    {
        int rows = trainGroupMapper.insertTrainGroup(trainGroup);
        insertTrainCity(trainGroup);
        return rows;
    }

    /**
     * 修改交路管理
     * 
     * @param trainGroup 交路管理
     * @return 结果
     */
    @Transactional
    @Override
    public int updateTrainGroup(TrainGroup trainGroup)
    {
        String temp = "";
        for (String s :
                trainGroup.getReciveusedTrain()) {
            temp += (s +" ");
        }
        trainGroup.setUsedTrain(temp);
        return trainGroupMapper.updateTrainGroup(trainGroup);
    }

    /**
     * 批量删除交路管理
     * 
     * @param groupIds 需要删除的交路管理主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteTrainGroupByGroupIds(Long[] groupIds)
    {
        trainGroupMapper.deleteTrainCityByGroupIds(groupIds);
        return trainGroupMapper.deleteTrainGroupByGroupIds(groupIds);
    }

    /**
     * 删除交路管理信息
     * 
     * @param groupId 交路管理主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteTrainGroupByGroupId(Long groupId)
    {
        trainGroupMapper.deleteTrainCityByGroupId(groupId);
        return trainGroupMapper.deleteTrainGroupByGroupId(groupId);
    }

    /**
     * 新增${subTable.functionName}信息
     * 
     * @param trainGroup 交路管理对象
     */
    public void insertTrainCity(TrainGroup trainGroup)
    {
        List<TrainCity> trainCityList = trainGroup.getTrainCityList();
        Long groupId = trainGroup.getGroupId();
        if (StringUtils.isNotNull(trainCityList))
        {
            List<TrainCity> list = new ArrayList<TrainCity>();
            for (TrainCity trainCity : trainCityList)
            {
                trainCity.setGroupId(groupId);
                list.add(trainCity);
            }
            if (list.size() > 0)
            {
                trainGroupMapper.batchTrainCity(list);
            }
        }
    }
}
