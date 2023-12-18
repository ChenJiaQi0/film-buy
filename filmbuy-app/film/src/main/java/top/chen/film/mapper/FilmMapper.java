package top.chen.film.mapper;

import top.chen.film.domain.entity.Film;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author chen
 * @since 2023-11-05
 */
public interface FilmMapper extends BaseMapper<Film> {

    List<Film> hotFilms(String name);

    List<Film> exceptFilms(String name);

    List<Film> recommendedFilms();

    List<Long> getUserPurchaseHistory(String userId);
}
