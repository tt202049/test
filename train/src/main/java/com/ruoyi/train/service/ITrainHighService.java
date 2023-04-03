package com.ruoyi.train.service;

import java.util.List;
import com.ruoyi.train.domain.TrainHigh;

/**
 * 高铁车辆管理Service接口
 * 
 * @author YALO
 * @date 2023-03-27
 */
public interface ITrainHighService 
{
    /**
     * 查询高铁车辆管理
     * 
     * @param hightrainId 高铁车辆管理主键
     * @return 高铁车辆管理
     */
    public TrainHigh selectTrainHighByHightrainId(Long hightrainId);

    /**
     * 查询高铁车辆管理列表
     * 
     * @param trainHigh 高铁车辆管理
     * @return 高铁车辆管理集合
     */
    public List<TrainHigh> selectTrainHighList(TrainHigh trainHigh);

    /**
     * 新增高铁车辆管理
     * 
     * @param trainHigh 高铁车辆管理
     * @return 结果
     */
    public int insertTrainHigh(TrainHigh trainHigh);

    /**
     * 修改高铁车辆管理
     * 
     * @param trainHigh 高铁车辆管理
     * @return 结果
     */
    public int updateTrainHigh(TrainHigh trainHigh);

    /**
     * 批量删除高铁车辆管理
     * 
     * @param hightrainIds 需要删除的高铁车辆管理主键集合
     * @return 结果
     */
    public int deleteTrainHighByHightrainIds(Long[] hightrainIds);

    /**
     * 删除高铁车辆管理信息
     * 
     * @param hightrainId 高铁车辆管理主键
     * @return 结果
     */
    public int deleteTrainHighByHightrainId(Long hightrainId);
}
