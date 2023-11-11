package top.chen.common.util;

import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.json.JSONObject;
import cn.hutool.jwt.JWT;
import cn.hutool.jwt.JWTPayload;
import cn.hutool.jwt.JWTUtil;
import lombok.extern.slf4j.Slf4j;
import top.chen.common.exception.ServiceException;

import java.util.HashMap;
import java.util.Map;

/**
 * @author CJQ
 * @date 2023/11/5
 * @description JwtUtil 封装 hutool 的 JWT 工具
 **/
@Slf4j
public class JwtUtil {

    /**
     * 盐值很重要，不能泄漏，且每个项目都应该不一样，可以放到配置文件中
     */
    private static final String KEY = "ccen";

    public static String createToken(Long id, String username) {
        DateTime now = DateTime.now();
//        DateTime expTime = now.offsetNew(DateField.SECOND, 100000);
        DateTime expTime = now.offsetNew(DateField.HOUR, 48);
        Map<String, Object> payload = new HashMap<>();
        // 签发时间
        payload.put(JWTPayload.ISSUED_AT, now);
        // 过期时间
        payload.put(JWTPayload.EXPIRES_AT, expTime);
        // 生效时间
        payload.put(JWTPayload.NOT_BEFORE, now);
        // 内容
        payload.put("id", id);
        payload.put("username", username);
        String token = JWTUtil.createToken(payload, KEY.getBytes());
        log.info("生成 JWT token：{}", token);
        return token;
    }

    public static boolean validate(String token) {
        JWT jwt = JWTUtil.parseToken(token).setKey(KEY.getBytes());
        // validate包含了verify
        boolean validate = jwt.validate(0);
        log.info("JWT token 校验结果：{}", validate);
        return validate;
    }

    public static JSONObject getJSONObject(String token) {
        if (token == null) throw new ServiceException("没有请求参数token，请先登录");
        JWT jwt = JWTUtil.parseToken(token).setKey(KEY.getBytes());
        JSONObject payloads = jwt.getPayloads();
        payloads.remove(JWTPayload.ISSUED_AT);
        payloads.remove(JWTPayload.EXPIRES_AT);
        payloads.remove(JWTPayload.NOT_BEFORE);
        log.info("根据 token 获取原始内容：{}", payloads);
        return payloads;
    }

    public static void main(String[] args) {
        String token = createToken(1L, "3465976682@qq.com");
        System.out.println(token);
        try {
            Thread.sleep(12000);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        validate(token);
        getJSONObject(token);
    }
}