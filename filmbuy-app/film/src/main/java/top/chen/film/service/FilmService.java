package top.chen.film.service;

import top.chen.film.domain.entity.Film;
import com.baomidou.mybatisplus.extension.service.IService;
import top.chen.film.domain.vo.FilmVO;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author chen
 * @since 2023-11-05
 */
public interface FilmService extends IService<Film> {

    FilmVO getFilmByIdAndActors(String id);

    List<Film> hotFilms(String name);
    List<Film> exceptFilms(String name);
    List<Film> recommendedFilms();
}
