package top.chen.film.service.impl;

import jakarta.annotation.Resource;
import org.springframework.beans.BeanUtils;
import top.chen.common.exception.ServiceException;
import top.chen.film.domain.entity.Actor;
import top.chen.film.domain.entity.Film;
import top.chen.film.domain.vo.FilmVO;
import top.chen.film.mapper.FilmMapper;
import top.chen.film.service.ActorService;
import top.chen.film.service.FilmService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author chen
 * @since 2023-11-05
 */
@Service
public class FilmServiceImpl extends ServiceImpl<FilmMapper, Film> implements FilmService {
    @Resource
    private ActorService actorService;

    /**
     * 更新想看和看过
     * @param filmId
     * @param type
     */
    @Override
    public Film updateWatchAndWantCount(String filmId, String type) {
        Film film = baseMapper.selectById(filmId);
        if ("1".equals(type)) {
            film.setWish(film.getWish() + 1);
        } else {
            film.setWatched(film.getWatched() + 1);
        }
        try {
            baseMapper.updateById(film);
        } catch (Exception e) {
            throw new ServiceException("更新失败");
        }
        return film;
    }

    /**
     * 影片信息
     * @param id
     * @return
     */
    @Override
    public FilmVO getFilmByIdAndActors(String id) {
        FilmVO filmVO = new FilmVO();
        Film dbFilm = baseMapper.selectById(id);
        if (dbFilm == null) return null;
        filmVO.setFilm(dbFilm);

        // 根据影片获取对应演员信息
        List<Actor> actorList = new ArrayList<>();
        String actorsIds = dbFilm.getActors();
        String[] ids = actorsIds.split(",");
        for (String aid : ids) {
            actorList.add(actorService.getById(aid));
        }
        filmVO.setActors(actorList);
        return filmVO;
    }

    /**
     * 热映影片
     * @return
     */
    @Override
    public List<Film> hotFilms(String name) {
        List<Film> hotFilms = baseMapper.hotFilms(name);
        return hotFilms;
    }

    /**
     * 待映影片
     * @return
     */
    @Override
    public List<Film> exceptFilms(String name) {
        List<Film> exceptFilms = baseMapper.exceptFilms(name);
        return exceptFilms;
    }

    /**
     * 待映推荐
     * @return
     */
    @Override
    public List<Film> recommendedFilms() {
        return baseMapper.recommendedFilms();
    }

    /**
     * 获取用户购买电影的id
     * @param userId
     * @return
     */
    @Override
    public List<Long> getUserPurchaseHistoryFromDatabase(String userId) {
        return baseMapper.getUserPurchaseHistory(userId);
    }

    // 根据已购买的电影标签推荐未看过的电影
    @Override
    public List<Long> recommendMovies(String userId) {

        List<Long> userPurchaseHistory = getUserPurchaseHistory(userId);
        Map<Long, List<String>> movieTags = getMovieTagsFromDatabase();

        List<String> purchasedMovieTags = getMovieTagsByPurchaseHistory(userPurchaseHistory, movieTags);

        List<Long> recommendedMovies = new ArrayList<>();
        for (Map.Entry<Long, List<String>> entry : movieTags.entrySet()) {
            Long movieId = entry.getKey();
            List<String> tags = entry.getValue();
            if (!userPurchaseHistory.contains(movieId) && hasCommonTags(purchasedMovieTags, tags)) {
                recommendedMovies.add(movieId);
            }
        }

        return recommendedMovies;
    }

    private boolean hasCommonTags(List<String> tags1, List<String> tags2) {
//        for (String tag : tags1) {
//            if (tags2.contains(tag)) {
//                return true;
//            }
//        }
        boolean flag =false;
        for (String tag : tags2) {
            if (tags1.contains(tag)) {
                flag = true;
                break;
            }
            else {
                flag =false;
            }
        }
        return flag;
    }

    private List<Long> getUserPurchaseHistory(String userId) {
        // 实现从数据库中获取用户购买历史的逻辑
        // 返回用户购买历史的电影id列表
        List<Long> filmIds = this.getUserPurchaseHistoryFromDatabase(userId);
        return filmIds;
    }

    private Map<Long, List<String>> getMovieTagsFromDatabase() {
        Map<Long, List<String>> cat = new HashMap<>();
        List<Film> list = this.list();
        for (Film film : list) {
            cat.put(film.getId(), List.of(film.getCat().split(",")));
        }
        return cat;
    }

    private List<String> getMovieTagsByPurchaseHistory(List<Long> userPurchaseHistory, Map<Long, List<String>> movieTags) {
        List<String> purchasedMovieTags = new ArrayList<>();
        for (Long movieId : userPurchaseHistory) {
            if (movieTags.containsKey(movieId)) {
                purchasedMovieTags.addAll(movieTags.get(movieId));
            }
        }
        return purchasedMovieTags;
    }
}
