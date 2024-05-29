package top.chen.user.controller;


import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import top.chen.common.exception.ServiceException;
import top.chen.common.result.Result;
import top.chen.common.util.tokenUtil;
import top.chen.user.domain.entity.Order;
import top.chen.user.domain.entity.vo.OrderVO;
import top.chen.user.service.OrderService;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author chen
 * @since 2023-11-05
 */
@RestController
@RequestMapping("/order")
@Slf4j
public class OrderController {
    @Resource
    private OrderService orderService;

    /**
     * 订单消费
     * @param id
     * @return
     */
    @PostMapping("/{id}")
    public Result consume(@PathVariable String id) {
        Order order = orderService.getById(id);
        order.setStatus(1);
        boolean b = orderService.updateById(order);
        if (b) {
            log.info("二维码消费成功");
            return new Result();
        } else {
            throw new ServiceException("消费异常");
        }
    }

    /**
     * 查询用户订单
     * @param token
     * @return
     */
    @GetMapping()
    public Result<List<OrderVO>> getOrderByUserId(@RequestHeader String token) {
        Integer tokenId = tokenUtil.getUserIdFromToken(token);
        Result<List<OrderVO>> resp = new Result<>();
        List<OrderVO> list = orderService.getOrderByUserId(String.valueOf(tokenId));
        resp.setData(list);
        return resp;
    }

    /**
     * 购买
     * @param token
     * @param order
     * @return
     */
    @PostMapping("/buy")
    public Result buyFilm(@RequestHeader String token, @RequestBody Order order) {
        // 判断用户是否登录
        Integer userId = tokenUtil.getUserIdFromToken(token);
        order.setUserId(Long.valueOf(userId));
        orderService.buyFilm(order);
        return Result.ok();
    }
}

