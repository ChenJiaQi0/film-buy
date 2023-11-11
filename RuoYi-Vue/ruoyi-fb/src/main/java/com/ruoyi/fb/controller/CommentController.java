package com.ruoyi.fb.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.fb.domain.Comment;
import com.ruoyi.fb.service.ICommentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * commentController
 * 
 * @author chen
 * @date 2023-11-11
 */
@RestController
@RequestMapping("/comment/comment")
public class CommentController extends BaseController
{
    @Autowired
    private ICommentService commentService;

    /**
     * 查询comment列表
     */
    @PreAuthorize("@ss.hasPermi('comment:comment:list')")
    @GetMapping("/list")
    public TableDataInfo list(Comment comment)
    {
        startPage();
        List<Comment> list = commentService.selectCommentList(comment);
        return getDataTable(list);
    }

    /**
     * 导出comment列表
     */
    @PreAuthorize("@ss.hasPermi('comment:comment:export')")
    @Log(title = "comment", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Comment comment)
    {
        List<Comment> list = commentService.selectCommentList(comment);
        ExcelUtil<Comment> util = new ExcelUtil<Comment>(Comment.class);
        util.exportExcel(response, list, "comment数据");
    }

    /**
     * 获取comment详细信息
     */
    @PreAuthorize("@ss.hasPermi('comment:comment:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(commentService.selectCommentById(id));
    }

    /**
     * 新增comment
     */
    @PreAuthorize("@ss.hasPermi('comment:comment:add')")
    @Log(title = "comment", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Comment comment)
    {
        return toAjax(commentService.insertComment(comment));
    }

    /**
     * 修改comment
     */
    @PreAuthorize("@ss.hasPermi('comment:comment:edit')")
    @Log(title = "comment", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Comment comment)
    {
        return toAjax(commentService.updateComment(comment));
    }

    /**
     * 删除comment
     */
    @PreAuthorize("@ss.hasPermi('comment:comment:remove')")
    @Log(title = "comment", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(commentService.deleteCommentByIds(ids));
    }
}
