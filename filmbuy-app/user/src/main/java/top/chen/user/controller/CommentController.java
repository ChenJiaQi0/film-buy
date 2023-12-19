package top.chen.user.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import top.chen.common.result.Result;
import top.chen.common.util.tokenUtil;
import top.chen.user.domain.entity.Comment;
import top.chen.user.domain.entity.vo.OrderVO;
import top.chen.user.fegin.Film;
import top.chen.user.service.CommentService;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author chen
 * @since 2023-11-05
 */
@RestController
@RequestMapping("/comment")
public class CommentController {
    @Resource
    private CommentService commentService;

    @GetMapping("/{id}")
    public Result<List<Comment>> list(@PathVariable String id) {
        Result<List<Comment>> resp = new Result<>();
        LambdaQueryWrapper<Comment> wp = new LambdaQueryWrapper<>();
        wp.orderByDesc(Comment::getCreateTime);
        wp.eq(Comment::getFilmId, id);
        List<Comment> list = commentService.list(wp);
        resp.setData(list);
        return resp;
    }

    /**
     * 对影片的评论
     * @param token
     * @param comment
     * @return
     */
    @PostMapping()
    public Result<Film> comment(@RequestHeader String token, @RequestBody Comment comment) {
        Integer tokenId = tokenUtil.getUserIdFromToken(token);
        comment.setUserId(Long.valueOf(tokenId));
        Film film = commentService.comment(comment);
        Result<Film> resp = new Result<>();
        resp.setData(film);
        return resp;
    }
}

