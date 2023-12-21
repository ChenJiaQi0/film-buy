package top.chen.user.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import top.chen.user.domain.entity.Comment;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author chen
 * @since 2023-11-05
 */
public interface CommentMapper extends BaseMapper<Comment> {
    Double avgSc(String filmId);
}
