package com.ruoyi.fb.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.fb.mapper.SeatMapper;
import com.ruoyi.fb.domain.Seat;
import com.ruoyi.fb.service.ISeatService;

import static com.alibaba.fastjson2.util.JdbcSupport.createTime;

/**
 * seatService业务层处理
 * 
 * @author chen
 * @date 2023-11-11
 */
@Service
public class SeatServiceImpl implements ISeatService 
{
    @Autowired
    private SeatMapper seatMapper;

    /**
     * 查询seat
     * 
     * @param id seat主键
     * @return seat
     */
    @Override
    public Seat selectSeatById(Long id)
    {
        return seatMapper.selectSeatById(id);
    }

    /**
     * 查询seat列表
     * 
     * @param seat seat
     * @return seat
     */
    @Override
    public List<Seat> selectSeatList(Seat seat)
    {
        return seatMapper.selectSeatList(seat);
    }

    /**
     * 新增seat
     * 
     * @param seat seat
     * @return 结果
     */
    @Override
    public int insertSeat(Seat seat)
    {
        seat.setCreateTime(DateUtils.getNowDate());
        return seatMapper.insertSeat(seat);
    }

    /**
     * 修改seat
     * 
     * @param seat seat
     * @return 结果
     */
    @Override
    public int updateSeat(Seat seat)
    {
        seat.setUpdateTime(DateUtils.getNowDate());
        return seatMapper.updateSeat(seat);
    }

    /**
     * 批量删除seat
     * 
     * @param ids 需要删除的seat主键
     * @return 结果
     */
    @Override
    public int deleteSeatByIds(Long[] ids)
    {
        return seatMapper.deleteSeatByIds(ids);
    }

    @Override
    public void generate(String id) {
        for (int i = 1; i < 9; i++) {
            for (int j = 1; j< 9; j++){
                Seat seat = Seat.builder()
                        .showtimeId(Long.valueOf(id))
                        .rn(i)
                        .cn(j)
                        .deleted(0L)
                        .build();
                seat.setCreateTime(DateUtils.getNowDate());
                seat.setUpdateTime(DateUtils.getNowDate());
                seatMapper.insertSeat(seat);
            }
        }
    }

    /**
     * 删除seat信息
     * 
     * @param id seat主键
     * @return 结果
     */
    @Override
    public int deleteSeatById(Long id)
    {
        return seatMapper.deleteSeatById(id);
    }
}
