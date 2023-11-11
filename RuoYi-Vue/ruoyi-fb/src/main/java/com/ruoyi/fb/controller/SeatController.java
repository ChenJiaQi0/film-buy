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
import com.ruoyi.fb.domain.Seat;
import com.ruoyi.fb.service.ISeatService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * seatController
 * 
 * @author chen
 * @date 2023-11-11
 */
@RestController
@RequestMapping("/seat/seat")
public class SeatController extends BaseController
{
    @Autowired
    private ISeatService seatService;

    /**
     * 查询seat列表
     */
    @PreAuthorize("@ss.hasPermi('seat:seat:list')")
    @GetMapping("/list")
    public TableDataInfo list(Seat seat)
    {
        startPage();
        List<Seat> list = seatService.selectSeatList(seat);
        return getDataTable(list);
    }

    /**
     * 导出seat列表
     */
    @PreAuthorize("@ss.hasPermi('seat:seat:export')")
    @Log(title = "seat", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Seat seat)
    {
        List<Seat> list = seatService.selectSeatList(seat);
        ExcelUtil<Seat> util = new ExcelUtil<Seat>(Seat.class);
        util.exportExcel(response, list, "seat数据");
    }

    /**
     * 获取seat详细信息
     */
    @PreAuthorize("@ss.hasPermi('seat:seat:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(seatService.selectSeatById(id));
    }

    /**
     * 新增seat
     */
    @PreAuthorize("@ss.hasPermi('seat:seat:add')")
    @Log(title = "seat", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Seat seat)
    {
        return toAjax(seatService.insertSeat(seat));
    }

    /**
     * 修改seat
     */
    @PreAuthorize("@ss.hasPermi('seat:seat:edit')")
    @Log(title = "seat", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Seat seat)
    {
        return toAjax(seatService.updateSeat(seat));
    }

    /**
     * 删除seat
     */
    @PreAuthorize("@ss.hasPermi('seat:seat:remove')")
    @Log(title = "seat", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(seatService.deleteSeatByIds(ids));
    }
}
