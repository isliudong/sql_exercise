package com.demo.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

/**
 * @program: sql_exercise
 * @description: 下载控制
 * @author: LD
 * @create: 2020-07-30 11:09
 **/
@Controller
public class DownLoadController {

    @RequestMapping("/download")
    public ResponseEntity<byte[]> download(HttpServletRequest request) throws IOException {
        ServletContext context=request.getServletContext();
        String realPath = context.getRealPath("/SourceFile/file.text");
        FileInputStream fileInputStream = new FileInputStream(realPath);
        byte[] tmp=new byte[fileInputStream.available()];
        fileInputStream.read(tmp);
        fileInputStream.close();

        //返回下载文件流
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Disposition","attachment;filename="+"file.text");
        return new ResponseEntity<byte[]>(tmp,headers, HttpStatus.OK);
    }
}
