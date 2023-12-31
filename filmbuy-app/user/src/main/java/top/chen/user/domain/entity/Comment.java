package top.chen.user.domain.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @author ChenQi
 * @date 2023/11/5
 * @description: Comment
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@TableName("fb_comment")
public class Comment implements Serializable {

    private static final long serialVersionUID=1L;

    /**
     * 主键id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 评分
     */
    private Double sc;

    /**
     * 评论内容
     */
    private String comment;

    /**
     * 评论者id
     */
    private Long userId;

    /**
     * 影片id
     */
    private Long filmId;

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
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date createTime;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;


}
