package com.javaclimb.houserent.controller.backend;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.enums.OrderStatusEnum;
import com.javaclimb.houserent.common.util.PageUtil;
import com.javaclimb.houserent.entity.Order;
import com.javaclimb.houserent.service.HouseService;
import com.javaclimb.houserent.service.OrderService;
import com.javaclimb.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 我的家 控制器
 */
@Controller("backHomeController")
public class HomeController extends BaseController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private HouseService houseService;

    @Autowired
    private UserService userService;

    /**
     * 租客的房子信息列表，我的家
     */
    @RequestMapping("/admin/home")
    public String home(@RequestParam(value = "page",defaultValue = "1")Long pageNumber, @RequestParam(value = "size",defaultValue = "6")Long pageSize, Model model){
        Page page = PageUtil.initMpPage(pageNumber,pageSize);
        Order condition = new Order();
        condition.setCustomerUserId(getLoginUserId());
        condition.setStatus(OrderStatusEnum.NORMAL.getValue());
        QueryWrapper<Order> queryWrapper = new QueryWrapper<>();
        if(condition!=null&&condition.getCustomerUserId()!=null){
            queryWrapper.eq("customer_user_id",condition.getCustomerUserId());
        }
        Page<Order> orderPage = (Page<Order>) orderService.getRepository().selectPage(page,queryWrapper);
        for(Order order:orderPage.getRecords()){
            // todo 这个地方性能可以优化
            order.setHouse(houseService.get(order.getHouseId()));           // -todo 优化方案  id in ( '1','2','3')
            order.setOwnerUser(userService.get(order.getOwnerUserId()));
        }
        model.addAttribute("pageInfo",orderPage);
        model.addAttribute("tab","home");
        model.addAttribute("pagePrefix","/admin/home?");
        return "admin/my-home";
    }
}
