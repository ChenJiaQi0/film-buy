package top.chen.common.result;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author ChenQi
 * @date 2023/11/5
 * @description: 统一返回结果
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Result<T> {
    private int code = 200;
    private String msg = "成功";
    private T data;
}
