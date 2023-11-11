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
import com.ruoyi.fb.domain.Actor;
import com.ruoyi.fb.service.IActorService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * actorController
 * 
 * @author chen
 * @date 2023-11-11
 */
@RestController
@RequestMapping("/actor/actor")
public class ActorController extends BaseController
{
    @Autowired
    private IActorService actorService;

    /**
     * 查询actor列表
     */
    @PreAuthorize("@ss.hasPermi('actor:actor:list')")
    @GetMapping("/list")
    public TableDataInfo list(Actor actor)
    {
        startPage();
        List<Actor> list = actorService.selectActorList(actor);
        return getDataTable(list);
    }

    /**
     * 导出actor列表
     */
    @PreAuthorize("@ss.hasPermi('actor:actor:export')")
    @Log(title = "actor", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Actor actor)
    {
        List<Actor> list = actorService.selectActorList(actor);
        ExcelUtil<Actor> util = new ExcelUtil<Actor>(Actor.class);
        util.exportExcel(response, list, "actor数据");
    }

    /**
     * 获取actor详细信息
     */
    @PreAuthorize("@ss.hasPermi('actor:actor:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(actorService.selectActorById(id));
    }

    /**
     * 新增actor
     */
    @PreAuthorize("@ss.hasPermi('actor:actor:add')")
    @Log(title = "actor", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Actor actor)
    {
        return toAjax(actorService.insertActor(actor));
    }

    /**
     * 修改actor
     */
    @PreAuthorize("@ss.hasPermi('actor:actor:edit')")
    @Log(title = "actor", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Actor actor)
    {
        return toAjax(actorService.updateActor(actor));
    }

    /**
     * 删除actor
     */
    @PreAuthorize("@ss.hasPermi('actor:actor:remove')")
    @Log(title = "actor", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(actorService.deleteActorByIds(ids));
    }
}
