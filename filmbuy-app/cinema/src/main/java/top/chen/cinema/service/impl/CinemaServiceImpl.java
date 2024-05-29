package top.chen.cinema.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import top.chen.cinema.domain.entity.Cinema;
import top.chen.cinema.fegin.Film;
import top.chen.cinema.fegin.FilmService;
import top.chen.cinema.mapper.CinemaMapper;
import top.chen.cinema.service.CinemaService;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * @author ChenQi
 * @date 2023/11/12
 * @description: CinemaServiceImpl
 */
@Slf4j
@Service
public class CinemaServiceImpl extends ServiceImpl<CinemaMapper, Cinema> implements CinemaService {
    @Resource
    private FilmService filmService;

    /**
     * 根据影院查询对应影片信息
     * @param id
     * @return
     */
    @Override
    public List<Film> getFilmsByCinemaId(String id) {
        String[] filmIds = baseMapper.getFilmIdsByCinemaId(id);
        List<Film> films = new ArrayList<>();
        for (String filmId : filmIds) {
            log.info("影院：" + id + " 获取到的filmId：" + filmId);
            films.add(filmService.getSimpleFilm(filmId));
        }
        return films;
    }

    @Override
    public List<Cinema> list(Integer id) {
        return baseMapper.list(id, DateUtil.now());
    }
}
