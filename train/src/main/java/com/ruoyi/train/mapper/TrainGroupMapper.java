package com.ruoyi.train.mapper;

import java.util.List;
import com.ruoyi.train.domain.TrainGroup;
import com.ruoyi.train.domain.TrainCity;

/**
 * 交路管理Mapper接口
 * 
 * @author YALO
 * @date 2023-03-27
 */
public interface TrainGroupMapper 
{
    /**
     * 查询交路管理
     * 
     * @param groupId 交路管理主键
     * @return 交路管理
     */
    public TrainGroup selectTrainGroupByGroupId(Long groupId);

    /**
     * 查询交路管理列表
     * 
     * @param trainGroup 交路管理
     * @return 交路管理集合
     */
    public List<TrainGroup> selectTrainGroupList(TrainGroup trainGroup);

    /**
     * 新增交路管理
     * 
     * @param trainGroup 交路管理
     * @return 结果
     */
    public int insertTrainGroup(TrainGroup trainGroup);

    /**
     * 修改交路管理
     * 
     * @param trainGroup 交路管理
     * @return 结果
     */
    public int updateTrainGroup(TrainGroup trainGroup);

    /**
     * 删除交路管理
     * 
     * @param groupId 交路管理主键
     * @return 结果
     */
    public int deleteTrainGroupByGroupId(Long groupId);

    /**
     * 批量删除交路管理
     * 
     * @param groupIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTrainGroupByGroupIds(Long[] groupIds);

    /**
     * 批量删除${subTable.functionName}
     * 
     * @param groupIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTrainCityByGroupIds(Long[] groupIds);
    
    /**
     * 批量新增${subTable.functionName}
     * 
     * @param trainCityList ${subTable.functionName}列表
     * @return 结果
     */
    public int batchTrainCity(List<TrainCity> trainCityList);
    

    /**
     * 通过交路管理主键删除${subTable.functionName}信息
     * 
     * @param groupId 交路管理ID
     * @return 结果
     */
    public int deleteTrainCityByGroupId(Long groupId);
}
