package top.chen.cinema.domain.entity;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;
import java.io.Serializable;

import lombok.*;

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
@TableName("fb_cinema")
public class Cinema implements Serializable {

    private static final long serialVersionUID=1L;

    /**
     * 主键id
     */
      @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 品牌名称
     */
    private String brandName;

    /**
     * 影院名称
     */
    private String cinemaName;

    /**
     * 省
     */
    private String province;

    /**
     * 市
     */
    private String city;

    /**
     * 区
     */
    private String area;

    /**
     * 地址
     */
    private String address;

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
