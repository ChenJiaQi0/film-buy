package top.chen.user.controller;


import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

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
public class OrderController {
    @Resource
    private OrderService orderService;

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

    @PostMapping("/buy")
    public Result buyFilm(@RequestHeader String token, @RequestBody Order order) {
        // 判断用户是否登录
        Integer userId = tokenUtil.getUserIdFromToken(token);
        order.setUserId(Long.valueOf(userId));
        orderService.buyFilm(order);
        return Result.ok();
    }
}

