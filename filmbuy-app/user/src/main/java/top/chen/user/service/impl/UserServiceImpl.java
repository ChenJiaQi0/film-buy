package top.chen.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import jakarta.annotation.Resource;
import top.chen.common.exception.ServiceException;
import top.chen.common.util.JwtUtil;
import top.chen.common.util.RedisUtil;
import top.chen.user.domain.entity.User;
import top.chen.user.domain.entity.UserLoginResp;
import top.chen.user.domain.entity.vo.LoginVO;
import top.chen.user.mapper.UserMapper;
import top.chen.user.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author chen
 * @since 2023-11-05
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Resource
    private RedisUtil redisUtil;
    @Resource
    private UserMapper userMapper;

    /**
     * 登录并返回token
     * @param user
     * @return
     */
    @Override
    public UserLoginResp login(LoginVO user) {
        User dbUser = userMapper.selectOne(new QueryWrapper<User>().lambda().eq(User::getUsername, user.getUsername()));

        //验证码登录
        if (user.getCode() != null){
            // 判断验证码是否正确
            String redisCode = (String) redisUtil.get("code:" + user.getUsername());
            // 判断验证码是否失效
            if (redisCode == null) {
                throw new ServiceException("验证码失效");
            }
            if (!user.getCode().equals(redisCode)) {
                throw new ServiceException("验证码不正确");
            }

            // user第一次登录进行注册
            if (dbUser == null) {
                // 注册
                userMapper.insert(User.builder()
                        .username(user.getUsername())
                        .password("123456")
                        .balance(0)
                        .build());
            }
        } else {
            // 判断是有这个账号
            if (dbUser == null) {
                throw new ServiceException("查无此账号");
            }

            // 判断密码是否正确
            if (!user.getPassword().equals(dbUser.getPassword())) {
                throw new ServiceException("密码错误请重新输入");
            }
        }
        UserLoginResp resp = UserLoginResp.builder().user(dbUser).build();
        // 生成对应token
        String token = JwtUtil.createToken(dbUser.getId(), dbUser.getUsername());
        resp.setToken(token);
        return resp;
    }

    @Override
    public Integer topUp(String userId) {
        User user = userMapper.selectById(userId);
        user.setBalance(user.getBalance() + 50);
        return userMapper.updateById(user);
    }
}
