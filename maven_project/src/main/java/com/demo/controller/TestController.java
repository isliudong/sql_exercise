package com.demo.controller;

import com.demo.model.Student;
import com.demo.model.User;
import com.demo.service.StudentServiceImpl;
import com.demo.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.List;
import java.util.Random;

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
    public User getUser(){


        User user = userService.get(1);
        User user1 = new User();
        user1.setName("李四");
        user1.setSex("男");
        userService.insert(user1);
        return user;
    }

    @RequestMapping("/addUser")
    @ResponseBody
    public User addUser(){
        User user = userService.get(1);
        User user1 = new User();

        user1.setName("李四");
        user1.setSex("男");
        userService.insert(user1);

        return user;
    }

    @RequestMapping("/addValidUser")
    @ResponseBody
    public User addUser(@Valid User user, BindingResult result){
        if(!result.hasErrors()) {
            userService.insert(user);
        }else {

            user.setName("被你玩坏了");

        }
        return user;
    }

    @RequestMapping("/updateUser")
    @ResponseBody
    public User updateUser(){
        User user = userService.get(1);


        User user1 = new User();
        user1.setId(2);
        user1.setName("李四"+ new Random().nextInt(100));
        user1.setSex("男");
        userService.update(user1);

        return user;
    }

    @RequestMapping("/deleteUser")
    @ResponseBody
    public User deleteUser(){
        User user = userService.get(1);

        userService.delete(5);

        return user;
    }

    //分页查询
    @RequestMapping("/getAll")
    @ResponseBody
    public List<User> getAll(@RequestParam int pageNum,@RequestParam int size){
        List<User> users = userService.getAll(pageNum, size);

        return users;
    }

    @RequestMapping("/test")
    public String test(){

        return "test";
    }




}
