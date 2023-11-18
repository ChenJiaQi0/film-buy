package top.chen.cinema.fegin;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * @author ChenQi
 * @date 2023/11/18
 * @description: FilmService
 */
@FeignClient(value = "film", path = "/film", url = "http://localhost:8002")
public interface FilmService {
    @GetMapping("/getSimpleFilm/{id}")
    Film getSimpleFilm(@PathVariable String id);
}
