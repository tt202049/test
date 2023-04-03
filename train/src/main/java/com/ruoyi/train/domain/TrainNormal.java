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
 * 普速调令管理对象 train_normal
 * 
 * @author YALO
 * @date 2023-03-22
 */
public class TrainNormal extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 普速车ID */
    private Long trainId;

    /** 普速车车号 */
    @Excel(name = "普速车车号")
    private String trainName;

    /** 始发站 */
    @Excel(name = "始发站")
    private String depatureStation;

    /** 是否始发 */
    @Excel(name = "是否始发")
    private Boolean isDepature;

    /** 终到站 */
    @Excel(name = "终到站")
    private String terminalStation;

    /** 是否开行 */
    @Excel(name = "是否开行")
    private Boolean isAvaliable;

    /** 图定编组数量 */
    @Excel(name = "图定编组数量")
    private Long trainsetNum;

    /** 现编组数量 */
    @Excel(name = "现编组数量")
    private Long presetNum;

    /** 站台号 */
    @Excel(name = "站台号")
    private Long platformNo;

    /** 检票口号 */
    @Excel(name = "检票口号")
    private String deportNo;

    /** 最大车号方向 */
    @Excel(name = "最大车号方向")
    private String maxDirction;

    /** 到站时间 */
    @JsonDeserialize(using = DateJsonDeserializer.class)
    @JsonSerialize(using = DateJsonSerializer.class)
    @JsonFormat(pattern = "HH-mm")
    @Excel(name = "到站时间", width = 30, dateFormat = "HH-mm")
    private Date arriveTime;

    /** 开车时间 */
    @JsonDeserialize(using = DateJsonDeserializer.class)
    @JsonSerialize(using = DateJsonSerializer.class)
    @JsonFormat(pattern = "HH-mm")
    @Excel(name = "开车时间", width = 30, dateFormat = "HH-mm")
    private Date leaveTime;

    /** 停车时间 */
    @JsonFormat(pattern = "HH-mm")
    @Excel(name = "停车时间", width = 30, dateFormat = "HH-mm")
    private String stayTime;

    /** 是否上水 */
    @Excel(name = "是否上水")
    private Boolean isWaterup;

    /** 折返ID */
    @Excel(name = "折返ID")
    private Long coupeId;

    /** 折返车号 */
    @Excel(name = "折返车号")
    private String coupeName;

    /** 折返时间 */
    @JsonDeserialize(using = DateJsonDeserializer.class)
    @JsonSerialize(using = DateJsonSerializer.class)
    @JsonFormat(pattern = "HH-mm")
    @Excel(name = "折返时间", width = 30, dateFormat = "HH-mm")
    private Date coupeDay;

    /** 补充说明 */
    @Excel(name = "补充说明")
    private String note;

    public void setTrainId(Long trainId) 
    {
        this.trainId = trainId;
    }

    public Long getTrainId() 
    {
        return trainId;
    }
    public void setTrainName(String trainName) 
    {
        this.trainName = trainName;
    }

    public String getTrainName() 
    {
        return trainName;
    }
    public void setDepatureStation(String depatureStation) 
    {
        this.depatureStation = depatureStation;
    }

    public String getDepatureStation() 
    {
        return depatureStation;
    }
    public void setIsDepature(Boolean isDepature) 
    {
        this.isDepature = isDepature;
    }

    public Boolean getIsDepature() 
    {
        return isDepature;
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
    public void setPresetNum(Long presetNum) 
    {
        this.presetNum = presetNum;
    }

    public Long getPresetNum() 
    {
        return presetNum;
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
    public void setMaxDirction(String maxDirction) 
    {
        this.maxDirction = maxDirction;
    }

    public String getMaxDirction() 
    {
        return maxDirction;
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
    public void setStayTime(String stayTime)
    {
        this.stayTime = stayTime;
    }

    public String getStayTime()
    {
        return stayTime;
    }
    public void setIsWaterup(Boolean isWaterup) 
    {
        this.isWaterup = isWaterup;
    }

    public Boolean getIsWaterup() 
    {
        return isWaterup;
    }
    public void setCoupeId(Long coupeId) 
    {
        this.coupeId = coupeId;
    }

    public Long getCoupeId() 
    {
        return coupeId;
    }
    public void setCoupeName(String coupeName) 
    {
        this.coupeName = coupeName;
    }

    public String getCoupeName() 
    {
        return coupeName;
    }
    public void setCoupeDay(Date coupeDay) 
    {
        this.coupeDay = coupeDay;
    }

    public Date getCoupeDay() 
    {
        return coupeDay;
    }
    public void setNote(String note) 
    {
        this.note = note;
    }

    public String getNote() 
    {
        return note;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("trainId", getTrainId())
            .append("trainName", getTrainName())
            .append("depatureStation", getDepatureStation())
            .append("isDepature", getIsDepature())
            .append("terminalStation", getTerminalStation())
            .append("isAvaliable", getIsAvaliable())
            .append("trainsetNum", getTrainsetNum())
            .append("presetNum", getPresetNum())
            .append("platformNo", getPlatformNo())
            .append("deportNo", getDeportNo())
            .append("maxDirction", getMaxDirction())
            .append("arriveTime", getArriveTime())
            .append("leaveTime", getLeaveTime())
            .append("stayTime", getStayTime())
            .append("isWaterup", getIsWaterup())
            .append("coupeId", getCoupeId())
            .append("coupeName", getCoupeName())
            .append("coupeDay", getCoupeDay())
            .append("note", getNote())
            .toString();
    }
}
