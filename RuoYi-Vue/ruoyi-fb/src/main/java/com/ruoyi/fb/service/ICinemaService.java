package com.ruoyi.fb.service;

import java.util.List;
import com.ruoyi.fb.domain.Cinema;

/**
 * cinemaService接口
 * 
 * @author chen
 * @date 2023-11-11
 */
public interface ICinemaService 
{
    /**
     * 查询cinema
     * 
     * @param id cinema主键
     * @return cinema
     */
    public Cinema selectCinemaById(Long id);

    /**
     * 查询cinema列表
     * 
     * @param cinema cinema
     * @return cinema集合
     */
    public List<Cinema> selectCinemaList(Cinema cinema);

    /**
     * 新增cinema
     * 
     * @param cinema cinema
     * @return 结果
     */
    public int insertCinema(Cinema cinema);

    /**
     * 修改cinema
     * 
     * @param cinema cinema
     * @return 结果
     */
    public int updateCinema(Cinema cinema);

    /**
     * 批量删除cinema
     * 
     * @param ids 需要删除的cinema主键集合
     * @return 结果
     */
    public int deleteCinemaByIds(Long[] ids);

    /**
     * 删除cinema信息
     * 
     * @param id cinema主键
     * @return 结果
     */
    public int deleteCinemaById(Long id);
}
