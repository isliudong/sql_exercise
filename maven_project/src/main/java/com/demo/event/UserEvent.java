package com.demo.event;

import com.demo.model.User;
import org.springframework.context.ApplicationEvent;

/**
 * @author liudong
 */
public class UserEvent extends ApplicationEvent {

    private final User user;
    public UserEvent(Object source, User user) {
        super(source);
        this.user = user;
    }

    public User getUser(){
        return user;
    }
}
