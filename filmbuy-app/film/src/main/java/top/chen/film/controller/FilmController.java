package top.chen.film.controller;


import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import top.chen.common.result.Result;
import top.chen.film.domain.entity.Film;
import top.chen.film.domain.vo.FilmVO;
import top.chen.film.service.FilmService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author chen
 * @since 2023-11-05
 */
@RestController
@RequestMapping("/film")
public class FilmController {
    @Resource
    private FilmService filmService;

    @GetMapping("/getSimpleFilm/{id}")
    public Film getSimpleFilm(@PathVariable String id){
        return filmService.getById(id);
    }

    /**
     * 影片信息
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public Result<FilmVO> getFilmByIdAndActors(@PathVariable String id){
        Result<FilmVO> resp = new Result<>();
        resp.setData(filmService.getFilmByIdAndActors(id));
        return resp;
    }

    /**
     * 热映影片和即将上映影片
     * @return
     */
    @GetMapping("/hotAndExcept")
    public Result<Map<String, List<Film>>> hotAndExceptFilms() {
        Result<Map<String, List<Film>>> resp = new Result<>();
        resp.setData(filmService.hotAndExceptFilms());
        return resp;
    }
}

