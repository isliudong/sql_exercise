package com.demo.mapper;

import com.demo.model.User;

/**
 * @author liudong
 */
public interface UserMapper {

    User get(int id);
    int insert(User user);
    int update(User user);
    int delete(int id);
}
