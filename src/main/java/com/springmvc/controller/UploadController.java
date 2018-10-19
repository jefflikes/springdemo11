//package com.springmvc.controller;
//import java.io.File;
//import java.io.IOException;
//import java.util.Iterator;
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//
//import com.mysql.fabric.Server;
//import com.sun.deploy.net.HttpResponse;
//import jdk.nashorn.internal.ir.RuntimeNode;
//import org.apache.commons.io.FileUtils;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.MediaType;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.multipart.MultipartHttpServletRequest;
//import org.springframework.web.multipart.commons.CommonsMultipartResolver;
//import org.springframework.stereotype.Controller;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import javax.xml.ws.Response;
//import javax.xml.ws.spi.http.HttpContext;
//import java.io.*;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.Iterator;
///**
// * Created by jeff on 2018/3/16.
// */
//public class UploadController {
////    @Resource
////    public UserClientService userService;
//
//    @RequestMapping(value = "upload1.do", method = RequestMethod.POST)
//    public @ResponseBody
//    String upload1(HttpServletRequest request,
//                  HttpServletResponse response, ModelMap model, HttpSession session) throws IOException {
//        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
//        MultipartFile mFile = multipartRequest.getFile("file");
//        String path = request.getSession().getServletContext().getRealPath("/resources/upload");
//        String filename = mFile.getOriginalFilename();
//        InputStream inputStream = mFile.getInputStream();
//        byte[] b = new byte[1048576];
//        int length = inputStream.read(b);
//        Date date = new Date();
//        SimpleDateFormat F = new SimpleDateFormat("yyyyMMddHHmmss");
//        String prefix=filename.substring(filename.lastIndexOf("."));
//        filename = "123" + F.format(date) + prefix;
//        String url =path +"/"+ filename;
//        System.out.println(url);
//        FileOutputStream outputStream = new FileOutputStream(url);
//        outputStream.write(b, 0, length);
//        inputStream.close();
//        outputStream.close();
//        return "success";
//    }
//}
