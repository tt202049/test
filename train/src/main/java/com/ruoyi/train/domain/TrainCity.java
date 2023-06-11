package com.ruoyi.train.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 城际列车管理对象 train_city
 * 
 * @author WANGMIN
 * @date 2023-06-11
 */
public class TrainCity extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 城际列车ID */
    private Long trainId;

    /** 城际列车号 */
    @Excel(name = "城际列车号")
    private String trainName;

    /** 交路ID */
    @Excel(name = "交路ID")
    private Long groupId;

    /** 始发站 */
    @Excel(name = "始发站")
    private String depatureStation;

    /** 终到站 */
    @Excel(name = "终到站")
    private String terminalStation;

    /** 是否开行 */
    @Excel(name = "是否开行")
    private Long isAvaliable;

    /** 编组数量 */
    @Excel(name = "编组数量")
    private Long trainsetNum;

    /** 图定编组数量 */
    @Excel(name = "图定编组数量")
    private Long presentNum;

    /** 站台号 */
    @Excel(name = "站台号")
    private Long platformNo;

    /** 检票口 */
    @Excel(name = "检票口")
    private String deportNo;

    /** 到站时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "到站时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date arriveTime;

    /** 开车时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开车时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date leaveTime;

    /** 最大车号方向 */
    @Excel(name = "最大车号方向")
    private String maxDirction;

    /** 偏移天数 */
    @Excel(name = "偏移天数")
    private Long shiftTime;

    /** 备注 */
    @Excel(name = "备注")
    private String note;

    /** 是否按周停车 */
    @Excel(name = "是否按周停车")
    private Long isWeekstop;

    /** 停车星期 */
    @Excel(name = "停车星期")
    private String stopWeek;

    /** 停开日期 */
    @Excel(name = "停开日期")
    private String stopDay;

    /** 调令生效日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "调令生效日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date orderStartday;

    /** 调令结束日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
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
    public void setGroupId(Long groupId) 
    {
        this.groupId = groupId;
    }

    public Long getGroupId() 
    {
        return groupId;
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
    public void setIsAvaliable(Long isAvaliable) 
    {
        this.isAvaliable = isAvaliable;
    }

    public Long getIsAvaliable() 
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
    public void setIsWeekstop(Long isWeekstop) 
    {
        this.isWeekstop = isWeekstop;
    }

    public Long getIsWeekstop() 
    {
        return isWeekstop;
    }
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
            .append("groupId", getGroupId())
            .append("depatureStation", getDepatureStation())
            .append("terminalStation", getTerminalStation())
            .append("isAvaliable", getIsAvaliable())
            .append("trainsetNum", getTrainsetNum())
            .append("presentNum", getPresentNum())
            .append("platformNo", getPlatformNo())
            .append("deportNo", getDeportNo())
            .append("arriveTime", getArriveTime())
            .append("leaveTime", getLeaveTime())
            .append("maxDirction", getMaxDirction())
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
