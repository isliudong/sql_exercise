package com.demo.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
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
public class FileController {

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
        return new ResponseEntity<>(tmp,headers, HttpStatus.OK);
    }

    @RequestMapping("/upLoad")
    public String upload(Model model, @RequestParam("file") MultipartFile file){


        try {
            file.transferTo(new File("E:\\file_sever\\"+file.getOriginalFilename()));
            model.addAttribute("msg","success");
        } catch (IOException e) {
            e.printStackTrace();
        }
        model.addAttribute("msg","filed");
        return "test";
    }
}
