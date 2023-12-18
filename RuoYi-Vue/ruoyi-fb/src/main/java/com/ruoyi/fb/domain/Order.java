package com.ruoyi.fb.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Date;

/**
 * order对象 fb_order
 * 
 * @author chen
 * @date 2023-11-11
 */
public class Order extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 影院名称 */
    @Excel(name = "影院名称")
    private String cinemaName;

    /** 影片名称 */
    @Excel(name = "影片名称")
    private String filmName;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 座位信息 */
    @Excel(name = "座位信息")
    private String seat;

    /** 总价 */
    @Excel(name = "总价")
    private Long price;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+8")
    private Date date;

    /**
     * 买票数量
     */
    private Integer count;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

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
    public void setCinemaName(String cinemaName) 
    {
        this.cinemaName = cinemaName;
    }

    public String getCinemaName() 
    {
        return cinemaName;
    }
    public void setFilmName(String filmName) 
    {
        this.filmName = filmName;
    }

    public String getFilmName() 
    {
        return filmName;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setSeat(String seat) 
    {
        this.seat = seat;
    }

    public String getSeat() 
    {
        return seat;
    }
    public void setPrice(Long price) 
    {
        this.price = price;
    }

    public Long getPrice() 
    {
        return price;
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
            .append("cinemaName", getCinemaName())
            .append("filmName", getFilmName())
            .append("userId", getUserId())
            .append("seat", getSeat())
            .append("price", getPrice())
            .append("date", getDate())
            .append("count", getCount())
            .append("deleted", getDeleted())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
