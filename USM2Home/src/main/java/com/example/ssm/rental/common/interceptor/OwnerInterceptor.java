package com.example.ssm.rental.common.interceptor;

import com.example.ssm.rental.common.constant.Constant;
import com.example.ssm.rental.common.enums.UserRoleEnum;
import com.example.ssm.rental.entity.User;
import com.example.ssm.rental.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * 租客接口拦截器
 */
public class OwnerInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private MessageService messageService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws IOException {
        User user = (User) request.getSession().getAttribute(Constant.SESSION_USER_KEY);
        // 如果用户未登录，拦截
        if (user == null) {
            response.sendRedirect("/login");
            return false;
        }

        Integer countNotReadMessageSize = messageService.countNotReadMessageSize(user.getId());
        user.setNotReadMessageCount(countNotReadMessageSize);
        request.getSession().setAttribute(Constant.SESSION_USER_KEY, user);
        // 如果租客访问房东的接口拦截
        if (UserRoleEnum.CUSTOMER.getValue().equalsIgnoreCase(user.getRole())) {
//            response.sendRedirect("/403");

            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {

    }
}

