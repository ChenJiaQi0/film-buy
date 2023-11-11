package com.ruoyi.fb.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * showtime对象 fb_showtime
 * 
 * @author chen
 * @date 2023-11-11
 */
public class Showtime extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 影院id */
    @Excel(name = "影院id")
    private Long cinemaId;

    /** 影片id */
    @Excel(name = "影片id")
    private Long filmId;

    /** 放映日期（显示今明两天） */
    @Excel(name = "放映日期", readConverterExp = "显=示今明两天")
    private Date date;

    /** 放映时间 */
    @Excel(name = "放映时间")
    private String hour;

    /** 厅号 */
    @Excel(name = "厅号")
    private String name;

    /** 价格 */
    @Excel(name = "价格")
    private Long price;

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
    public void setCinemaId(Long cinemaId) 
    {
        this.cinemaId = cinemaId;
    }

    public Long getCinemaId() 
    {
        return cinemaId;
    }
    public void setFilmId(Long filmId) 
    {
        this.filmId = filmId;
    }

    public Long getFilmId() 
    {
        return filmId;
    }
    public void setDate(Date date) 
    {
        this.date = date;
    }

    public Date getDate() 
    {
        return date;
    }
    public void setHour(String hour) 
    {
        this.hour = hour;
    }

    public String getHour() 
    {
        return hour;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
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
            .append("cinemaId", getCinemaId())
            .append("filmId", getFilmId())
            .append("date", getDate())
            .append("hour", getHour())
            .append("name", getName())
            .append("price", getPrice())
            .append("deleted", getDeleted())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
