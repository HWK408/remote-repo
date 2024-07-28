package com.javaclimb.houserent.controller.backend;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.dto.JsonResult;
import com.javaclimb.houserent.common.enums.HouseStatusEnum;
import com.javaclimb.houserent.common.enums.OrderStatusEnum;
import com.javaclimb.houserent.common.util.DateUtil;
import com.javaclimb.houserent.common.util.PageUtil;
import com.javaclimb.houserent.entity.House;
import com.javaclimb.houserent.entity.Order;
import com.javaclimb.houserent.service.HouseService;
import com.javaclimb.houserent.service.OrderService;
import com.javaclimb.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.Objects;

/**
 * 后端订单控制器
 */
@Controller("backendOrderController")
@RequestMapping("/admin/order")
public class OrderController extends BaseController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private HouseService houseService;
    @Autowired
    private UserService userService;
    /**
     * 订单列表
     */
    @RequestMapping("")
    public String allOrder(@RequestParam(value = "page",defaultValue = "1")Long pageNumber, @RequestParam(value = "size",defaultValue = "6")Long pageSize, Model model){
        Page page = PageUtil.initMpPage(pageNumber,pageSize);
        Order condition = new Order();
        //如果登录用户是租客，查询该租客的订单
        if(loginUserIsCustomer()){
            condition.setCustomerUserId(getLoginUserId());
        }
        //如果登录用户是房东，查询该房东的订单
        if(loginUserIsOwner()){
            condition.setOwnerUserId(getLoginUserId());
        }
        //如果登录用户是管理员，查询所有订单
        QueryWrapper<Order> queryWrapper = new QueryWrapper<>();
        if(condition!=null&&condition.getCustomerUserId()!=null){
            queryWrapper.eq("customer_user_id",condition.getCustomerUserId());
        }
        Page<Order> orderPage = (Page<Order>) orderService.getRepository().selectPage(page,queryWrapper);
        for(Order order:orderPage.getRecords()){
            order.setHouse(houseService.get(order.getHouseId()));
            order.setOwnerUser(userService.get(order.getOwnerUserId()));
            order.setCustomerUser(userService.get(order.getCustomerUserId()));
        }
        model.addAttribute("pageInfo",orderPage);
        model.addAttribute("tab","order-list");
        model.addAttribute("pagePrefix","/admin/order?");
        return "admin/order-list";
    }
    /**
     * 取消订单
     */
    @RequestMapping(value = "/cancel",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult cancelOrder(@RequestParam("orderId")Long orderId){
        //校验订单是否存在
        Order order = orderService.get(orderId);
        if(order == null){
            return JsonResult.error("订单不存在");
        }
        //登录用户不是管理员，也不是该订单的租客、房东，就不能取消订单
        if(!loginUserIsAdmin()&&!Objects.equals(getLoginUserId(),order.getCustomerUserId())&&!Objects.equals(getLoginUserId(),order.getOwnerUserId())){
            return JsonResult.error("没有权限");
        }
        order.setStatus(OrderStatusEnum.CUSTOMER_CANCEL.getValue());
        orderService.update(order);
        return JsonResult.success("取消成功");
    }
    /**
     * 申请退租
     */
    @RequestMapping(value = "/end",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult endOrder(@RequestParam("orderId")Long orderId){
        //校验订单是否存在
        Order order = orderService.get(orderId);
        if(order == null){
            return JsonResult.error("订单不存在");
        }
        //登录用户不是管理员，也不是该订单的租客、房东，就不能取消订单
        if(!loginUserIsAdmin()&&!Objects.equals(getLoginUserId(),order.getCustomerUserId())&&!Objects.equals(getLoginUserId(),order.getOwnerUserId())){
            return JsonResult.error("没有权限");
        }
        order.setStatus(OrderStatusEnum.END_APPLY.getValue());
        orderService.update(order);
        return JsonResult.success("退租已申请，请联系房东审核");
    }

    /**
     * 退租申请通过
     */
    @RequestMapping(value = "/endPass",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult endOrderPass(@RequestParam("orderId")Long orderId){
        //校验订单是否存在
        Order order = orderService.get(orderId);
        if(order == null){
            return JsonResult.error("订单不存在");
        }
        //登录用户不是管理员，也不是该订单的房东，就不能取消订单
        if(!loginUserIsAdmin()&&!Objects.equals(getLoginUserId(),order.getOwnerUserId())){
            return JsonResult.error("没有权限");
        }
        order.setStatus(OrderStatusEnum.FINISH.getValue());
        Date date = new Date();
        int dayNum = DateUtil.daysBetween(order.getStartDate(),date);
        order.setDayNum(dayNum);
        order.setTotalAmount(order.getMonthRent()/30*dayNum);
        order.setEndDate(date);
        orderService.update(order);

        //房子状态重置为未租出
        House house = houseService.get(order.getHouseId());
        if(house!=null&&Objects.equals(house.getStatus(), HouseStatusEnum.HAS_RENT.getValue())){
            house.setStatus(HouseStatusEnum.NOT_RENT.getValue());
            house.setLastOrderEndTime(date);
            houseService.update(house);
        }
        return JsonResult.success("退租成功");
    }

    /**
     * 退租申请拒绝
     */
    @RequestMapping(value = "/endReject",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult endOrderReject(@RequestParam("orderId")Long orderId){
        //校验订单是否存在
        Order order = orderService.get(orderId);
        if(order == null){
            return JsonResult.error("订单不存在");
        }
        //登录用户不是管理员，也不是该订单的房东，就不能取消订单
        if(!loginUserIsAdmin()&&!Objects.equals(getLoginUserId(),order.getOwnerUserId())){
            return JsonResult.error("没有权限");
        }
        order.setStatus(OrderStatusEnum.END_APPLY_REJECT.getValue());
        orderService.update(order);
        return JsonResult.success("操作成功");
    }
}







