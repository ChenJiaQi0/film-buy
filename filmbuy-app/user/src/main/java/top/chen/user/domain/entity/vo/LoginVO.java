package top.chen.user.domain.entity.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author ChenQi
 * @date 2023/11/11
 * @description: LoginVO 登录注册
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LoginVO implements Serializable {
    private static final long serialVersionUID=1L;
    /**
     * 用户名邮箱号
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 验证码
     */
    private String code;

}
