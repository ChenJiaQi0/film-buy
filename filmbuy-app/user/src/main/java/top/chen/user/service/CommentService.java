package top.chen.user.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.stereotype.Service;
import top.chen.user.domain.entity.Comment;
import top.chen.user.fegin.Film;

/**
 * @author ChenQi
 * @date 2023/11/5
 * @description: CommentService
 */
public interface CommentService extends IService<Comment> {
    Film comment(Comment comment);
}
