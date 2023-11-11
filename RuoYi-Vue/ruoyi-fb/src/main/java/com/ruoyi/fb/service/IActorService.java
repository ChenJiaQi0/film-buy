package com.ruoyi.fb.service;

import java.util.List;
import com.ruoyi.fb.domain.Actor;

/**
 * actorService接口
 * 
 * @author chen
 * @date 2023-11-11
 */
public interface IActorService 
{
    /**
     * 查询actor
     * 
     * @param id actor主键
     * @return actor
     */
    public Actor selectActorById(Long id);

    /**
     * 查询actor列表
     * 
     * @param actor actor
     * @return actor集合
     */
    public List<Actor> selectActorList(Actor actor);

    /**
     * 新增actor
     * 
     * @param actor actor
     * @return 结果
     */
    public int insertActor(Actor actor);

    /**
     * 修改actor
     * 
     * @param actor actor
     * @return 结果
     */
    public int updateActor(Actor actor);

    /**
     * 批量删除actor
     * 
     * @param ids 需要删除的actor主键集合
     * @return 结果
     */
    public int deleteActorByIds(Long[] ids);

    /**
     * 删除actor信息
     * 
     * @param id actor主键
     * @return 结果
     */
    public int deleteActorById(Long id);
}
