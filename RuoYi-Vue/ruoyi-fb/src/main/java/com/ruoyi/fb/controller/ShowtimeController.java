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
import com.ruoyi.fb.domain.Showtime;
import com.ruoyi.fb.service.IShowtimeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * showtimeController
 * 
 * @author chen
 * @date 2023-11-11
 */
@RestController
@RequestMapping("/showtime/showtime")
public class ShowtimeController extends BaseController
{
    @Autowired
    private IShowtimeService showtimeService;

    /**
     * 查询showtime列表
     */
    @PreAuthorize("@ss.hasPermi('showtime:showtime:list')")
    @GetMapping("/list")
    public TableDataInfo list(Showtime showtime)
    {
        startPage();
        List<Showtime> list = showtimeService.selectShowtimeList(showtime);
        return getDataTable(list);
    }

    /**
     * 导出showtime列表
     */
    @PreAuthorize("@ss.hasPermi('showtime:showtime:export')")
    @Log(title = "showtime", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Showtime showtime)
    {
        List<Showtime> list = showtimeService.selectShowtimeList(showtime);
        ExcelUtil<Showtime> util = new ExcelUtil<Showtime>(Showtime.class);
        util.exportExcel(response, list, "showtime数据");
    }

    /**
     * 获取showtime详细信息
     */
    @PreAuthorize("@ss.hasPermi('showtime:showtime:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(showtimeService.selectShowtimeById(id));
    }

    /**
     * 新增showtime
     */
    @PreAuthorize("@ss.hasPermi('showtime:showtime:add')")
    @Log(title = "showtime", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Showtime showtime)
    {
        return toAjax(showtimeService.insertShowtime(showtime));
    }

    /**
     * 修改showtime
     */
    @PreAuthorize("@ss.hasPermi('showtime:showtime:edit')")
    @Log(title = "showtime", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Showtime showtime)
    {
        return toAjax(showtimeService.updateShowtime(showtime));
    }

    /**
     * 删除showtime
     */
    @PreAuthorize("@ss.hasPermi('showtime:showtime:remove')")
    @Log(title = "showtime", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(showtimeService.deleteShowtimeByIds(ids));
    }
}
