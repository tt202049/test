package com.ruoyi.train.mapper;

import java.util.List;
import com.ruoyi.train.domain.TrainNormal;

/**
 * 普速调令管理Mapper接口
 * 
 * @author YALO
 * @date 2023-03-22
 */
public interface TrainNormalMapper 
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
     * 删除普速调令管理
     * 
     * @param trainId 普速调令管理主键
     * @return 结果
     */
    public int deleteTrainNormalByTrainId(Long trainId);

    /**
     * 批量删除普速调令管理
     * 
     * @param trainIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTrainNormalByTrainIds(Long[] trainIds);
}
