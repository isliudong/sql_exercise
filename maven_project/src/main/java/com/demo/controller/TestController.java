package com.demo.controller;

import com.demo.model.Student;
import com.demo.model.User;
import com.demo.service.StudentServiceImpl;
import com.demo.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author liudong
 */
@Controller
public class TestController {
    @Autowired
    private StudentServiceImpl studentService;

    @Autowired
    private UserServiceImpl userService;

    @RequestMapping("/getUser")
    @ResponseBody
    public User getStudent(){


        User user = userService.get(1);
        return user;
    }
}
