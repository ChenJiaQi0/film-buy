package top.chen.cinema.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import top.chen.cinema.domain.entity.Seat;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author chen
 * @since 2023-11-05
 */
public interface SeatMapper extends BaseMapper<Seat> {
    String getShowTimeNameById(String id);
}
