package top.chen.user.fegin;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author ChenQi
 * @date 2023/11/12
 * @description: SeatService
 */
@FeignClient(value = "cinema", path = "/seat", url = "http://localhost:8001")
public interface SeatService {
    @GetMapping("/{id}")
    Seat getSeatById(@PathVariable String id);

    @GetMapping("/name/{id}")
    String getShowTimeNameById(@PathVariable String id);

    @GetMapping("/isOnSell")
    Boolean isOnSell(@RequestParam String seats);

    @PostMapping("/updateStatusBySeats")
    void updateStatusBySeats(@RequestParam String seats);
}
