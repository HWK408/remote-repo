package com.javaclimb.houserent.controller.front;

import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.constant.Constant;
import com.javaclimb.houserent.common.dto.JsonResult;
import com.javaclimb.houserent.common.enums.UserStatusEnum;
import com.javaclimb.houserent.entity.User;
import com.javaclimb.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * 登录相关的控制器
 */
@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {

    @Autowired
    private UserService userService;

    /**
     * 登录提交
     */
    @RequestMapping(value = "/submit",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult loginSubmit(User user, HttpSession session){
        if(user==null){
            return JsonResult.error("非法访问");
        }
        User user1 = userService.findByUserName(user.getUserName());
        if(user1==null){
            return JsonResult.error("用户不存在");
        }
        //判断密码是否正确
        if(!user.getUserPass().equals(user1.getUserPass())){
            return JsonResult.error("密码错误");
        }
        if(UserStatusEnum.DISABLE.getValue().equals(user1.getStatus())){
            return JsonResult.error("账号已被冻结，请联系管理员");
        }
        session.setAttribute(Constant.SESSION_USER_KEY,user1);
        return JsonResult.success("登录成功");
    }

    /**
     * 退出登录，返回首页
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute(Constant.SESSION_USER_KEY);
        session.invalidate();
        return "redirect:/";
    }
}
