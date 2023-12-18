package com.ruoyi.fb.domain;

import lombok.Builder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * seat对象 fb_seat
 * 
 * @author chen
 * @date 2023-11-11
 */
@Builder
public class Seat extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 场次id */
    @Excel(name = "场次id")
    private Long showtimeId;

    /** 座位所在排的编号 */
    @Excel(name = "座位所在排的编号")
    private Integer rn;

    /** 座位所在列的编号 */
    @Excel(name = "座位所在列的编号")
    private Integer cn;

    /** 状态（0：空闲1：已售出） */
    @Excel(name = "状态", readConverterExp = "0=：空闲1：已售出")
    private String status;

    /** 删除标识（0：未删除1：已删除） */
    @Excel(name = "删除标识", readConverterExp = "0=：未删除1：已删除")
    private Long deleted;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setShowtimeId(Long showtimeId) 
    {
        this.showtimeId = showtimeId;
    }

    public Long getShowtimeId() 
    {
        return showtimeId;
    }
    public void setRn(Integer rn)
    {
        this.rn = rn;
    }

    public Integer getRn()
    {
        return rn;
    }
    public void setCn(Integer cn)
    {
        this.cn = cn;
    }

    public Integer getCn()
    {
        return cn;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setDeleted(Long deleted) 
    {
        this.deleted = deleted;
    }

    public Long getDeleted() 
    {
        return deleted;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("showtimeId", getShowtimeId())
            .append("rn", getRn())
            .append("cn", getCn())
            .append("status", getStatus())
            .append("deleted", getDeleted())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
