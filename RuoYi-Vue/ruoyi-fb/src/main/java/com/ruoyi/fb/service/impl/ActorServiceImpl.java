package com.ruoyi.fb.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.fb.mapper.ActorMapper;
import com.ruoyi.fb.domain.Actor;
import com.ruoyi.fb.service.IActorService;

/**
 * actorService业务层处理
 * 
 * @author chen
 * @date 2023-11-11
 */
@Service
public class ActorServiceImpl implements IActorService 
{
    @Autowired
    private ActorMapper actorMapper;

    /**
     * 查询actor
     * 
     * @param id actor主键
     * @return actor
     */
    @Override
    public Actor selectActorById(Long id)
    {
        return actorMapper.selectActorById(id);
    }

    /**
     * 查询actor列表
     * 
     * @param actor actor
     * @return actor
     */
    @Override
    public List<Actor> selectActorList(Actor actor)
    {
        return actorMapper.selectActorList(actor);
    }

    /**
     * 新增actor
     * 
     * @param actor actor
     * @return 结果
     */
    @Override
    public int insertActor(Actor actor)
    {
        actor.setCreateTime(DateUtils.getNowDate());
        return actorMapper.insertActor(actor);
    }

    /**
     * 修改actor
     * 
     * @param actor actor
     * @return 结果
     */
    @Override
    public int updateActor(Actor actor)
    {
        actor.setUpdateTime(DateUtils.getNowDate());
        return actorMapper.updateActor(actor);
    }

    /**
     * 批量删除actor
     * 
     * @param ids 需要删除的actor主键
     * @return 结果
     */
    @Override
    public int deleteActorByIds(Long[] ids)
    {
        return actorMapper.deleteActorByIds(ids);
    }

    /**
     * 删除actor信息
     * 
     * @param id actor主键
     * @return 结果
     */
    @Override
    public int deleteActorById(Long id)
    {
        return actorMapper.deleteActorById(id);
    }
}
