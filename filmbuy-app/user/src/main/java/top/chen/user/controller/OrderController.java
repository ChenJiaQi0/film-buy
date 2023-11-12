package top.chen.user.controller;


import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import top.chen.common.result.Result;
import top.chen.user.domain.entity.Order;
import top.chen.user.domain.entity.vo.OrderVO;
import top.chen.user.service.OrderService;

import javax.swing.plaf.SpinnerUI;
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
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public Result<List<OrderVO>> getOrderByUserId(@PathVariable String id) {
        Result<List<OrderVO>> resp = new Result<>();
        List<OrderVO> list = orderService.getOrderByUserId(id);
        resp.setData(list);
        return resp;
    }
}

