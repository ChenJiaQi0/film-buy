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
        // 假设已经从数据库中获取到了用户购买历史和电影标签的数据
        List<Long> userPurchaseHistory = getUserPurchaseHistory(userId);
        Map<Long, List<String>> movieTags = getMovieTagsFromDatabase();

        // 根据用户购买历史获取已购买的电影标签
        List<String> purchasedMovieTags = getMovieTagsByPurchaseHistory(userPurchaseHistory, movieTags);

        List<Long> recommendedMovies = new ArrayList<>();
        for (Map.Entry<Long, List<String>> entry : movieTags.entrySet()) {
            Long movieId = entry.getKey();
            List<String> tags = entry.getValue();
            if (!userPurchaseHistory.contains(movieId) && hasCommonTags(purchasedMovieTags, tags)) {
                recommendedMovies.add(movieId);
            }
        }
        System.out.println("根据已购买的电影标签推荐未看过的电影" + recommendedMovies);
        return recommendedMovies;
    }

    // 判断两个标签列表是否有共同的标签
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
                continue;
            }
            else {
                flag =false;
                break;
            }
        }
        return flag;
    }

    // 从数据库中获取用户购买历史
    private List<Long> getUserPurchaseHistory(String userId) {
        // 实现从数据库中获取用户购买历史的逻辑
        // 返回用户购买历史的电影id列表
        List<Long> filmIds = this.getUserPurchaseHistoryFromDatabase(userId);
        System.out.println("从数据库中获取用户购买历史" + filmIds);
        return filmIds;
    }

    // 从数据库中获取电影标签
    private Map<Long, List<String>> getMovieTagsFromDatabase() {
        Map<Long, List<String>> cat = new HashMap<>();
        // 实现从数据库中获取电影标签的逻辑
        List<Film> list = this.list();
        for (Film film : list) {
            cat.put(film.getId(), List.of(film.getCat().split(",")));
        }
        System.out.println("从数据库中获取电影标签" + cat);
        // 返回电影id和对应标签列表的映射关系
        return cat;
    }

    // 根据用户购买历史获取已购买的电影标签
    private List<String> getMovieTagsByPurchaseHistory(List<Long> userPurchaseHistory, Map<Long, List<String>> movieTags) {
        List<String> purchasedMovieTags = new ArrayList<>();
        for (Long movieId : userPurchaseHistory) {
            if (movieTags.containsKey(movieId)) {
                purchasedMovieTags.addAll(movieTags.get(movieId));
            }
        }
        System.out.println("根据用户购买历史获取已购买的电影标签" + purchasedMovieTags);
        return purchasedMovieTags;
    }
}
