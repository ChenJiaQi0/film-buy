package com.ruoyi.fb.mapper;

import java.util.List;
import com.ruoyi.fb.domain.User;

/**
 * userMapper接口
 * 
 * @author chen
 * @date 2023-11-11
 */
public interface UserMapper 
{
    /**
     * 查询user
     * 
     * @param id user主键
     * @return user
     */
    public User selectUserById(Long id);

    /**
     * 查询user列表
     * 
     * @param user user
     * @return user集合
     */
    public List<User> selectUserList(User user);

    /**
     * 新增user
     * 
     * @param user user
     * @return 结果
     */
    public int insertUser(User user);

    /**
     * 修改user
     * 
     * @param user user
     * @return 结果
     */
    public int updateUser(User user);

    /**
     * 删除user
     * 
     * @param id user主键
     * @return 结果
     */
    public int deleteUserById(Long id);

    /**
     * 批量删除user
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteUserByIds(Long[] ids);
}
