package com.demo.dao;

import com.demo.model.Student;

/**
 * @author liudong
 */
public interface StudentDao {

    Student get(String id);

    Student get2();
}
