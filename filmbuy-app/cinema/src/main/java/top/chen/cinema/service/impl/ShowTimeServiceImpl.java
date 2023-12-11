package top.chen.cinema.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import top.chen.cinema.domain.entity.Showtime;
import top.chen.cinema.mapper.ShowtimeMapper;
import top.chen.cinema.service.ShowTimeService;

import java.time.LocalDateTime;
import java.util.*;

/**
 * @author ChenQi
 * @date 2023/11/12
 * @description: ShowTimeServiceImpl
 */
@Service
@Slf4j
public class ShowTimeServiceImpl extends ServiceImpl<ShowtimeMapper, Showtime> implements ShowTimeService {
    /**
     * 根据影院影片显示场次
     * @param cid
     * @param fid
     * @return
     */
    @Override
    public Map<String, ArrayList<Showtime>> getShowTimeList(String cid, String fid) {
        LambdaQueryWrapper<Showtime> wp = new LambdaQueryWrapper<>();
        wp.eq(Showtime::getCinemaId, cid).eq(Showtime::getFilmId, fid).ge(Showtime::getDate, LocalDateTime.now()).orderByAsc(Showtime::getDate);
        List<Showtime> lists = baseMapper.selectList(wp);
        log.info("查询的场次：" + lists);

        Map<String, ArrayList<Showtime>> map = new HashMap<>();
        for (Showtime show : lists) {
            String time = show.getDate().getYear() + "-" + show.getDate().getMonth().getValue() + "-" + show.getDate().getDayOfMonth();
//            String time = show.getDate().getYear() + "-" + show.getDate().getMonth() + "-" + show.getDate().getDay();

           if (map.containsKey(time)) {
               List<Showtime> list = map.get(time);
//               log.info("添加进去的list：" + list);
               list.add(show);
           } else {
               ArrayList<Showtime> showtimes = new ArrayList<>();
               showtimes.add(show);
               map.put(time, showtimes);
//               log.info("现在的map：" + map.toString());
           }
        }

        log.info("场次信息：" + map.toString());
        return map;
    }
}
