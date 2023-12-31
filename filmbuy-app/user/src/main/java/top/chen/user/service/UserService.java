package top.chen.user.service;

import top.chen.user.domain.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;
import top.chen.user.domain.entity.UserLoginResp;
import top.chen.user.domain.entity.vo.LoginVO;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author chen
 * @since 2023-11-05
 */
public interface UserService extends IService<User> {

    /**
     * 登录并返回token和用户信息
     * @param user
     * @return
     */
    UserLoginResp login(LoginVO user);

    /**
     * 充值
     * @param userId
     * @return
     */
    Integer topUp(String userId, Integer balance);

    void minusBalance(Long id, Integer price);

    void rePwd(LoginVO user);
}
