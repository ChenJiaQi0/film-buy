package top.chen.cinema.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import top.chen.cinema.domain.entity.Cinema;
import top.chen.cinema.mapper.CinemaMapper;
import top.chen.cinema.service.CinemaService;

/**
 * @author ChenQi
 * @date 2023/11/12
 * @description: CinemaServiceImpl
 */
@Service
public class CinemaServiceImpl extends ServiceImpl<CinemaMapper, Cinema> implements CinemaService {
}
