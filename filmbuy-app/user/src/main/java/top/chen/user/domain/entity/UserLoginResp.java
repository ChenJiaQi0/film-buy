package top.chen.user.domain.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author ChenQi
 * @date 2023/11/11
 * @description: UserLoginResp 登录注册
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserLoginResp {
    private User user;
    private String token;
}
