package top.chen.cinema.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import top.chen.cinema.domain.entity.Seat;
import top.chen.cinema.mapper.SeatMapper;
import top.chen.cinema.service.SeatService;

import java.util.Arrays;
import java.util.List;

/**
 * @author ChenQi
 * @date 2023/11/12
 * @description: SeatServiceImpl
 */
@Service
public class SeatServiceImpl extends ServiceImpl<SeatMapper, Seat> implements SeatService {
    @Override
    public String getShowTimeNameById(String id) {
        return baseMapper.getShowTimeNameById(id);
    }

    @Override
    public void generate(String id) {
        for (int i = 1; i < 9; i++) {
            for (int j = 1; j< 9; j++){
                baseMapper.insert(Seat.builder()
                        .showtimeId(Long.valueOf(id))
                        .rn(i)
                        .cn(j)
                        .build());
            }
        }
    }

    /**
     * 判断选择的座位是否售空
     * @param seats
     * @return
     */
    @Override
    public Boolean isOnSell(String seats) {
        String[] seatIds = seats.split(",");
        boolean flag = true;
        List<Seat> list = baseMapper.selectBatchIds(Arrays.asList(seatIds));
        for (Seat seat : list) {
            if (seat.getStatus() == 1) {
                flag = false;
                break;
            }
        }

        return flag;
    }

    /**
     * 将座位status修改为1
     * @param seats
     */
    @Override
    public void updateStatusBySeats(String seats) {
        String[] seatIds = seats.split(",");
        List<Seat> list = baseMapper.selectBatchIds(Arrays.asList(seatIds));
        if (list.size() > 0) {
            for (Seat seat : list) {
                seat.setStatus(1);
                baseMapper.updateById(seat);
            }
        }
    }
}
