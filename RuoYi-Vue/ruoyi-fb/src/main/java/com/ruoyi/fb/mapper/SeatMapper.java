package com.ruoyi.fb.mapper;

import java.util.List;
import com.ruoyi.fb.domain.Seat;

/**
 * seatMapper接口
 * 
 * @author chen
 * @date 2023-11-11
 */
public interface SeatMapper 
{
    /**
     * 查询seat
     * 
     * @param id seat主键
     * @return seat
     */
    public Seat selectSeatById(Long id);

    /**
     * 查询seat列表
     * 
     * @param seat seat
     * @return seat集合
     */
    public List<Seat> selectSeatList(Seat seat);

    /**
     * 新增seat
     * 
     * @param seat seat
     * @return 结果
     */
    public int insertSeat(Seat seat);

    /**
     * 修改seat
     * 
     * @param seat seat
     * @return 结果
     */
    public int updateSeat(Seat seat);

    /**
     * 删除seat
     * 
     * @param id seat主键
     * @return 结果
     */
    public int deleteSeatById(Long id);

    /**
     * 批量删除seat
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSeatByIds(Long[] ids);
}
