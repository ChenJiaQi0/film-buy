package top.chen.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import top.chen.common.exception.ServiceException;
import top.chen.user.domain.entity.Order;
import top.chen.user.domain.entity.User;
import top.chen.user.domain.entity.vo.OrderVO;
import top.chen.user.fegin.Seat;
import top.chen.user.fegin.SeatService;
import top.chen.user.mapper.OrderMapper;
import top.chen.user.service.OrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import top.chen.user.service.UserService;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author chen
 * @since 2023-11-05
 */
@Service
@Slf4j
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {
    @Resource
    private SeatService seatService;
    @Resource
    private UserService userService;

    /**
     * 查询用户订单
     * @param id
     * @return
     */
    @Override
    public List<OrderVO> getOrderByUserId(String id) {
        List<OrderVO> orderVOS = new ArrayList<>();
        List<Order> orders = baseMapper.selectList(new QueryWrapper<Order>().lambda().eq(Order::getUserId, id));
        for (Order order : orders) {
            OrderVO vo = new OrderVO();
            vo.setOrder(order);
            vo.setBrandName(this.getBrandNameByOrderCinemaName(order.getCinemaName()));
            vo.setSeatMsg(this.getSeatMsgByOrderSeat(order.getSeat()));
            orderVOS.add(vo);
        }
        return orderVOS;
    }



    private String getSeatMsgByOrderSeat(String seat) {
        String[] split = StringUtils.split(seat, ',');
        StringBuffer msg = new StringBuffer();
        msg.append(seatService.getShowTimeNameById(String.valueOf(seatService.getSeatById(split[0]).getShowtimeId())) + "号厅");
        for (String s : split) {
            Seat dbSeat = seatService.getSeatById(s);
            msg.append(dbSeat.getRn() + "排" + dbSeat.getCn() + "座");
        }
//        System.out.println(msg);
        log.info("座位信息：" + msg);
        return msg.toString();
    }

    /**
     * 根据订单里的影院名称获取对应品牌名称
     * @param cinemaName
     * @return
     */
    private String getBrandNameByOrderCinemaName(String cinemaName) {
        return baseMapper.getBrandNameByOrderCinemaName(cinemaName);
    }
}
