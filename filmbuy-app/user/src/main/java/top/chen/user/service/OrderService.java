package top.chen.user.service;

import top.chen.user.domain.entity.Order;
import com.baomidou.mybatisplus.extension.service.IService;
import top.chen.user.domain.entity.vo.OrderVO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author chen
 * @since 2023-11-05
 */
public interface OrderService extends IService<Order> {

    List<OrderVO> getOrderByUserId(String id);

    void buyFilm(Order order);
}
