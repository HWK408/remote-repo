package com.javaclimb.houserent.controller.front;

import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.constant.Constant;
import com.javaclimb.houserent.common.dto.JsonResult;
import com.javaclimb.houserent.entity.User;
import com.javaclimb.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * 注册控制器
 */
@Controller
@RequestMapping("/register")
public class RegisterController extends BaseController {

    @Autowired
    private UserService userService;

    /**
     * 注册提交
     */
    @RequestMapping(value = "/submit",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult registerSubmit(User user, HttpSession session){
        if(user==null){
            return JsonResult.error("非法访问");
        }
        User user1 = userService.findByUserName(user.getUserName());
        if(user1!=null){
            return JsonResult.error("用户已存在");
        }
        user.setIdCard("还没有填写！");
        user.setUserAvatar("/assets/img/default-avatar.jpg");
        user.setUserDesc("还没有填写！");
        user.setSex("保密");
        user.setHobby("还没有填写！");
        user.setJob("还没有填写！");
        user.setCreateTime(new Date());
        try{
            userService.insert(user);
        }catch (Exception e){
            e.printStackTrace();
            return JsonResult.error("注册失败");
        }
        session.setAttribute(Constant.SESSION_USER_KEY,user);
        return JsonResult.success("注册成功");
    }
}
