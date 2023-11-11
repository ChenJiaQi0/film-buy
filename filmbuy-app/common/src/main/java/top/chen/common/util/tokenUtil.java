package top.chen.common.util;

import cn.hutool.json.JSONObject;
import lombok.extern.slf4j.Slf4j;

/**
 * @author ChenQi
 * @date 2023/11/5
 * @description: 封装处理token的工具类
 */
@Slf4j
public class tokenUtil {
    /**
     * 封装一个从 token 中提取 userId 的方法
     * @param token
     * @return
     */
    public static Integer getUserIdFromToken(String token) {
        log.info("token" + token);
        Integer userId = 0;
        String noToken = "no-token";
        if (!noToken.equals(token)) {
            JSONObject jsonObject = JwtUtil.getJSONObject(token);
            log.info("解析到 token 的 json 数据为：{}", jsonObject);
            userId = Integer.parseInt(jsonObject.get("id").toString());
        } else {
            log.info("没有 token");
        }
        return userId;
    }
}
