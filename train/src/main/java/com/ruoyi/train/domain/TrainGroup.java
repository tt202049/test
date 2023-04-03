package com.ruoyi.train.domain;

import java.util.List;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 交路管理对象 train_group
 * 
 * @author YALO
 * @date 2023-03-27
 */
public class TrainGroup extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 交路ID */
    private Long groupId;

    /** 交路是否使用 */
    @Excel(name = "交路是否使用")
    private Long groupAvaliable;


    /** 交路运行车辆 */
    @Excel(name = "交路运行车辆")
    private String usedTrain;

    private  String[] reciveusedTrain;

    /** 交路空闲车辆 */
    @Excel(name = "交路空闲车辆")
    private String freeTrain;

    /** 交路描述 */
    @Excel(name = "交路描述")
    private String groupNote;

    /** $table.subTable.functionName信息 */
    private List<TrainCity> trainCityList;

    public void setGroupId(Long groupId) 
    {
        this.groupId = groupId;
    }

    public Long getGroupId() 
    {
        return groupId;
    }
    public void setGroupAvaliable(Long groupAvaliable) 
    {
        this.groupAvaliable = groupAvaliable;
    }

    public Long getGroupAvaliable() 
    {
        return groupAvaliable;
    }
    public void setUsedTrain(String usedTrain) 
    {
        this.usedTrain = usedTrain;
    }

    public String[] getReciveusedTrain() { return reciveusedTrain;}
    public void setReciveusedTrain(String[] reciveusedTrain) { this.reciveusedTrain = reciveusedTrain;}

    public String getUsedTrain() 
    {
        return usedTrain;
    }
    public void setFreeTrain(String freeTrain) 
    {
        this.freeTrain = freeTrain;
    }

    public String getFreeTrain() 
    {
        return freeTrain;
    }
    public void setGroupNote(String groupNote) 
    {
        this.groupNote = groupNote;
    }

    public String getGroupNote() 
    {
        return groupNote;
    }

    public List<TrainCity> getTrainCityList()
    {
        return trainCityList;
    }

    public void setTrainCityList(List<TrainCity> trainCityList)
    {
        this.trainCityList = trainCityList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("groupId", getGroupId())
            .append("groupAvaliable", getGroupAvaliable())
            .append("usedTrain", getUsedTrain())
            .append("freeTrain", getFreeTrain())
            .append("groupNote", getGroupNote())
            .append("trainCityList", getTrainCityList())
            .toString();
    }
}
