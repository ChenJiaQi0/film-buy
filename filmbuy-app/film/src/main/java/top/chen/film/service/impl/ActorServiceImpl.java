package top.chen.film.service.impl;

import top.chen.film.domain.entity.Actor;
import top.chen.film.mapper.ActorMapper;
import top.chen.film.service.ActorService;
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
public class ActorServiceImpl extends ServiceImpl<ActorMapper, Actor> implements ActorService {

}
