package com.javaclimb.houserent.common.schedule;

import com.javaclimb.houserent.common.enums.HouseStatusEnum;
import com.javaclimb.houserent.common.enums.OrderStatusEnum;
import com.javaclimb.houserent.entity.House;
import com.javaclimb.houserent.entity.Order;
import com.javaclimb.houserent.service.HouseService;
import com.javaclimb.houserent.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 每分钟定时扫描正在租赁中的房子，如果到了时间，结束它
 */
@Component
public class TimerTask {

    @Autowired
    private OrderService orderService;

    @Autowired
    private HouseService houseService;

    /**
     * 每分钟执行一次
     */
    @Scheduled(cron = "0 */1 * * * ?")
    public void endOrderTimer(){
        List<Order> list = orderService.findOverDueOrderList();
        if(list == null || list.size() == 0){
            return;
        }
        for(Order order:list){
            //更新订单状态为已到期
            order.setStatus(OrderStatusEnum.FINISH.getValue());
            orderService.update(order);
            //更新房子状态为未租出
            House house = houseService.get(order.getHouseId());
            if(house!=null){
                house.setStatus(HouseStatusEnum.NOT_RENT.getValue());
                houseService.update(house);
            }
        }
    }
}
