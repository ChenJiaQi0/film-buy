package top.chen.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import top.chen.cinema.domain.entity.Seat;

/**
 * @author ChenQi
 * @date 2023/11/12
 * @description: SeatService
 */
public interface SeatService extends IService<Seat> {
    String getShowTimeNameById(String id);

    void generate(String id);

    Boolean isOnSell(String seats);

    void updateStatusBySeats(String seats);
}
