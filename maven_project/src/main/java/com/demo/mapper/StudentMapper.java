package com.demo.mapper;

import com.demo.model.Student;

/**
 * @author liudong
 */
public interface StudentMapper {

    Student get(String id);

    Student get2();
}
