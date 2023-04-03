package com.ruoyi.train.mapper;

import java.util.List;
import com.ruoyi.train.domain.TrainCommond;

/**
 * 调令管理Mapper接口
 * 
 * @author YALO
 * @date 2023-03-31
 */
public interface TrainCommondMapper 
{
    /**
     * 查询调令管理
     * 
     * @param commondId 调令管理主键
     * @return 调令管理
     */
    public TrainCommond selectTrainCommondByCommondId(Long commondId);

    /**
     * 查询调令管理列表
     * 
     * @param trainCommond 调令管理
     * @return 调令管理集合
     */
    public List<TrainCommond> selectTrainCommondList(TrainCommond trainCommond);

    /**
     * 新增调令管理
     * 
     * @param trainCommond 调令管理
     * @return 结果
     */
    public int insertTrainCommond(TrainCommond trainCommond);

    /**
     * 修改调令管理
     * 
     * @param trainCommond 调令管理
     * @return 结果
     */
    public int updateTrainCommond(TrainCommond trainCommond);

    /**
     * 删除调令管理
     * 
     * @param commondId 调令管理主键
     * @return 结果
     */
    public int deleteTrainCommondByCommondId(Long commondId);

    /**
     * 批量删除调令管理
     * 
     * @param commondIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTrainCommondByCommondIds(Long[] commondIds);
}
