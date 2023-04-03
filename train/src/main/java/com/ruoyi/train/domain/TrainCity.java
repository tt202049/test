package com.ruoyi.train.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.ruoyi.common.utils.serializer.DateJsonDeserializer;
import com.ruoyi.common.utils.serializer.DateJsonSerializer;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 城际列车管理对象 train_city
 * 
 * @author YALO
 * @date 2023-03-27
 */
public class TrainCity extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 城际列车ID */
    private Long citytrainId;

    /** 交路ID */
    @Excel(name = "交路ID")
    private Long groupId;

    /** 城际列车号 */
    @Excel(name = "城际列车号")
    private String citytrainName;

    /** 始发站 */
    @Excel(name = "始发站")
    private String depatureStation;

    /** 终到站 */
    @Excel(name = "终到站")
    private String terminalStation;

    /** 是否开行 */
    @Excel(name = "是否开行")
    private Boolean isAvaliable;

    /** 编组数量 */
    @Excel(name = "编组数量")
    private Long trainsetNum;

    /** 到站时间 */
    @JsonDeserialize(using = DateJsonDeserializer.class)
    @JsonSerialize(using = DateJsonSerializer.class)
    @JsonFormat(pattern = "HH-mm")
    @Excel(name = "到站时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date arriveTime;

    /** 开车时间 */
    @JsonDeserialize(using = DateJsonDeserializer.class)
    @JsonSerialize(using = DateJsonSerializer.class)
    @JsonFormat(pattern = "HH-mm")
    @Excel(name = "开车时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date leaveTime;

    /** 站台号 */
    @Excel(name = "站台号")
    private Long platformNo;

    /** 检票口 */
    @Excel(name = "检票口")
    private String deportNo;

    /** 备注 */
    @Excel(name = "备注")
    private String citytrainNote;

    public void setCitytrainId(Long citytrainId) 
    {
        this.citytrainId = citytrainId;
    }

    public Long getCitytrainId() 
    {
        return citytrainId;
    }
    public void setGroupId(Long groupId) 
    {
        this.groupId = groupId;
    }

    public Long getGroupId() 
    {
        return groupId;
    }
    public void setCitytrainName(String citytrainName) 
    {
        this.citytrainName = citytrainName;
    }

    public String getCitytrainName() 
    {
        return citytrainName;
    }
    public void setDepatureStation(String depatureStation) 
    {
        this.depatureStation = depatureStation;
    }

    public String getDepatureStation() 
    {
        return depatureStation;
    }
    public void setTerminalStation(String terminalStation) 
    {
        this.terminalStation = terminalStation;
    }

    public String getTerminalStation() 
    {
        return terminalStation;
    }
    public void setIsAvaliable(Boolean isAvaliable)
    {
        this.isAvaliable = isAvaliable;
    }

    public Boolean getIsAvaliable()
    {
        return isAvaliable;
    }
    public void setTrainsetNum(Long trainsetNum) 
    {
        this.trainsetNum = trainsetNum;
    }

    public Long getTrainsetNum() 
    {
        return trainsetNum;
    }
    public void setArriveTime(Date arriveTime) 
    {
        this.arriveTime = arriveTime;
    }

    public Date getArriveTime() 
    {
        return arriveTime;
    }
    public void setLeaveTime(Date leaveTime) 
    {
        this.leaveTime = leaveTime;
    }

    public Date getLeaveTime() 
    {
        return leaveTime;
    }
    public void setPlatformNo(Long platformNo) 
    {
        this.platformNo = platformNo;
    }

    public Long getPlatformNo() 
    {
        return platformNo;
    }
    public void setDeportNo(String deportNo) 
    {
        this.deportNo = deportNo;
    }

    public String getDeportNo() 
    {
        return deportNo;
    }
    public void setCitytrainNote(String citytrainNote) 
    {
        this.citytrainNote = citytrainNote;
    }

    public String getCitytrainNote() 
    {
        return citytrainNote;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("citytrainId", getCitytrainId())
            .append("groupId", getGroupId())
            .append("citytrainName", getCitytrainName())
            .append("depatureStation", getDepatureStation())
            .append("terminalStation", getTerminalStation())
            .append("isAvaliable", getIsAvaliable())
            .append("trainsetNum", getTrainsetNum())
            .append("arriveTime", getArriveTime())
            .append("leaveTime", getLeaveTime())
            .append("platformNo", getPlatformNo())
            .append("deportNo", getDeportNo())
            .append("citytrainNote", getCitytrainNote())
            .toString();
    }
}
