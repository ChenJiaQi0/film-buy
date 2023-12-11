package top.chen.film.controller;


import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import top.chen.common.result.Result;
import top.chen.film.domain.entity.Actor;
import top.chen.film.service.ActorService;

import java.util.ArrayList;
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
@RequestMapping("/actor")
public class ActorController {
    @Resource
    private ActorService actorService;

    /**
     * 根据影片查询对应演员信息
     * @param ids
     * @return
     */
    @GetMapping
    public Result<List<Actor>> getActors(@RequestParam String ids){
        Result<List<Actor>> resp = new Result<List<Actor>>();
        List<Actor> list = new ArrayList<>();
        String[] idsArray = ids.split(",");
        for (String id : idsArray) {
            Actor actor = actorService.getById(id);
            list.add(actor);
        }
        resp.setData(list);
        return resp;
    }
}

