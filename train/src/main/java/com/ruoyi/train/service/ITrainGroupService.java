package com.ruoyi.train.service;

import java.util.List;
import com.ruoyi.train.domain.TrainGroup;

/**
 * 交路管理Service接口
 * 
 * @author YALO
 * @date 2023-03-27
 */
public interface ITrainGroupService 
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
     * 批量删除交路管理
     * 
     * @param groupIds 需要删除的交路管理主键集合
     * @return 结果
     */
    public int deleteTrainGroupByGroupIds(Long[] groupIds);

    /**
     * 删除交路管理信息
     * 
     * @param groupId 交路管理主键
     * @return 结果
     */
    public int deleteTrainGroupByGroupId(Long groupId);
}
