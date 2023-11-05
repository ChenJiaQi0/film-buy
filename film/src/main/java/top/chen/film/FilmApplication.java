package top.chen.film;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

/**
 * @author ChenQi
 * @date 2023/11/5
 * @description: FilmApplication 影片管理微服务模块
 */
@SpringBootApplication
@ComponentScan("top.chen")
@Slf4j
@MapperScan("top.chen.film.mapper")
public class FilmApplication {
    public static void main(String[] args) {
        SpringApplication.run(FilmApplication.class, args);
    }
}
