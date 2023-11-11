package com.ruoyi.fb.mapper;

import java.util.List;
import com.ruoyi.fb.domain.Order;

/**
 * orderMapper接口
 * 
 * @author chen
 * @date 2023-11-11
 */
public interface OrderMapper 
{
    /**
     * 查询order
     * 
     * @param id order主键
     * @return order
     */
    public Order selectOrderById(Long id);

    /**
     * 查询order列表
     * 
     * @param order order
     * @return order集合
     */
    public List<Order> selectOrderList(Order order);

    /**
     * 新增order
     * 
     * @param order order
     * @return 结果
     */
    public int insertOrder(Order order);

    /**
     * 修改order
     * 
     * @param order order
     * @return 结果
     */
    public int updateOrder(Order order);

    /**
     * 删除order
     * 
     * @param id order主键
     * @return 结果
     */
    public int deleteOrderById(Long id);

    /**
     * 批量删除order
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteOrderByIds(Long[] ids);
}
