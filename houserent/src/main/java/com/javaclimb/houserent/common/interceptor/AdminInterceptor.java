package com.javaclimb.houserent.common.interceptor;

import com.javaclimb.houserent.common.constant.Constant;
import com.javaclimb.houserent.common.enums.UserRoleEnum;
import com.javaclimb.houserent.entity.User;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 管理员接口拦截器
 */
@Component
public class AdminInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        User user = (User) request.getSession().getAttribute(Constant.SESSION_USER_KEY);
        //如果用户未登录，拦截
        if(user == null){
            response.sendRedirect("/");
            return false;
        }
        //如果用户不是管理员，拦截
        if(!UserRoleEnum.ADMIN.getValue().equalsIgnoreCase(user.getRole())){
            return false;
        }
        return true;
    }
}
