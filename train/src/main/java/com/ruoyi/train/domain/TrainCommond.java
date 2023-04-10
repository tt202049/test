package com.ruoyi.train.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 调令管理对象 train_commond
 * 
 * @author YALO
 * @date 2023-03-31
 */
public class TrainCommond extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 调令id */
    @Excel(name = "调令id")
    private Long commondId;

    /** 调令名称 */
    @Excel(name = "调令名称")
    private String commondName;

    /** 调令影响交路 */
    @Excel(name = "调令影响交路")
    private Long groupId;

    @Excel(name = "调令输入人")
    private String commondUser;

    @Excel(name = "调令种类")
    private int commondType;

    @Excel(name = "调令输入人")
    private int shiftDay;

    /** 调令开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "调令开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startTime;

    /** 调令结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "调令结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endTime;

    @Excel(name = "调令停开星期")
    private String stopWeek;

    @Excel(name = "调令停开天数")
    private String stopDays;

    /** 调令影响高铁id */
    @Excel(name = "调令影响高铁id")
    private Long citytrainId;

    /** 调令影响普速 */
    @Excel(name = "调令影响普速")
    private Long normaltrainId;

    /** 调令影响高铁车次 */
    @Excel(name = "调令影响高铁车次")
    private String citytrainName;

    /** 调令影响普速车次 */
    @Excel(name = "调令影响普速车次")
    private String normaltrainName;

    /** 调令具体内容 */
    @Excel(name = "调令具体内容")
    private String commondContent;

    public void setCommondId(Long commondId) 
    {
        this.commondId = commondId;
    }

    public Long getCommondId() 
    {
        return commondId;
    }
    public void setCommondName(String commondName) 
    {
        this.commondName = commondName;
    }

    public String getCommondUser()
    {
        return commondUser;
    }
    public void setCommondUser(String commondUser)
    {
        this.commondUser = commondUser;
    }

    public String getCommondName() 
    {
        return commondName;
    }
    public void setGroupId(Long groupId) 
    {
        this.groupId = groupId;
    }

    public int getCommondType() { return commondType; }
    public void setCommondType(int commondType){ this.commondType = commondType; }

    public String getStopWeek() {   return stopWeek;}
    public void setStopWeek(String stopWeek)
    {
        this.stopWeek = stopWeek;
    }

    public String getStopDays() {   return stopDays;}
    public void setStopDays(String stopDays)
    {
        this.stopDays = stopDays;
    }

    public int getShiftDay() {  return shiftDay;}
    public void setShiftDay(int shiftDay){ this.shiftDay = shiftDay; }

    public Long getGroupId() 
    {
        return groupId;
    }
    public void setStartTime(Date startTime) 
    {
        this.startTime = startTime;
    }

    public Date getStartTime() 
    {
        return startTime;
    }
    public void setEndTime(Date endTime) 
    {
        this.endTime = endTime;
    }

    public Date getEndTime() 
    {
        return endTime;
    }
    public void setCitytrainId(Long citytrainId) 
    {
        this.citytrainId = citytrainId;
    }

    public Long getCitytrainId() 
    {
        return citytrainId;
    }
    public void setNormaltrainId(Long normaltrainId) 
    {
        this.normaltrainId = normaltrainId;
    }

    public Long getNormaltrainId() 
    {
        return normaltrainId;
    }
    public void setCitytrainName(String citytrainName) 
    {
        this.citytrainName = citytrainName;
    }

    public String getCitytrainName() 
    {
        return citytrainName;
    }
    public void setNormaltrainName(String normaltrainName) 
    {
        this.normaltrainName = normaltrainName;
    }

    public String getNormaltrainName() 
    {
        return normaltrainName;
    }
    public void setCommondContent(String commondContent) 
    {
        this.commondContent = commondContent;
    }

    public String getCommondContent() 
    {
        return commondContent;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("commondId", getCommondId())
            .append("commondName", getCommondName())
            .append("commondUser", getCommondUser())
            .append("stopWeek",getStopWeek())
            .append("stopDays", getStopDays())
            .append("shiftDay", getShiftDay())
            .append("groupId", getGroupId())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("citytrainId", getCitytrainId())
            .append("normaltrainId", getNormaltrainId())
            .append("citytrainName", getCitytrainName())
            .append("normaltrainName", getNormaltrainName())
            .append("commondContent", getCommondContent())
            .toString();
    }
}
