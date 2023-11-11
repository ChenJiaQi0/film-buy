package com.ruoyi.fb.mapper;

import java.util.List;
import com.ruoyi.fb.domain.Film;

/**
 * filmMapper接口
 * 
 * @author chen
 * @date 2023-11-11
 */
public interface FilmMapper 
{
    /**
     * 查询film
     * 
     * @param id film主键
     * @return film
     */
    public Film selectFilmById(Long id);

    /**
     * 查询film列表
     * 
     * @param film film
     * @return film集合
     */
    public List<Film> selectFilmList(Film film);

    /**
     * 新增film
     * 
     * @param film film
     * @return 结果
     */
    public int insertFilm(Film film);

    /**
     * 修改film
     * 
     * @param film film
     * @return 结果
     */
    public int updateFilm(Film film);

    /**
     * 删除film
     * 
     * @param id film主键
     * @return 结果
     */
    public int deleteFilmById(Long id);

    /**
     * 批量删除film
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFilmByIds(Long[] ids);
}
