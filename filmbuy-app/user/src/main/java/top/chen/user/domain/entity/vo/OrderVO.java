package top.chen.user.domain.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import top.chen.user.domain.entity.Order;

/**
 * @author ChenQi
 * @date 2023/11/12
 * @description: OrderVO 订单详情
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderVO {
    private Order order;

    private String brandName;
    private String filmImg;
    private Long filmId;

    /**
     * 座位信息（xxx厅 xx排xx座...）
     */
    private String seatMsg;
}
