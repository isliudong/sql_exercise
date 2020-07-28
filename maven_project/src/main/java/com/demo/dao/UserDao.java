package com.demo.dao;

import com.demo.model.Student;
import com.demo.model.User;

/**
 * @author liudong
 */
public interface UserDao {

    User get(int id);
}
