package top.chen.film.domain.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author chen
 * @since 2023-11-05
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@TableName("fb_film")
public class Film implements Serializable {

    private static final long serialVersionUID=1L;

    /**
     * 主键id
     */
      @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 照片
     */
    private String img;

    /**
     * 影片中文名
     */
    private String name;

    /**
     * 影皮英文名
     */
    private String ename;

    /**
     * 标签
     */
    private String tag;

    /**
     * 类型
     */
    private String cat;

    /**
     * 上映时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date date;

    /**
     * 上映地区
     */
    private String addr;

    /**
     * 时长
     */
    private Integer dur;

    /**
     * 想看人数
     */
    private Integer wish;

    /**
     * 看过人数
     */
    private Integer watched;

    /**
     * 评分
     */
    private Double sc;

    /**
     * 评分人数
     */
    private Integer snum;

    /**
     * 状态（0：未上映1：已上映）
     */
    private Integer status;

    /**
     * 简介
     */
    private String description;

    /**
     * 演员们的ids
     */
    private String actors;

    /**
     * 删除标识（0：未删除1：已删除）
     */
    @TableLogic
    @TableField(fill = FieldFill.INSERT)
    private Integer deleted;

    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;


}
