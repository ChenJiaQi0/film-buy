package top.chen.film.controller;


import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import top.chen.common.exception.ServiceException;
import top.chen.common.result.Result;
import top.chen.common.util.JwtUtil;
import top.chen.common.util.tokenUtil;
import top.chen.film.domain.entity.Film;
import top.chen.film.domain.vo.FilmVO;
import top.chen.film.service.FilmService;

import java.util.*;

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

    /**
     * 实时更新评分（未购票用户评分不被记录）
     * @param filmId
     * @param sc
     */
    @PostMapping("/sc/{filmId}/{sc}")
    public void updateSc(@PathVariable String filmId, @PathVariable Double sc) {
        Film dbFilm = filmService.getById(filmId);
        try {
            dbFilm.setSc(sc);
            filmService.updateById(dbFilm);
        } catch (Exception e) {
            throw new ServiceException("更新失败");
        }
    }

    /**
     * 更新评分人数
     * @param filmId
     */
    @PostMapping("/snum/{filmId}")
    public Film updateSnum(@PathVariable String filmId) {
        Film dbFilm = filmService.getById(filmId);
        try {
            dbFilm.setSnum(dbFilm.getSnum() + 1);
            filmService.updateById(dbFilm);
        } catch (Exception e) {
            throw new ServiceException("更新失败");
        }
        return dbFilm;
    }

    // 更新想看和看过人数
    @PostMapping("/updateWatchAndWantCount/{filmId}/{type}")
    public Result<Film> updateWatchAndWantCount(@PathVariable String type, @PathVariable String filmId) {
        Film film = filmService.updateWatchAndWantCount(filmId, type);
        Result<Film> resp = new Result<>();
        resp.setData(film);
        return resp;
    }

    /**
     * 推荐电影
     * @param token
     * @return
     */
    @GetMapping("/recommendByUserId")
    public Result<List<Film>> recommendByUserId(@RequestHeader String token) {
        Result<List<Film>> resp = new Result<>();

        Integer userId = tokenUtil.getUserIdFromToken(token);
        List<Long> movieIds = filmService.recommendMovies(String.valueOf(userId));
        if (movieIds == null || movieIds.size() == 0){
            resp.setData(Collections.emptyList());
            return resp;
        }

        List<Film> films = filmService.listByIds(movieIds);
        films.sort(Comparator.comparing(Film::getSc).reversed());
        resp.setData(films);
        return resp;
    }

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
     * 热映影片
     * @return
     */
    @GetMapping("/hot")
    public Result<List<Film>> hotFilms(@RequestParam(required = false) String name) {
        Result<List<Film>> resp = new Result<>();
        resp.setData(filmService.hotFilms(name));
        return resp;
    }

    /**
     * 待映影片
     * @return
     */
    @GetMapping("/except")
    public Result<List<Film>> exceptFilms(@RequestParam(required = false) String name) {
        Result<List<Film>> resp = new Result<>();
        resp.setData(filmService.exceptFilms(name));
        return resp;
    }

    /**
     * 待映推荐
     * @return
     */
    @GetMapping("/recommend")
    public Result<List<Film>> recommendedFilms() {
        Result<List<Film>> resp = new Result<>();
        resp.setData(filmService.recommendedFilms());
        return resp;
    }
}

