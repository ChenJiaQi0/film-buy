package com.ruoyi.fb.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.fb.mapper.FilmMapper;
import com.ruoyi.fb.domain.Film;
import com.ruoyi.fb.service.IFilmService;

/**
 * filmService业务层处理
 * 
 * @author chen
 * @date 2023-11-11
 */
@Service
public class FilmServiceImpl implements IFilmService 
{
    @Autowired
    private FilmMapper filmMapper;

    /**
     * 查询film
     * 
     * @param id film主键
     * @return film
     */
    @Override
    public Film selectFilmById(Long id)
    {
        return filmMapper.selectFilmById(id);
    }

    /**
     * 查询film列表
     * 
     * @param film film
     * @return film
     */
    @Override
    public List<Film> selectFilmList(Film film)
    {
        return filmMapper.selectFilmList(film);
    }

    /**
     * 新增film
     * 
     * @param film film
     * @return 结果
     */
    @Override
    public int insertFilm(Film film)
    {
        film.setCreateTime(DateUtils.getNowDate());
        return filmMapper.insertFilm(film);
    }

    /**
     * 修改film
     * 
     * @param film film
     * @return 结果
     */
    @Override
    public int updateFilm(Film film)
    {
        film.setUpdateTime(DateUtils.getNowDate());
        return filmMapper.updateFilm(film);
    }

    /**
     * 批量删除film
     * 
     * @param ids 需要删除的film主键
     * @return 结果
     */
    @Override
    public int deleteFilmByIds(Long[] ids)
    {
        return filmMapper.deleteFilmByIds(ids);
    }

    /**
     * 删除film信息
     * 
     * @param id film主键
     * @return 结果
     */
    @Override
    public int deleteFilmById(Long id)
    {
        return filmMapper.deleteFilmById(id);
    }
}
