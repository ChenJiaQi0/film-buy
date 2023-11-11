package top.chen.user.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import top.chen.user.domain.entity.Comment;
import top.chen.user.mapper.CommentMapper;
import top.chen.user.service.CommentService;

/**
 * @author ChenQi
 * @date 2023/11/5
 * @description: CommentServiceImpl
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {
}
