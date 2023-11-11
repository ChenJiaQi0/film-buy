package top.chen.user.controller;


import jakarta.annotation.Resource;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.*;
import org.apache.commons.lang3.RandomStringUtils;
import top.chen.common.exception.ServiceException;
import top.chen.common.result.Result;
import top.chen.common.util.RedisUtil;
import top.chen.user.domain.entity.User;
import top.chen.user.domain.entity.UserLoginResp;
import top.chen.user.domain.entity.vo.LoginVO;
import top.chen.user.service.UserService;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author chen
 * @since 2023-11-05
 */
@RestController
@RequestMapping("/user")
@Slf4j
public class UserController {
    @Resource
    private RedisUtil redisUtil;
    @Resource
    private JavaMailSender javaMailSender;
    @Resource
    private UserService userService;

    /**
     * 登录并返回token和用户信息
     * @param user
     * @return
     */
    @PostMapping("/login")
    public Result<UserLoginResp> login(@RequestBody LoginVO user) {
        log.info("登录信息：" + user);

        UserLoginResp userLoginResp = userService.login(user);
        Result<UserLoginResp> resp = new Result<>();
        resp.setData(userLoginResp);
        return resp;
    }

    /**
     * 发送验证码
     * @param username
     * @return
     */
    @GetMapping("/code")
    public Result sendCode(@RequestParam String username) {
        log.info("邮箱号：" + username);

        // 判断验证码是否过期
        if (redisUtil.get("code:" + username) != null) {
            throw new ServiceException("验证码未过期不能重复发送");
        }

        // 生成四位随机验证码并发送邮箱
        String code = RandomStringUtils.randomNumeric(4);
        redisUtil.set("code:" + username, code);
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom("1090060206@qq.com");
        mailMessage.setTo(username);
        mailMessage.setSubject("FILMBUY验证码");
        mailMessage.setText("尊敬的用户您好：感谢注册成为FILMBUY的用户，您的验证码是：" + code + ",有效时间三分钟，请勿重复发送。");
        javaMailSender.send(mailMessage);


        return Result.ok();
    }

}

