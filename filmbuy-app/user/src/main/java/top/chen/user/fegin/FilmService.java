package top.chen.user.fegin;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

/**
 * @author ChenQi
 * @date 2023/12/19
 * @description: FilmService
 */
@FeignClient(value = "film", path = "/film")
public interface FilmService {
    @PostMapping("/snum/{filmId}")
    Film updateSnum(@PathVariable String filmId);
}
