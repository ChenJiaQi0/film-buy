package top.chen.cinema.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import top.chen.cinema.domain.entity.Seat;
import top.chen.cinema.service.SeatService;
import top.chen.common.result.Result;

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

    /**
     * 判断选择的座位是否售空
     * @param seats
     * @return
     */
    @GetMapping("/isOnSell")
    public Boolean isOnSell(@RequestParam String seats) {
        return seatService.isOnSell(seats);
    }

    /**
     * 将座位status修改为1
     * @param seats
     */
    @PostMapping("/updateStatusBySeats")
    public void updateStatusBySeats(@RequestParam String seats) {
        seatService.updateStatusBySeats(seats);
    }

    /**
     * 生成场次的 4*4 座位信息
     * @param id
     */
    @PostMapping("/{id}")
    public void generateSeatByShowTime(@PathVariable String id) {
        seatService.generate(id);
    }

    /**
     * 根据场次返回座位
     * @param id
     * @return
     */
    @GetMapping
    public Result<List<Seat>> getSeatsByShowTimeId(@RequestParam("id") String id){
        LambdaQueryWrapper<Seat> wp = new LambdaQueryWrapper<>();
        wp.eq(Seat::getShowtimeId, id);
        List<Seat> list = seatService.list(wp);
        Result<List<Seat>> resp = new Result<>();
        resp.setData(list);
        return resp;
    }
}

