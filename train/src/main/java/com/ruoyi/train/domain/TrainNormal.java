package com.ruoyi.train.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.utils.serializer.DateJsonDeserializer;
import com.ruoyi.common.utils.serializer.DateJsonSerializer;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

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

    /** 现行编组数量 */
    @Excel(name = "现行编组数量")
    private Long presentNum;

    /** 站台号 */
    @Excel(name = "站台号")
    private Long platformNo;

    /** 检票口号 */
    @Excel(name = "检票口号")
    private String deportNo;

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

    /** 最大车号方向 */
    @Excel(name = "最大车号方向")
    private String maxDirction;

    /** 偏移天数 */
    @Excel(name = "偏移天数")
    private Long shiftTime;

    /** 补充说明 */
    @Excel(name = "补充说明")
    private String note;

    /** 是否按周停车 */
    @Excel(name = "是否按周停车")
    private Boolean isWeekstop;

    /** 停车星期 */
    @Excel(name = "停车星期")
    private String stopWeek;

    /** 停车日期 */
    @Excel(name = "停车日期")
    private String stopDay;

    /** 调令生效日期 */
    @JsonDeserialize(using = DateJsonDeserializer.class)
    @JsonSerialize(using = DateJsonSerializer.class)
    @JsonFormat(pattern = "HH-mm")
    @Excel(name = "调令生效日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date orderStartday;

    /** 调令结束日期 */
    @JsonDeserialize(using = DateJsonDeserializer.class)
    @JsonSerialize(using = DateJsonSerializer.class)
    @JsonFormat(pattern = "HH-mm")
    @Excel(name = "调令结束日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date orderEndday;

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

    public void setPresentNum(Long presentNum)
    {
        this.presentNum = presentNum;
    }
    public Long getPresentNum()
    {
        return presentNum;
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

    public void setMaxDirction(String maxDirction) 
    {
        this.maxDirction = maxDirction;
    }
    public String getMaxDirction() 
    {
        return maxDirction;
    }

    public void setShiftTime(Long shiftTime)
    {
        this.shiftTime = shiftTime;
    }
    public Long getShiftTime()
    {
        return shiftTime;
    }

    public void setNote(String note)
    {
        this.note = note;
    }
    public String getNote()
    {
        return note;
    }

    public void setIsWeekstop(Boolean isDepature) {this.isWeekstop = isWeekstop; }
    public Boolean getIsWeekstop() {return isWeekstop; }

    public void setStopWeek(String stopWeek)
    {
        this.stopWeek = stopWeek;
    }
    public String getStopWeek()
    {
        return stopWeek;
    }

    public void setStopDay(String stopDay)
    {
        this.stopDay = stopDay;
    }
    public String getStopDay()
    {
        return stopDay;
    }

    public void setOrderStartday(Date orderStartday)
    {
        this.orderStartday = orderStartday;
    }
    public Date getOrderStartday()
    {
        return orderStartday;
    }

    public void setOrderEndday(Date orderEndday)
    {
        this.orderEndday = orderEndday;
    }
    public Date getOrderEndday()
    {
        return orderEndday;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("trainId", getTrainId())
            .append("trainName", getTrainName())
            .append("depatureStation", getDepatureStation())
            .append("terminalStation", getTerminalStation())
            .append("isAvaliable", getIsAvaliable())
            .append("trainsetNum", getTrainsetNum())
            .append("presentNum", getPresentNum())
            .append("platformNo", getPlatformNo())
            .append("deportNo", getDeportNo())
            .append("maxDirction", getMaxDirction())
            .append("arriveTime", getArriveTime())
            .append("leaveTime", getLeaveTime())
            .append("shiftTime", getShiftTime())
            .append("note", getNote())
            .append("isWeekstop", getIsWeekstop())
            .append("stopWeek", getStopWeek())
            .append("stopDay", getStopDay())
            .append("orderStartday", getOrderStartday())
            .append("orderEndday", getOrderEndday())
            .toString();
    }
}
