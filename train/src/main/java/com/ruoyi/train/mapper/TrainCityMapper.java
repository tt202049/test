package com.ruoyi.train.mapper;

import java.util.List;
import com.ruoyi.train.domain.TrainCity;
import org.apache.ibatis.annotations.Param;

/**
 * 城际列车管理Mapper接口
 * 
 * @author YALO
 * @date 2023-03-27
 */
public interface TrainCityMapper 
{
    /**
     * 查询城际列车管理
     * 
     * @param citytrainId 城际列车管理主键
     * @return 城际列车管理
     */
    public TrainCity selectTrainCityByCitytrainId(Long citytrainId);

    /**
     * 查询城际列车管理列表
     * 
     * @param trainCity 城际列车管理
     * @return 城际列车管理集合
     */
    public List<TrainCity> selectTrainCityList(TrainCity trainCity);

    /**
     * 新增城际列车管理
     * 
     * @param trainCity 城际列车管理
     * @return 结果
     */
    public int insertTrainCity(TrainCity trainCity);

    /**
     * 修改城际列车管理
     * 
     * @param trainCity 城际列车管理
     * @return 结果
     */
    public int updateTrainCity(TrainCity trainCity);

    /**
     * 根据id修改城际列车交路
     * @param trainId,groupId 城际列车管理
     * @return 结果
     */
    public int updateTrainCityGroupById(@Param("trainId") int[] trainId, @Param("groupId") int groupId);

    /**
     * 删除城际列车管理
     * 
     * @param citytrainId 城际列车管理主键
     * @return 结果
     */
    public int deleteTrainCityByCitytrainId(Long citytrainId);

    /**
     * 批量删除城际列车管理
     * 
     * @param citytrainIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTrainCityByCitytrainIds(Long[] citytrainIds);
}
