package com.demo.service;

import com.demo.mapper.UserExtMapper;
import com.demo.event.UserEvent;
import com.demo.mapper.UserMapper;
import com.demo.model.User;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private UserExtMapper userExtMapper;
    @Autowired
    private UserMapper userMapper;

    @Override
    public User get(Integer id) {
        User user = userExtMapper.get(id);
        System.out.println("-------------");
        //发布事件
        applicationEventPublisher.publishEvent(new UserEvent(this,user));
        System.out.println("-------------");
        return user;
    }

    @Override
    public User getByGenerator(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<User> getAll(int pageNum, int size) {
        PageHelper.startPage(pageNum,size);
        List<User> users = userExtMapper.getAll();
        return users;
    }
    @Override
    public void insert(User user) {
        userExtMapper.insert(user);
    }

    @Override
    public void update(User user) {
        userExtMapper.update(user);
    }

    @Override
    public void delete(Integer id) {
        userExtMapper.delete(id);
    }


    @Override
    public void setApplicationEventPublisher(ApplicationEventPublisher applicationEventPublisher) {
        this.applicationEventPublisher=applicationEventPublisher;
    }
}
