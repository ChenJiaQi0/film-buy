package com.ruoyi.fb.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.fb.mapper.UserMapper;
import com.ruoyi.fb.domain.User;
import com.ruoyi.fb.service.IUserService;

/**
 * userService业务层处理
 * 
 * @author chen
 * @date 2023-11-11
 */
@Service
public class UserServiceImpl implements IUserService 
{
    @Autowired
    private UserMapper userMapper;

    /**
     * 查询user
     * 
     * @param id user主键
     * @return user
     */
    @Override
    public User selectUserById(Long id)
    {
        return userMapper.selectUserById(id);
    }

    /**
     * 查询user列表
     * 
     * @param user user
     * @return user
     */
    @Override
    public List<User> selectUserList(User user)
    {
        return userMapper.selectUserList(user);
    }

    /**
     * 新增user
     * 
     * @param user user
     * @return 结果
     */
    @Override
    public int insertUser(User user)
    {
        user.setCreateTime(DateUtils.getNowDate());
        return userMapper.insertUser(user);
    }

    /**
     * 修改user
     * 
     * @param user user
     * @return 结果
     */
    @Override
    public int updateUser(User user)
    {
        user.setUpdateTime(DateUtils.getNowDate());
        return userMapper.updateUser(user);
    }

    /**
     * 批量删除user
     * 
     * @param ids 需要删除的user主键
     * @return 结果
     */
    @Override
    public int deleteUserByIds(Long[] ids)
    {
        return userMapper.deleteUserByIds(ids);
    }

    /**
     * 删除user信息
     * 
     * @param id user主键
     * @return 结果
     */
    @Override
    public int deleteUserById(Long id)
    {
        return userMapper.deleteUserById(id);
    }
}
