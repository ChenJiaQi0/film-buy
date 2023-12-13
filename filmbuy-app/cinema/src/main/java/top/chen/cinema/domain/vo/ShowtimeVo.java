package top.chen.cinema.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author ChenQi
 * @date 2023/12/13
 * @description: ShowtimeVo
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ShowtimeVo {
    private String time;
    private List list;
}
