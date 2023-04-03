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
 * 高铁车辆管理对象 train_high
 * 
 * @author YALO
 * @date 2023-03-27
 */
public class TrainHigh extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 高铁ID */
    @Excel(name = "高铁ID")
    private Long hightrainId;

    /** 高铁车号 */
    @Excel(name = "高铁车号")
    private String hightrainName;

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
    private Long isAvaliable;

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

    /** 图定编组数量 */
    @Excel(name = "图定编组数量")
    private Long trainsetNum;

    /** 站台号 */
    @Excel(name = "站台号")
    private Long platformNo;

    /** 检票口号 */
    @Excel(name = "检票口号")
    private Long deportNo;

    /** 折返车次ID */
    @Excel(name = "折返车次ID")
    private Long coupleId;

    /** 折返车号 */
    @Excel(name = "折返车号")
    private String coupleName;

    public void setHightrainId(Long hightrainId) 
    {
        this.hightrainId = hightrainId;
    }

    public Long getHightrainId() 
    {
        return hightrainId;
    }
    public void setHightrainName(String hightrainName) 
    {
        this.hightrainName = hightrainName;
    }

    public String getHightrainName() 
    {
        return hightrainName;
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

    public Boolean getIsDepature() {return isDepature; }
    public void setIsDepature(Boolean isDepature) {this.isDepature = isDepature; }

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
    public void setTrainsetNum(Long trainsetNum) 
    {
        this.trainsetNum = trainsetNum;
    }

    public Long getTrainsetNum() 
    {
        return trainsetNum;
    }
    public void setPlatformNo(Long platformNo) 
    {
        this.platformNo = platformNo;
    }

    public Long getPlatformNo() 
    {
        return platformNo;
    }
    public void setDeportNo(Long deportNo) 
    {
        this.deportNo = deportNo;
    }

    public Long getDeportNo() 
    {
        return deportNo;
    }
    public void setCoupleId(Long coupleId) 
    {
        this.coupleId = coupleId;
    }

    public Long getCoupleId() 
    {
        return coupleId;
    }
    public void setCoupleName(String coupleName) 
    {
        this.coupleName = coupleName;
    }

    public String getCoupleName() 
    {
        return coupleName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("hightrainId", getHightrainId())
            .append("hightrainName", getHightrainName())
            .append("depatureStation", getDepatureStation())
            .append("isDepature", getIsDepature())
            .append("terminalStation", getTerminalStation())
            .append("isAvaliable", getIsAvaliable())
            .append("arriveTime", getArriveTime())
            .append("leaveTime", getLeaveTime())
            .append("trainsetNum", getTrainsetNum())
            .append("platformNo", getPlatformNo())
            .append("deportNo", getDeportNo())
            .append("coupleId", getCoupleId())
            .append("coupleName", getCoupleName())
            .toString();
    }
}
