package top.chen.user.domain.entity;

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
@TableName("fb_order")
public class Order implements Serializable {

    private static final long serialVersionUID=1L;

    /**
     * 主键id
     */
      @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 影院名称
     */
    private String cinemaName;

    /**
     * 影片名称
     */
    private String filmName;

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 座位信息
     */
    private String seat;

    /**
     * 总价
     */
    private Integer price;

    /**
     * 买票数量
     */
    private Integer count;

    /**
     *  订单状态（0：待消费1：已完成）
     */
    private Integer status;

    @JsonFormat(pattern = "yyyy年-MM月-dd日 HH:mm")
    private Date date;

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
