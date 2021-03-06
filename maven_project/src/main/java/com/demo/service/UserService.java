package com.demo.service;

import com.demo.model.User;

import java.util.List;

/**
 * @author liudong
 */
public interface UserService {
    User get(Integer id);
    User getByGenerator(Integer id);
    void insert(User user);
    void update(User user);
    void delete(Integer id);
    List<User> getAll(int pageNum,int size);


}
