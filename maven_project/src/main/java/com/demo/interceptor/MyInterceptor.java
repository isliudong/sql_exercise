package com.demo.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author liudong
 */
public class MyInterceptor implements HandlerInterceptor {
    /**
     * @description 前置处理
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @return 放行返回true
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        System.out.println("前置处理-------------------------------");

        return true;
    }

    //方法响应后
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        System.out.println("postHandle处理------------------------");
    }

    //页面响应后
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        System.out.println("后置处理-------------------------------");
    }
}
