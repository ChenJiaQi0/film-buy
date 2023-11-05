package top.chen.user.service.impl;

import top.chen.user.domain.entity.Order;
import top.chen.user.mapper.OrderMapper;
import top.chen.user.service.OrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author chen
 * @since 2023-11-05
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {

}
