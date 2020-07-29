package com.demo.service;

import com.demo.mapper.UserMapper;
import com.demo.event.UserEvent;
import com.demo.model.User;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.ApplicationEventPublisherAware;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

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
