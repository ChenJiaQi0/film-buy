package top.chen.user.fegin;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author ChenQi
 * @date 2023/12/19
 * @description: FilmService
 */
@FeignClient(value = "film", path = "/film")
public interface FilmService {
    @PostMapping("/sc/{filmId}/{sc}")
    void updateSc(@PathVariable String filmId, @PathVariable Double sc);

    @PostMapping("/snum/{filmId}")
    Film updateSnum(@PathVariable String filmId);
}
