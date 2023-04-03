package com.ruoyi.train.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.train.mapper.TrainHighMapper;
import com.ruoyi.train.domain.TrainHigh;
import com.ruoyi.train.service.ITrainHighService;

/**
 * 高铁车辆管理Service业务层处理
 * 
 * @author YALO
 * @date 2023-03-27
 */
@Service
public class TrainHighServiceImpl implements ITrainHighService 
{
    @Autowired
    private TrainHighMapper trainHighMapper;

    /**
     * 查询高铁车辆管理
     * 
     * @param hightrainId 高铁车辆管理主键
     * @return 高铁车辆管理
     */
    @Override
    public TrainHigh selectTrainHighByHightrainId(Long hightrainId)
    {
        return trainHighMapper.selectTrainHighByHightrainId(hightrainId);
    }

    /**
     * 查询高铁车辆管理列表
     * 
     * @param trainHigh 高铁车辆管理
     * @return 高铁车辆管理
     */
    @Override
    public List<TrainHigh> selectTrainHighList(TrainHigh trainHigh)
    {
        return trainHighMapper.selectTrainHighList(trainHigh);
    }

    /**
     * 新增高铁车辆管理
     * 
     * @param trainHigh 高铁车辆管理
     * @return 结果
     */
    @Override
    public int insertTrainHigh(TrainHigh trainHigh)
    {
        return trainHighMapper.insertTrainHigh(trainHigh);
    }

    /**
     * 修改高铁车辆管理
     * 
     * @param trainHigh 高铁车辆管理
     * @return 结果
     */
    @Override
    public int updateTrainHigh(TrainHigh trainHigh)
    {
        return trainHighMapper.updateTrainHigh(trainHigh);
    }

    /**
     * 批量删除高铁车辆管理
     * 
     * @param hightrainIds 需要删除的高铁车辆管理主键
     * @return 结果
     */
    @Override
    public int deleteTrainHighByHightrainIds(Long[] hightrainIds)
    {
        return trainHighMapper.deleteTrainHighByHightrainIds(hightrainIds);
    }

    /**
     * 删除高铁车辆管理信息
     * 
     * @param hightrainId 高铁车辆管理主键
     * @return 结果
     */
    @Override
    public int deleteTrainHighByHightrainId(Long hightrainId)
    {
        return trainHighMapper.deleteTrainHighByHightrainId(hightrainId);
    }
}
