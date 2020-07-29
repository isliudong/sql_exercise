package com.demo.service;

import com.demo.mapper.UserMapper;
import com.demo.event.UserEvent;
import com.demo.model.User;
import com.github.pagehelper.PageHelper;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.ApplicationEventPublisherAware;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author liudong
 */
@Service
public class UserServiceImpl implements UserService, ApplicationEventPublisherAware {
    private ApplicationEventPublisher applicationEventPublisher;

    @Resource
    private UserMapper userMapper;

    @Override
    public User get(Integer id) {
        User user = userMapper.get(id);
        System.out.println("-------------");
        //发布事件
        applicationEventPublisher.publishEvent(new UserEvent(this,user));
        System.out.println("-------------");
        return user;
    }

    @Override
    public List<User> getAll(int pageNum, int size) {
        PageHelper.startPage(pageNum,size);
        List<User> users = userMapper.getAll();
        return users;
    }
    @Override
    public void insert(User user) {
        userMapper.insert(user);
    }

    @Override
    public void update(User user) {
        userMapper.update(user);
    }

    @Override
    public void delete(Integer id) {
        userMapper.delete(id);
    }


    @Override
    public void setApplicationEventPublisher(ApplicationEventPublisher applicationEventPublisher) {
        this.applicationEventPublisher=applicationEventPublisher;
    }
}
