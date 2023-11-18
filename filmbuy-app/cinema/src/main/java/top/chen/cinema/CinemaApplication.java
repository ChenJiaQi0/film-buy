package top.chen.cinema;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

/**
 * @author ChenQi
 * @date 2023/11/5
 * @description: CinemaApplication 影院管理微服务模块
 */
@SpringBootApplication
@ComponentScan("top.chen")
@Slf4j
@MapperScan("top.chen.cinema.mapper")
@EnableFeignClients(basePackages = "top.chen")
public class CinemaApplication {
    public static void main(String[] args) {
        SpringApplication.run(CinemaApplication.class, args);
    }
}
