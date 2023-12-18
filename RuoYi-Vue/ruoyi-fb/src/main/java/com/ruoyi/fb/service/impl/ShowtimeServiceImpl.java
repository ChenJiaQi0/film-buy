package com.ruoyi.fb.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.fb.mapper.ShowtimeMapper;
import com.ruoyi.fb.domain.Showtime;
import com.ruoyi.fb.service.IShowtimeService;

/**
 * showtimeService业务层处理
 * 
 * @author chen
 * @date 2023-11-11
 */
@Service
public class ShowtimeServiceImpl implements IShowtimeService 
{
    @Autowired
    private ShowtimeMapper showtimeMapper;

    /**
     * 查询showtime
     * 
     * @param id showtime主键
     * @return showtime
     */
    @Override
    public Showtime selectShowtimeById(Long id)
    {
        return showtimeMapper.selectShowtimeById(id);
    }

    /**
     * 查询showtime列表
     * 
     * @param showtime showtime
     * @return showtime
     */
    @Override
    public List<Showtime> selectShowtimeList(Showtime showtime)
    {
        return showtimeMapper.selectShowtimeList(showtime);
    }

    /**
     * 新增showtime
     * 
     * @param showtime showtime
     * @return 结果
     */
    @Override
    public int insertShowtime(Showtime showtime)
    {
        showtime.setCreateTime(DateUtils.getNowDate());
        showtime.setUpdateTime(DateUtils.getNowDate());
        return showtimeMapper.insertShowtime(showtime);
    }

    /**
     * 修改showtime
     * 
     * @param showtime showtime
     * @return 结果
     */
    @Override
    public int updateShowtime(Showtime showtime)
    {
        showtime.setUpdateTime(DateUtils.getNowDate());
        return showtimeMapper.updateShowtime(showtime);
    }

    /**
     * 批量删除showtime
     * 
     * @param ids 需要删除的showtime主键
     * @return 结果
     */
    @Override
    public int deleteShowtimeByIds(Long[] ids)
    {
        return showtimeMapper.deleteShowtimeByIds(ids);
    }

    /**
     * 删除showtime信息
     * 
     * @param id showtime主键
     * @return 结果
     */
    @Override
    public int deleteShowtimeById(Long id)
    {
        return showtimeMapper.deleteShowtimeById(id);
    }
}
