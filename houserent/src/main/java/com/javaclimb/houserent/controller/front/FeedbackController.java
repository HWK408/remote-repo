package com.javaclimb.houserent.controller.front;

import com.javaclimb.houserent.common.base.BaseController;
import com.javaclimb.houserent.common.dto.JsonResult;
import com.javaclimb.houserent.common.enums.FeedbackStatusEnum;
import com.javaclimb.houserent.entity.Feedback;
import com.javaclimb.houserent.entity.User;
import com.javaclimb.houserent.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * 用户反馈前端控制器
 */
@Controller("frontFeedbackController")
public class FeedbackController extends BaseController {

    @Autowired
    private FeedbackService feedbackService;

    @RequestMapping("/feedback")
    public String feedback(){
        return "front/feedback";
    }

    /**
     * 反馈信息提交
     */
    @RequestMapping(value = "/feedback/submit",method = RequestMethod.POST)
    @ResponseBody
    public JsonResult submit(@RequestParam("contactName")String contactName,
                             @RequestParam("contactEmail")String contactEmail,
                             @RequestParam("title")String title,
                             @RequestParam("content")String content){
        //先判断用户是否已登录
        User loginUser = getLoginUser();
        if(loginUser==null){
            return JsonResult.error("请先登录");
        }
        Feedback feedback = new Feedback();
        feedback.setContactEmail(contactEmail);
        feedback.setContactName(contactName);
        feedback.setContent(content);
        feedback.setStatus(FeedbackStatusEnum.NOT_HANDLE.getValue());
        feedback.setTitle(title);
        feedback.setUserId(getLoginUserId());
        feedback.setCreateTime(new Date());
        feedbackService.insert(feedback);
        return JsonResult.success("反馈成功，请耐心等待管理员处理");
    }
}
