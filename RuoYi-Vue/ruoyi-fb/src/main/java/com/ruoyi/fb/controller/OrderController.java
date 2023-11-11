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
import com.ruoyi.fb.domain.Order;
import com.ruoyi.fb.service.IOrderService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * orderController
 * 
 * @author chen
 * @date 2023-11-11
 */
@RestController
@RequestMapping("/order/order")
public class OrderController extends BaseController
{
    @Autowired
    private IOrderService orderService;

    /**
     * 查询order列表
     */
    @PreAuthorize("@ss.hasPermi('order:order:list')")
    @GetMapping("/list")
    public TableDataInfo list(Order order)
    {
        startPage();
        List<Order> list = orderService.selectOrderList(order);
        return getDataTable(list);
    }

    /**
     * 导出order列表
     */
    @PreAuthorize("@ss.hasPermi('order:order:export')")
    @Log(title = "order", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Order order)
    {
        List<Order> list = orderService.selectOrderList(order);
        ExcelUtil<Order> util = new ExcelUtil<Order>(Order.class);
        util.exportExcel(response, list, "order数据");
    }

    /**
     * 获取order详细信息
     */
    @PreAuthorize("@ss.hasPermi('order:order:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(orderService.selectOrderById(id));
    }

    /**
     * 新增order
     */
    @PreAuthorize("@ss.hasPermi('order:order:add')")
    @Log(title = "order", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Order order)
    {
        return toAjax(orderService.insertOrder(order));
    }

    /**
     * 修改order
     */
    @PreAuthorize("@ss.hasPermi('order:order:edit')")
    @Log(title = "order", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Order order)
    {
        return toAjax(orderService.updateOrder(order));
    }

    /**
     * 删除order
     */
    @PreAuthorize("@ss.hasPermi('order:order:remove')")
    @Log(title = "order", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(orderService.deleteOrderByIds(ids));
    }
}
