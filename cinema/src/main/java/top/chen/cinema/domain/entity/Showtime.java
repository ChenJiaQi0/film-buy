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
public class Showtime implements Serializable {

    private static final long serialVersionUID=1L;

    /**
     * 主键id
     */
      @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 影院id
     */
    private Long cinemaId;

    /**
     * 影片id
     */
    private Long filmId;

    /**
     * 放映日期（显示今明两天）
     */
    private Date date;

    /**
     * 放映时间
     */
    private String hour;

    /**
     * 厅号
     */
    private String name;

    /**
     * 价格
     */
    private Integer price;

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
