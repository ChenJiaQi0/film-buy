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
import com.ruoyi.fb.domain.Cinema;
import com.ruoyi.fb.service.ICinemaService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * cinemaController
 * 
 * @author chen
 * @date 2023-11-11
 */
@RestController
@RequestMapping("/cinema/cinema")
public class CinemaController extends BaseController
{
    @Autowired
    private ICinemaService cinemaService;

    /**
     * 查询cinema列表
     */
    @PreAuthorize("@ss.hasPermi('cinema:cinema:list')")
    @GetMapping("/list")
    public TableDataInfo list(Cinema cinema)
    {
        startPage();
        List<Cinema> list = cinemaService.selectCinemaList(cinema);
        return getDataTable(list);
    }

    /**
     * 导出cinema列表
     */
    @PreAuthorize("@ss.hasPermi('cinema:cinema:export')")
    @Log(title = "cinema", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Cinema cinema)
    {
        List<Cinema> list = cinemaService.selectCinemaList(cinema);
        ExcelUtil<Cinema> util = new ExcelUtil<Cinema>(Cinema.class);
        util.exportExcel(response, list, "cinema数据");
    }

    /**
     * 获取cinema详细信息
     */
    @PreAuthorize("@ss.hasPermi('cinema:cinema:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(cinemaService.selectCinemaById(id));
    }

    /**
     * 新增cinema
     */
    @PreAuthorize("@ss.hasPermi('cinema:cinema:add')")
    @Log(title = "cinema", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Cinema cinema)
    {
        return toAjax(cinemaService.insertCinema(cinema));
    }

    /**
     * 修改cinema
     */
    @PreAuthorize("@ss.hasPermi('cinema:cinema:edit')")
    @Log(title = "cinema", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Cinema cinema)
    {
        return toAjax(cinemaService.updateCinema(cinema));
    }

    /**
     * 删除cinema
     */
    @PreAuthorize("@ss.hasPermi('cinema:cinema:remove')")
    @Log(title = "cinema", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(cinemaService.deleteCinemaByIds(ids));
    }
}
