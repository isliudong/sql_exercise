package com.demo.service;

import com.demo.dao.StudentDao;
import com.demo.model.Student;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author liudong
 */
@Service
public class StudentServiceImpl implements StudentService {
    @Resource
    private StudentDao studentDao;

    @Override
    public Student get(String id) {
        return studentDao.get(id);
    }

    @Override
    public Student get2() {
        return studentDao.get2();
    }


}
