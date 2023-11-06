package top.chen.common.handler;

import org.springframework.http.HttpStatus;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import top.chen.common.exception.ServiceException;
import top.chen.common.result.Result;

/**
 * @author ChenQi
 * @date 2023/11/5
 * @description: 全局异常处理
 */
@ControllerAdvice
public class GlobalExceptionHandler {
    /**
     * 业务异常统一处理
     * @param e
     * @return
     */
    @ExceptionHandler(value = ServiceException.class)
    @ResponseBody
    public Result<?> exceptionHandler(ServiceException e){
        Result<?> resp = new Result<>();
        resp.setCode(500);
        resp.setMsg(e.getMessage());
        return resp;
    }

    /**
     * 数据校验异常统一处理
     * @param e
     * @return
     */
    @ExceptionHandler(value = MethodArgumentNotValidException.class)
    @ResponseBody
    public Result<?> exceptionHandler(MethodArgumentNotValidException e){
        Result<?> resp = new Result<>();
        resp.setCode(Integer.parseInt(HttpStatus.BAD_REQUEST.toString()));
        resp.setMsg("请求参数错误");
        return resp;
    }

    /**
     * SpringMVC参数绑定，Validator校验不正确
     */
    @ExceptionHandler(BindException.class)
    public Result<String> bindException(BindException ex) {
        Result<String> resp = new Result<>();
        FieldError fieldError = ex.getFieldError();
        assert fieldError != null;
        resp.setCode(Integer.parseInt(HttpStatus.BAD_REQUEST.toString()));
        resp.setMsg(fieldError.getDefaultMessage());
        return resp;
    }
}
