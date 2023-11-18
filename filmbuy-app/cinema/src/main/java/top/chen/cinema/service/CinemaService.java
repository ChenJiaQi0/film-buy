package top.chen.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import top.chen.cinema.domain.entity.Cinema;
import top.chen.cinema.fegin.Film;

import java.util.List;

/**
 * @author ChenQi
 * @date 2023/11/12
 * @description: CinemaService
 */
public interface CinemaService extends IService<Cinema> {

    List<Film> getFilmsByCinemaId(String id);
}
