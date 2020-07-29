package com.demo.service;

import com.demo.model.Student;
import com.demo.model.User;

import java.util.HashMap;
import java.util.List;

/**
 * @author liudong
 */
public interface UserService {
    User get(Integer id);
    void insert(User user);
    void update(User user);
    void delete(Integer id);
    List<User> getAll(int pageNum,int size);


}
