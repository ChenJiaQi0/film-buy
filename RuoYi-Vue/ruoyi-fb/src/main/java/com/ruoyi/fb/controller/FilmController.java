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
import com.ruoyi.fb.domain.Film;
import com.ruoyi.fb.service.IFilmService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * filmController
 * 
 * @author chen
 * @date 2023-11-11
 */
@RestController
@RequestMapping("/film/film")
public class FilmController extends BaseController
{
    @Autowired
    private IFilmService filmService;

    /**
     * 查询film列表
     */
    @PreAuthorize("@ss.hasPermi('film:film:list')")
    @GetMapping("/list")
    public TableDataInfo list(Film film)
    {
        startPage();
        List<Film> list = filmService.selectFilmList(film);
        return getDataTable(list);
    }

    /**
     * 导出film列表
     */
    @PreAuthorize("@ss.hasPermi('film:film:export')")
    @Log(title = "film", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Film film)
    {
        List<Film> list = filmService.selectFilmList(film);
        ExcelUtil<Film> util = new ExcelUtil<Film>(Film.class);
        util.exportExcel(response, list, "film数据");
    }

    /**
     * 获取film详细信息
     */
    @PreAuthorize("@ss.hasPermi('film:film:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(filmService.selectFilmById(id));
    }

    /**
     * 新增film
     */
    @PreAuthorize("@ss.hasPermi('film:film:add')")
    @Log(title = "film", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Film film)
    {
        return toAjax(filmService.insertFilm(film));
    }

    /**
     * 修改film
     */
    @PreAuthorize("@ss.hasPermi('film:film:edit')")
    @Log(title = "film", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Film film)
    {
        return toAjax(filmService.updateFilm(film));
    }

    /**
     * 删除film
     */
    @PreAuthorize("@ss.hasPermi('film:film:remove')")
    @Log(title = "film", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(filmService.deleteFilmByIds(ids));
    }
}
