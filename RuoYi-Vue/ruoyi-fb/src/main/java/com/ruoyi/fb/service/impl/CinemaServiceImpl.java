package com.ruoyi.fb.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.fb.mapper.CinemaMapper;
import com.ruoyi.fb.domain.Cinema;
import com.ruoyi.fb.service.ICinemaService;

/**
 * cinemaService业务层处理
 * 
 * @author chen
 * @date 2023-11-11
 */
@Service
public class CinemaServiceImpl implements ICinemaService 
{
    @Autowired
    private CinemaMapper cinemaMapper;

    /**
     * 查询cinema
     * 
     * @param id cinema主键
     * @return cinema
     */
    @Override
    public Cinema selectCinemaById(Long id)
    {
        return cinemaMapper.selectCinemaById(id);
    }

    /**
     * 查询cinema列表
     * 
     * @param cinema cinema
     * @return cinema
     */
    @Override
    public List<Cinema> selectCinemaList(Cinema cinema)
    {
        return cinemaMapper.selectCinemaList(cinema);
    }

    /**
     * 新增cinema
     * 
     * @param cinema cinema
     * @return 结果
     */
    @Override
    public int insertCinema(Cinema cinema)
    {
        cinema.setCreateTime(DateUtils.getNowDate());
        return cinemaMapper.insertCinema(cinema);
    }

    /**
     * 修改cinema
     * 
     * @param cinema cinema
     * @return 结果
     */
    @Override
    public int updateCinema(Cinema cinema)
    {
        cinema.setUpdateTime(DateUtils.getNowDate());
        return cinemaMapper.updateCinema(cinema);
    }

    /**
     * 批量删除cinema
     * 
     * @param ids 需要删除的cinema主键
     * @return 结果
     */
    @Override
    public int deleteCinemaByIds(Long[] ids)
    {
        return cinemaMapper.deleteCinemaByIds(ids);
    }

    /**
     * 删除cinema信息
     * 
     * @param id cinema主键
     * @return 结果
     */
    @Override
    public int deleteCinemaById(Long id)
    {
        return cinemaMapper.deleteCinemaById(id);
    }
}
