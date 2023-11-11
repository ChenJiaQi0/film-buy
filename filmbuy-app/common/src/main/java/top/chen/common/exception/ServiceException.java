package top.chen.common.exception;

/**
 * @author ChenQi
 * @date 2023/11/5
 * @description: ServiceException 自定义服务异常
 */
public class ServiceException extends RuntimeException{
    public ServiceException(String message) {
        super(message);
    }
}
