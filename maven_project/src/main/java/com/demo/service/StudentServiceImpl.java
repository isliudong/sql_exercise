package com.demo.service;

import com.demo.mapper.StudentMapper;
import com.demo.model.Student;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author liudong
 */
@Service
public class StudentServiceImpl implements StudentService {
    @Resource
    private StudentMapper studentMapper;

    @Override
    public Student get(String id) {
        return studentMapper.get(id);
    }

    @Override
    public Student get2() {
        return studentMapper.get2();
    }


}
