package top.chen.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import top.chen.cinema.domain.entity.Showtime;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author ChenQi
 * @date 2023/11/12
 * @description: ShowTimeService
 */
public interface ShowTimeService extends IService<Showtime> {
    Map<String, ArrayList<Showtime>> getShowTimeList(String cid, String fid);
}
