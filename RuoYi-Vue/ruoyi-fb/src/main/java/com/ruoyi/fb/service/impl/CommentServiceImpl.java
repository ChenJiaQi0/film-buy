package com.ruoyi.fb.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.fb.mapper.CommentMapper;
import com.ruoyi.fb.domain.Comment;
import com.ruoyi.fb.service.ICommentService;

/**
 * commentService业务层处理
 * 
 * @author chen
 * @date 2023-11-11
 */
@Service
public class CommentServiceImpl implements ICommentService 
{
    @Autowired
    private CommentMapper commentMapper;

    /**
     * 查询comment
     * 
     * @param id comment主键
     * @return comment
     */
    @Override
    public Comment selectCommentById(Long id)
    {
        return commentMapper.selectCommentById(id);
    }

    /**
     * 查询comment列表
     * 
     * @param comment comment
     * @return comment
     */
    @Override
    public List<Comment> selectCommentList(Comment comment)
    {
        return commentMapper.selectCommentList(comment);
    }

    /**
     * 新增comment
     * 
     * @param comment comment
     * @return 结果
     */
    @Override
    public int insertComment(Comment comment)
    {
        comment.setCreateTime(DateUtils.getNowDate());
        return commentMapper.insertComment(comment);
    }

    /**
     * 修改comment
     * 
     * @param comment comment
     * @return 结果
     */
    @Override
    public int updateComment(Comment comment)
    {
        comment.setUpdateTime(DateUtils.getNowDate());
        return commentMapper.updateComment(comment);
    }

    /**
     * 批量删除comment
     * 
     * @param ids 需要删除的comment主键
     * @return 结果
     */
    @Override
    public int deleteCommentByIds(Long[] ids)
    {
        return commentMapper.deleteCommentByIds(ids);
    }

    /**
     * 删除comment信息
     * 
     * @param id comment主键
     * @return 结果
     */
    @Override
    public int deleteCommentById(Long id)
    {
        return commentMapper.deleteCommentById(id);
    }
}
