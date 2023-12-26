package top.chen.user.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import top.chen.user.domain.entity.Comment;
import top.chen.user.fegin.Film;
import top.chen.user.fegin.FilmService;
import top.chen.user.mapper.CommentMapper;
import top.chen.user.service.CommentService;

/**
 * @author ChenQi
 * @date 2023/11/5
 * @description: CommentServiceImpl
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {
    @Resource
    private FilmService filmService;

    @Override
    public Film comment(Comment comment) {
        // 评论
        baseMapper.insert(comment);
        String filmId = String.valueOf(comment.getFilmId());
        // 更新评分人数
        Film film = filmService.updateSnum(filmId);

        Double avgSc = baseMapper.avgSc(filmId);
        System.out.println(avgSc);
        if (avgSc != null) {
            filmService.updateSc(filmId, avgSc);
            film.setSc(avgSc);
        }
        return film;
    }
}
