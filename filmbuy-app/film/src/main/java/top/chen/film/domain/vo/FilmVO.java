package top.chen.film.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import top.chen.film.domain.entity.Actor;
import top.chen.film.domain.entity.Film;

import java.util.List;

/**
 * @author ChenQi
 * @date 2023/11/18
 * @description: FilmVO
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FilmVO {
    private Film film;

    private List<Actor> actors;
}
