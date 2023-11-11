package top.chen.film.service.impl;

import top.chen.film.domain.entity.Film;
import top.chen.film.mapper.FilmMapper;
import top.chen.film.service.FilmService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author chen
 * @since 2023-11-05
 */
@Service
public class FilmServiceImpl extends ServiceImpl<FilmMapper, Film> implements FilmService {

}
