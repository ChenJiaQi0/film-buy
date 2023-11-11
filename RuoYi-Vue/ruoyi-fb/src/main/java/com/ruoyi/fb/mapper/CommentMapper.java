package com.ruoyi.fb.mapper;

import java.util.List;
import com.ruoyi.fb.domain.Comment;

/**
 * commentMapper接口
 * 
 * @author chen
 * @date 2023-11-11
 */
public interface CommentMapper 
{
    /**
     * 查询comment
     * 
     * @param id comment主键
     * @return comment
     */
    public Comment selectCommentById(Long id);

    /**
     * 查询comment列表
     * 
     * @param comment comment
     * @return comment集合
     */
    public List<Comment> selectCommentList(Comment comment);

    /**
     * 新增comment
     * 
     * @param comment comment
     * @return 结果
     */
    public int insertComment(Comment comment);

    /**
     * 修改comment
     * 
     * @param comment comment
     * @return 结果
     */
    public int updateComment(Comment comment);

    /**
     * 删除comment
     * 
     * @param id comment主键
     * @return 结果
     */
    public int deleteCommentById(Long id);

    /**
     * 批量删除comment
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCommentByIds(Long[] ids);
}
