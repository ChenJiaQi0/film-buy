package top.chen.cinema.controller;


import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import top.chen.cinema.domain.entity.Showtime;
import top.chen.cinema.service.ShowTimeService;
import top.chen.common.result.Result;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author chen
 * @since 2023-11-05
 */
@RestController
@RequestMapping("/showtime")
public class ShowtimeController {
    @Resource
    private ShowTimeService showTimeService;

    /**
     * 根据影院影片显示场次
     * @param cid
     * @param fid
     * @return
     */
    @GetMapping("/{cid}/{fid}")
    public Result<Map<String, ArrayList<Showtime>>> getShowTimeList(@PathVariable("cid") String cid,
                                                  @PathVariable("fid") String fid){
        Map<String, ArrayList<Showtime>> map = showTimeService.getShowTimeList(cid, fid);
        Result<Map<String, ArrayList<Showtime>>> resp = new Result<>();
        resp.setData(map);
        return resp;
    }
}

