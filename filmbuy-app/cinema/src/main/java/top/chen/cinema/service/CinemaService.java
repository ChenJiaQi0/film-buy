package top.chen.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;
import top.chen.cinema.domain.entity.Cinema;
import top.chen.cinema.fegin.Film;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author ChenQi
 * @date 2023/11/12
 * @description: CinemaService
 */
public interface CinemaService extends IService<Cinema> {

    List<Film> getFilmsByCinemaId(String id);

    List<Cinema> list(@Param("id") Integer id);
}
