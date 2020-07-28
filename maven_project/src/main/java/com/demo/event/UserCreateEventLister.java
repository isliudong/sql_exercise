package com.demo.event;

import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

/**
 * @author liudong
 */
@Component
public class UserCreateEventLister implements ApplicationListener<UserEvent> {
    @Override
    public void onApplicationEvent(UserEvent userEvent) {
        System.out.println(this.getClass().getName()+"-- ApplicationLister 接口实现"+userEvent.getUser().toString());
    }
}
