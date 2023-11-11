package com.ruoyi.fb.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * film对象 fb_film
 * 
 * @author chen
 * @date 2023-11-11
 */
public class Film extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 照片 */
    @Excel(name = "照片")
    private String img;

    /** 影片中文名 */
    @Excel(name = "影片中文名")
    private String name;

    /** 影皮英文名 */
    @Excel(name = "影皮英文名")
    private String ename;

    /** 标签 */
    @Excel(name = "标签")
    private String tag;

    /** 类型 */
    @Excel(name = "类型")
    private String cat;

    /** 上映时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "上映时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date date;

    /** 上映地区 */
    @Excel(name = "上映地区")
    private String addr;

    /** 时长 */
    @Excel(name = "时长")
    private Long dur;

    /** 想看人数 */
    @Excel(name = "想看人数")
    private Long wish;

    /** 看过人数 */
    @Excel(name = "看过人数")
    private Long watched;

    /** 评分 */
    @Excel(name = "评分")
    private Long sc;

    /** 评分人数 */
    @Excel(name = "评分人数")
    private Long snum;

    /** 状态（0：未上映1：已上映） */
    @Excel(name = "状态", readConverterExp = "0=：未上映1：已上映")
    private Long status;

    /** 演员们的ids */
    @Excel(name = "演员们的ids")
    private String actors;

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
    public void setImg(String img) 
    {
        this.img = img;
    }

    public String getImg() 
    {
        return img;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setEname(String ename) 
    {
        this.ename = ename;
    }

    public String getEname() 
    {
        return ename;
    }
    public void setTag(String tag) 
    {
        this.tag = tag;
    }

    public String getTag() 
    {
        return tag;
    }
    public void setCat(String cat) 
    {
        this.cat = cat;
    }

    public String getCat() 
    {
        return cat;
    }
    public void setDate(Date date) 
    {
        this.date = date;
    }

    public Date getDate() 
    {
        return date;
    }
    public void setAddr(String addr) 
    {
        this.addr = addr;
    }

    public String getAddr() 
    {
        return addr;
    }
    public void setDur(Long dur) 
    {
        this.dur = dur;
    }

    public Long getDur() 
    {
        return dur;
    }
    public void setWish(Long wish) 
    {
        this.wish = wish;
    }

    public Long getWish() 
    {
        return wish;
    }
    public void setWatched(Long watched) 
    {
        this.watched = watched;
    }

    public Long getWatched() 
    {
        return watched;
    }
    public void setSc(Long sc) 
    {
        this.sc = sc;
    }

    public Long getSc() 
    {
        return sc;
    }
    public void setSnum(Long snum) 
    {
        this.snum = snum;
    }

    public Long getSnum() 
    {
        return snum;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }
    public void setActors(String actors) 
    {
        this.actors = actors;
    }

    public String getActors() 
    {
        return actors;
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
            .append("img", getImg())
            .append("name", getName())
            .append("ename", getEname())
            .append("tag", getTag())
            .append("cat", getCat())
            .append("date", getDate())
            .append("addr", getAddr())
            .append("dur", getDur())
            .append("wish", getWish())
            .append("watched", getWatched())
            .append("sc", getSc())
            .append("snum", getSnum())
            .append("status", getStatus())
            .append("actors", getActors())
            .append("deleted", getDeleted())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
