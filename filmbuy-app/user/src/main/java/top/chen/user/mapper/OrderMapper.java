package top.chen.user.mapper;

import top.chen.user.domain.entity.Order;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import top.chen.user.domain.entity.vo.OrderVO;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author chen
 * @since 2023-11-05
 */
public interface OrderMapper extends BaseMapper<Order> {

    String getBrandNameByOrderCinemaName(String cinemaName);
    OrderVO getFilmImgByOrderFilmName(String filmName);
}
