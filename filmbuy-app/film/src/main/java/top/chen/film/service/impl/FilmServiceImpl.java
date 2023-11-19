package top.chen.film.service.impl;

import jakarta.annotation.Resource;
import org.springframework.beans.BeanUtils;
import top.chen.film.domain.entity.Actor;
import top.chen.film.domain.entity.Film;
import top.chen.film.domain.vo.FilmVO;
import top.chen.film.mapper.FilmMapper;
import top.chen.film.service.ActorService;
import top.chen.film.service.FilmService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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
}
