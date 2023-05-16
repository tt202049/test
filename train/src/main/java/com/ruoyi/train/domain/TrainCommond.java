package com.ruoyi.train.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.ruoyi.common.utils.serializer.ArrayToStringDeserializer;
import com.ruoyi.common.utils.serializer.ArrayToStringSerializer;
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

    /** 调令开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "调令开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startTime;

    /** 调令结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "调令结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endTime;

    @Excel(name = "调令种类")
    private int commondType;

    @Excel(name = "影响车次种类")
    private int trainType;

    /** 调令影响车次/调令Id */
//    @JsonDeserialize(using = ArrayToStringDeserializer.class)
//    @JsonSerialize(using = ArrayToStringSerializer.class)
    @Excel(name = "调令影响车次/调令Id")
    private String commondAffectTrainId;

    /** 调令影响车次/调令名称 */
//    @JsonDeserialize(using = ArrayToStringDeserializer.class)
//    @JsonSerialize(using = ArrayToStringSerializer.class)
    @Excel(name = "调令影响车次/调令名称")
    private String commondAffectTrainName;

    /** 调令具体内容 */
    @Excel(name = "调令具体内容")
    private String commondContent;

    @Excel(name = "调令输入人")
    private String commondUser;

    @Excel(name = "调令是否按星期停开")
    private int isWeekStop;

    @Excel(name = "调令停开星期")
    private String stopWeek;

    @Excel(name = "调令停开天数")
    private String stopDays;

    @Excel(name = "调令输入人")
    private int shiftDay;

    /** 调令影响车次开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "调令结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date trainStartDay;

    /** 调令影响车次开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "调令结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date trainStopDay;

    public Long getCommondId() {
        return commondId;
    }

    public void setCommondId(Long commondId) {
        this.commondId = commondId;
    }

    public String getCommondName() {
        return commondName;
    }

    public void setCommondName(String commondName) {
        this.commondName = commondName;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public int getCommondType() {
        return commondType;
    }

    public void setCommondType(int commondType) {
        this.commondType = commondType;
    }

    public int getTrainType() {
        return trainType;
    }

    public void setTrainType(int trainType) {
        this.trainType = trainType;
    }

    public String getCommondAffectTrainId() {
        return commondAffectTrainId;
    }

    public void setCommondAffectTrainId(String commondAffectTrainId) {
        this.commondAffectTrainId = commondAffectTrainId;
    }

    public String getCommondAffectTrainName() {
        return commondAffectTrainName;
    }

    public void setCommondAffectTrainName(String commondAffectTrainName) {
        this.commondAffectTrainName = commondAffectTrainName;
    }

    public String getCommondContent() {
        return commondContent;
    }

    public void setCommondContent(String commondContent) {
        this.commondContent = commondContent;
    }

    public String getCommondUser() {
        return commondUser;
    }

    public void setCommondUser(String commondUser) {
        this.commondUser = commondUser;
    }

    public int getIsWeekStop() {
        return isWeekStop;
    }

    public void setIsWeekStop(int isWeekStop) {
        this.isWeekStop = isWeekStop;
    }

    public String getStopWeek() {
        return stopWeek;
    }

    public void setStopWeek(String stopWeek) {
        this.stopWeek = stopWeek;
    }

    public String getStopDays() {
        return stopDays;
    }

    public void setStopDays(String stopDays) {
        this.stopDays = stopDays;
    }

    public int getShiftDay() {
        return shiftDay;
    }

    public void setShiftDay(int shiftDay) {
        this.shiftDay = shiftDay;
    }

    public Date getTrainStartDay() {
        return trainStartDay;
    }

    public void setTrainStartDay(Date trainStartDay) {
        this.trainStartDay = trainStartDay;
    }

    public Date getTrainStopDay() {
        return trainStopDay;
    }

    public void setTrainStopDay(Date trainStopDay) {
        this.trainStopDay = trainStopDay;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("commondId", getCommondId())
                .append("commondName", getCommondName())
                .append("stratTime",getStartTime())
                .append("endTime", getEndTime())
                .append("commondType", getCommondType())
                .append("trainType", getTrainType())
                .append("commondAffectTrainId", getCommondAffectTrainId())
                .append("commondAffectTrainName", getCommondAffectTrainName())
                .append("commondContent", getCommondContent())
                .append("commondUser", getCommondUser())
                .append("isWeekStop", getStopWeek())
                .append("stopWeek",getStopWeek())
                .append("stopDays", getStopDays())
                .append("shiftDay", getShiftDay())
                .append("trainStartDay", getTrainStartDay())
                .append("trainStopDay", getTrainStopDay())
                .toString();
    }
}
