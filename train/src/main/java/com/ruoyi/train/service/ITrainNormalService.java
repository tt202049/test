package com.ruoyi.train.service;

import java.util.List;
import com.ruoyi.train.domain.TrainNormal;

/**
 * 普速调令管理Service接口
 * 
 * @author YALO
 * @date 2023-03-22
 */
public interface ITrainNormalService 
{
    /**
     * 查询普速调令管理
     * 
     * @param trainId 普速调令管理主键
     * @return 普速调令管理
     */
    public TrainNormal selectTrainNormalByTrainId(Long trainId);

    /**
     * 查询普速调令管理列表
     * 
     * @param trainNormal 普速调令管理
     * @return 普速调令管理集合
     */
    public List<TrainNormal> selectTrainNormalList(TrainNormal trainNormal);

    /**
     * 新增普速调令管理
     * 
     * @param trainNormal 普速调令管理
     * @return 结果
     */
    public int insertTrainNormal(TrainNormal trainNormal);

    /**
     * 修改普速调令管理
     * 
     * @param trainNormal 普速调令管理
     * @return 结果
     */
    public int updateTrainNormal(TrainNormal trainNormal);

    /**
     * 批量删除普速调令管理
     * 
     * @param trainIds 需要删除的普速调令管理主键集合
     * @return 结果
     */
    public int deleteTrainNormalByTrainIds(Long[] trainIds);

    /**
     * 删除普速调令管理信息
     * 
     * @param trainId 普速调令管理主键
     * @return 结果
     */
    public int deleteTrainNormalByTrainId(Long trainId);
}
