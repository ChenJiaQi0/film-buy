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
public class Seat implements Serializable {

    private static final long serialVersionUID=1L;

    /**
     * 主键id
     */
      @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 场次id
     */
    private Long showtimeId;

    /**
     * 座位所在排的编号
     */
    private Integer rn;

    /**
     * 座位所在列的编号
     */
    private Integer cn;

    /**
     * 状态（0：空闲1：已售出）
     */
    private String status;

    /**
     * 删除标识（0：未删除1：已删除）
     */
    @TableLogic
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
