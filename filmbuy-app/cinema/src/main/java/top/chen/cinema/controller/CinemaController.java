package top.chen.cinema.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import top.chen.cinema.domain.entity.Cinema;
import top.chen.cinema.service.CinemaService;
import top.chen.common.result.Result;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author chen
 * @since 2023-11-05
 */
@RestController
@RequestMapping("/cinema")
public class CinemaController {
    @Resource
    private CinemaService cinemaService;

    /**
     * 根据条件获取影院列表
     * @param province
     * @param city
     * @param area
     * @return
     */
    @GetMapping()
    public Result<List<Cinema>> list(@RequestParam(required = false) String province,
                                     @RequestParam(required = false) String city,
                                     @RequestParam(required = false) String area) {
        LambdaQueryWrapper<Cinema> wp = new LambdaQueryWrapper<>();
        Result<List<Cinema>> resp = new Result<>();
        if (province != null) wp.like(Cinema::getProvince, province);
        if (city != null) wp.like(Cinema::getCity, city);
        if (area != null) wp.like(Cinema::getArea, area);
        resp.setData(cinemaService.list(wp));
        return resp;
    }
}

