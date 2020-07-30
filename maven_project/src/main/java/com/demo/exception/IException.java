package com.demo.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

/**
 * @program: sql_exercise
 * @description: 全局异常处理
 * @author: LD
 * @create: 2020-07-30 10:30
 **/
@ControllerAdvice
public class IException {
    @ExceptionHandler
    public ModelAndView getExceptions(Exception ex){
        ModelAndView view = new ModelAndView("error");
        view.addObject("ex",ex);
        return view;
    }
}
