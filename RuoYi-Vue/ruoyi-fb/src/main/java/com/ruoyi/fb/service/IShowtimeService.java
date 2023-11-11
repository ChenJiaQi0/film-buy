package com.ruoyi.fb.service;

import java.util.List;
import com.ruoyi.fb.domain.Showtime;

/**
 * showtimeService接口
 * 
 * @author chen
 * @date 2023-11-11
 */
public interface IShowtimeService 
{
    /**
     * 查询showtime
     * 
     * @param id showtime主键
     * @return showtime
     */
    public Showtime selectShowtimeById(Long id);

    /**
     * 查询showtime列表
     * 
     * @param showtime showtime
     * @return showtime集合
     */
    public List<Showtime> selectShowtimeList(Showtime showtime);

    /**
     * 新增showtime
     * 
     * @param showtime showtime
     * @return 结果
     */
    public int insertShowtime(Showtime showtime);

    /**
     * 修改showtime
     * 
     * @param showtime showtime
     * @return 结果
     */
    public int updateShowtime(Showtime showtime);

    /**
     * 批量删除showtime
     * 
     * @param ids 需要删除的showtime主键集合
     * @return 结果
     */
    public int deleteShowtimeByIds(Long[] ids);

    /**
     * 删除showtime信息
     * 
     * @param id showtime主键
     * @return 结果
     */
    public int deleteShowtimeById(Long id);
}
