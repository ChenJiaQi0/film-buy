package com.ruoyi.fb.service;

import java.util.List;
import com.ruoyi.fb.domain.Comment;

/**
 * commentService接口
 * 
 * @author chen
 * @date 2023-11-11
 */
public interface ICommentService 
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
     * 批量删除comment
     * 
     * @param ids 需要删除的comment主键集合
     * @return 结果
     */
    public int deleteCommentByIds(Long[] ids);

    /**
     * 删除comment信息
     * 
     * @param id comment主键
     * @return 结果
     */
    public int deleteCommentById(Long id);
}
