package com.demo.service;

import com.demo.dao.StudentDao;
import com.demo.dao.UserDao;
import com.demo.event.UserEvent;
import com.demo.model.Student;
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
    private UserDao userDao;

    @Override
    public User get(Integer id) {
        User user = userDao.get(id);
        System.out.println("-------------");
        //发布事件
        applicationEventPublisher.publishEvent(new UserEvent(this,user));
        System.out.println("-------------");
        return user;
    }




    @Override
    public void setApplicationEventPublisher(ApplicationEventPublisher applicationEventPublisher) {
        this.applicationEventPublisher=applicationEventPublisher;
    }
}
