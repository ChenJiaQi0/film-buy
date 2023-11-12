package top.chen.cinema.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import top.chen.cinema.domain.entity.Showtime;
import top.chen.cinema.mapper.ShowtimeMapper;
import top.chen.cinema.service.ShowTimeService;

/**
 * @author ChenQi
 * @date 2023/11/12
 * @description: ShowTimeServiceImpl
 */
@Service
public class ShowTimeServiceImpl extends ServiceImpl<ShowtimeMapper, Showtime> implements ShowTimeService {
}
