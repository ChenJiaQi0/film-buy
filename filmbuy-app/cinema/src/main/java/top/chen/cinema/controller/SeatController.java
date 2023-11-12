package top.chen.cinema.controller;


import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import top.chen.cinema.domain.entity.Seat;
import top.chen.cinema.service.SeatService;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author chen
 * @since 2023-11-05
 */
@RestController
@RequestMapping("/seat")
public class SeatController {
    @Resource
    private SeatService seatService;

    @GetMapping("/{id}")
    public Seat getSeatById(@PathVariable String id){
        return seatService.getById(id);
    }

    @GetMapping("/name/{id}")
    public String getShowTimeNameById(@PathVariable String id){
        return seatService.getShowTimeNameById(id);
    }
}

