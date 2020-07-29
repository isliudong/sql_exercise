package com.demo.service;

import com.demo.model.Student;
import com.demo.model.User;

/**
 * @author liudong
 */
public interface UserService {
    User get(Integer id);
    void insert(User user);
    void update(User user);
    void delete(Integer id);

}
