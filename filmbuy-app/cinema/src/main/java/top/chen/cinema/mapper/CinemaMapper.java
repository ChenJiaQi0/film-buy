package top.chen.cinema.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import top.chen.cinema.domain.entity.Cinema;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author chen
 * @since 2023-11-05
 */
public interface CinemaMapper extends BaseMapper<Cinema> {

    String[] getFilmIdsByCinemaId(String id);

    List<Cinema> list(@Param("id") Integer id, String time);
}
