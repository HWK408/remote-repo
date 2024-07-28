package com.javaclimb.houserent.controller.front;

import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.constant.Constant;
import com.javaclimb.houserent.common.dto.JsonResult;
import com.javaclimb.houserent.common.enums.HouseStatusEnum;
import com.javaclimb.houserent.common.enums.OrderStatusEnum;
import com.javaclimb.houserent.common.util.DateUtil;
import com.javaclimb.houserent.common.util.MailUtil;
import com.javaclimb.houserent.entity.House;
import com.javaclimb.houserent.entity.Order;
import com.javaclimb.houserent.entity.User;
import com.javaclimb.houserent.service.HouseService;
import com.javaclimb.houserent.service.OrderService;
import com.javaclimb.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.MessagingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

/**
 * 前端订单控制器
 */
@Controller("frontOrderController")
public class OrderController extends BaseController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private HouseService houseService;

    @Autowired
    private UserService userService;

    /**
     * 创建订单
     */
    @RequestMapping("/order/create")
    @ResponseBody
    public JsonResult createOrder(@RequestParam("houseId")Long houseId,@RequestParam("endDate")String endDateStr){
        if(getLoginUser() == null){
            return JsonResult.error("用户未登录");
        }

        House house = houseService.get(houseId);
        if(house == null){
            return JsonResult.error("房子不存在");
        }

        if(Objects.equals(house.getStatus(), HouseStatusEnum.HAS_RENT.getValue())){
            return JsonResult.error("房子已租出或未释放");
        }

        Order checkOrder = orderService.getCurrentEffectiveOrder(houseId);
        if(checkOrder!=null){
            return JsonResult.error("房子已租出或未释放");
        }

        User ownerUser = userService.get(house.getUserId());
        if(ownerUser == null){
            return JsonResult.error("房东用户不存在");
        }

        //处理退租日期
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        Date endDate;
        try {
            endDate = sdf.parse(endDateStr);
        } catch (ParseException e) {
            e.printStackTrace();
            return JsonResult.error("退租日期格式不合法");
        }
        Date startDate = new Date();
        //计算总共多少天
        Integer dayNum = DateUtil.daysBetween(startDate,endDate);
        if(dayNum< Constant.MIN_RENT_DAYS){
            return JsonResult.error("最少租住"+Constant.MIN_RENT_DAYS+"天");
        }

        //创建订单
        Order order = new Order();
        order.setCreateTime(new Date());
        order.setCustomerUserId(getLoginUserId());
        order.setOwnerUserId(house.getUserId());
        order.setHouseId(houseId);
        order.setStatus(OrderStatusEnum.NOT_AGREEMENT.getValue());
        order.setMonthRent(house.getMonthRent());
        order.setDayNum(dayNum);
        order.setTotalAmount(house.getMonthRent()/30 * dayNum);
        order.setStartDate(startDate);
        order.setEndDate(endDate);
        orderService.insert(order);
        return JsonResult.success("订单创建成功，请签订合同",order.getId());
    }

    /**
     * 查看合同信息
     */
    @RequestMapping("/order/agreement/view")
    public String agreementView(@RequestParam(value = "orderId")Long orderId, Model model){
        if(getLoginUser() == null){
            return "redirect:/";
        }
        //订单不存在
        Order order = orderService.get(orderId);
        if(order==null){
            return renderNotFound();
        }
        //登录用户不是该订单的租客、房东或管理员，就不能查看合同
        if(!Objects.equals(getLoginUserId(),order.getCustomerUserId())&&!Objects.equals(getLoginUserId(),order.getOwnerUserId())&&!loginUserIsAdmin()){
            return renderNotAllowAccess();
        }
        //该订单的房子信息
        order.setHouse(houseService.get(order.getHouseId()));
        //该订单的租客信息
        order.setCustomerUser(userService.get(order.getCustomerUserId()));
        //该订单的房东信息
        order.setOwnerUser(userService.get(order.getOwnerUserId()));
        model.addAttribute("order",order);
        return "front/agreement";
    }

    /**
     * 签订合同
     */
    @RequestMapping("/order/agreement/submit")
    @ResponseBody
    public JsonResult agreementSubmit(@RequestParam(value = "orderId")Long orderId, Model model){
        if(getLoginUser() == null){
            return JsonResult.error("用户未登录");
        }
        //订单不存在
        Order order = orderService.get(orderId);
        if(order==null){
            return JsonResult.error("订单不存在");
        }

        House house = houseService.get(order.getHouseId());
        if(house == null){
            return JsonResult.error("房子不存在");
        }
        //登录用户不是该订单的租客、房东或管理员，就不能查看合同
        if(!Objects.equals(getLoginUserId(),order.getCustomerUserId())&&!Objects.equals(getLoginUserId(),order.getOwnerUserId())&&!loginUserIsAdmin()){
            return JsonResult.error("没有权限");
        }

        if(Objects.equals(house.getStatus(), HouseStatusEnum.HAS_RENT.getValue())){
            return JsonResult.error("房子已租出或未释放");
        }

        Order checkOrder = orderService.getCurrentEffectiveOrder(order.getHouseId());
        if(checkOrder!=null){
            return JsonResult.error("房子已租出或未释放");
        }

        User ownerUser = userService.get(house.getUserId());
        if(ownerUser == null){
            return JsonResult.error("房东用户不存在");
        }

        order.setStatus(OrderStatusEnum.NOT_PAY.getValue());
        orderService.update(order);
        return JsonResult.success("合同签订成功，请支付订单",orderId);
    }

    /**
     * 支付页面
     */
    @RequestMapping("/order/pay")
    public String pay(@RequestParam(value = "orderId")Long orderId, Model model){
        if(getLoginUser() == null){
            return "redirect:/";
        }
        //订单不存在
        Order order = orderService.get(orderId);
        if(order==null){
            return renderNotFound();
        }
        //登录用户不是该订单的租客、房东或管理员，就不能查看合同
        if(!Objects.equals(getLoginUserId(),order.getCustomerUserId())&&!Objects.equals(getLoginUserId(),order.getOwnerUserId())&&!loginUserIsAdmin()){
            return renderNotAllowAccess();
        }

        House house = houseService.get(order.getHouseId());
        if(house == null){
            return renderNotFound();
        }
        //该订单的房子信息
        order.setHouse(houseService.get(order.getHouseId()));
        model.addAttribute("order",order);
        return "front/pay";
    }

    /**
     * 模拟支付
     */
    @RequestMapping("/order/pay/submit")
    @ResponseBody
    public JsonResult paySubmit(@RequestParam(value = "orderId")Long orderId){
        if(getLoginUser() == null){
            return JsonResult.error("用户未登录");
        }
        //订单不存在
        Order order = orderService.get(orderId);
        if(order==null){
            return JsonResult.error("订单不存在");
        }

        House house = houseService.get(order.getHouseId());
        if(house == null){
            return JsonResult.error("房子不存在");
        }
        //登录用户不是该订单的租客、房东或管理员，就不能查看合同
        if(!Objects.equals(getLoginUserId(),order.getCustomerUserId())&&!Objects.equals(getLoginUserId(),order.getOwnerUserId())&&!loginUserIsAdmin()){
            return JsonResult.error("没有权限");
        }

        if(Objects.equals(house.getStatus(), HouseStatusEnum.HAS_RENT.getValue())){
            return JsonResult.error("房子已租出或未释放");
        }

        Order checkOrder = orderService.getCurrentEffectiveOrder(order.getHouseId());
        if(checkOrder!=null){
            return JsonResult.error("房子已租出或未释放");
        }

        User ownerUser = userService.get(house.getUserId());
        if(ownerUser == null){
            return JsonResult.error("房东用户不存在");
        }

        order.setStatus(OrderStatusEnum.NORMAL.getValue());
        orderService.update(order);

        //更新房子状态和开始结束时间
        house.setStatus(HouseStatusEnum.HAS_RENT.getValue());
        house.setLastOrderStartTime(order.getStartDate());
        house.setLastOrderEndTime(order.getEndDate());
        houseService.update(house);
        return JsonResult.success("支付成功，开始联系房东入住吧");
    }

    /**
     * 联系房东
     */
    @RequestMapping("/house/contact")
    @ResponseBody
    public JsonResult contact(@RequestParam("houseId")Long houseId,@RequestParam("name")String name,
                              @RequestParam("phone")String phone,@RequestParam("email")String email,
                              @RequestParam("content")String content){
        if(getLoginUser() == null){
            return JsonResult.error("用户未登录");
        }
        House house = houseService.get(houseId);
        if(house == null){
            return JsonResult.error("房子不存在");
        }
        User owner = userService.get(house.getUserId());
        if(owner == null){
            return JsonResult.error("房东不存在");
        }
        StringBuilder sb = new StringBuilder();
        sb.append("姓名：").append(name).append("<br/>");
        sb.append("手机号：").append(phone).append("<br/>");
        sb.append("邮箱：").append(email).append("<br/>");
        sb.append("内容如下：").append(content).append("<br/>");
        sb.append("所属链接（复制在地址栏打开）：").append("http://localhost:9999/house/detail/").append(houseId);
        try {
            MailUtil.sendEmail(owner.getEmail(),"来自"+name+"租房的咨询",sb.toString());
        } catch (MessagingException e) {
            e.printStackTrace();
            return JsonResult.error("邮件发送失败");
        }
        return JsonResult.success("邮件发送成功");
    }
}















