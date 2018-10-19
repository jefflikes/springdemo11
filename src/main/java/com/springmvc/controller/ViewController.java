

//package com.springmvc.controller;
//
//import com.springmvc.entity.User;
//import com.springmvc.service.UserService;
//import org.apache.commons.collections.map.HashedMap;
//import org.apache.log4j.Logger;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//
//
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//import java.util.Map;
//
///**
// * @Author : zw
// * @Date : 11:27 2017/5/5
// * @Remark :
// **/
//@Controller
//@RequestMapping("/user")
//
//public class ViewController {
//
//    private Logger logger = Logger.getLogger(ViewController.class);
//
//    @Resource(name="UserService")
//    private UserService UserService;
//
//    @RequestMapping("/index")
//    public String index(){
//        return "success";
//    }
//
////    @RequestMapping(value="/find", method= RequestMethod.POST)
////    @ResponseBody
////    public Map<String,Object> find(@RequestParam("username") String username,@RequestParam("password") String password, HttpServletRequest request){
////
////        Map<String,Object> map = new HashedMap();
////        User loginUser = UserService.findUserByNameAndPassword(username,password);
////        if(loginUser == null ){
////            map.put("result","fail");
////        }else{
////            map.put("result","success");
////
////        }
////
////        return map;
////
////
////    }
//    @RequestMapping("/find")
//    @ResponseBody
//    public Map<String,Object> find(User user, HttpServletRequest request){
//
//        Map<String,Object> map = new HashedMap();
//        User loginUser = UserService.findUserByNameAndPassword(user.getUsername(),user.getPassword());
//        if(loginUser == null ){
//            map.put("result","fail");
//        }else{
//            map.put("result","success");
//        }
//
//        return map;
//
//    }
//
//    @RequestMapping("/success")
//    public String success(){
//
//        return "success";
//    }
//
//}
//package com.springmvc.controller;
//
//import com.alibaba.fastjson.JSON;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.multipart.MultipartHttpServletRequest;
//import org.springframework.web.multipart.commons.CommonsMultipartResolver;
//
//import javax.servlet.http.HttpServletRequest;
//import java.io.*;
//import java.util.HashMap;
//import java.util.Iterator;
//import java.util.Map;
//
////数据库版本
////当前的引入版本
//
//@Controller
//public class ViewController {
//
////    @RequestMapping(value = "/upLoadFile")
//    @RequestMapping(value = "/upLoadFile.do", method = RequestMethod.POST)
//    public String upLoadFile(HttpServletRequest request)
//            throws IllegalStateException, IOException {
//        String UpLoadFilePath = "D:/upload/";
//        String exePath = "D:/release1/run.exe";
//        String modelPath = "D:/release1/shape_predictor_68_face_landmarks.dat";
//        String outputFilePath = "D:/cutOutput/";
//        // @RequestParam("file") MultipartFile file,就是在这个地方用到了jar包
//        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
//                request.getSession().getServletContext());
//        // 判断 request 是否有文件上传,即多部分请求
//        if (multipartResolver.isMultipart(request)) {
//            // 转换成多部分request
//            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
//            // 取得request中的所有文件名
//            Iterator<String> iter = multiRequest.getFileNames();
//            while (iter.hasNext()) {
//                // 取得上传文件
//                MultipartFile f = multiRequest.getFile(iter.next());
//                if (f != null) {
//                    // 取得当前上传文件的文件名称
//                    String myFileName = f.getOriginalFilename();
//                    // 如果名称不为“”,说明该文件存在，否则说明该文件不存在
//                    if (myFileName.trim() != "") {
//                        // 定义上传路径
//                        String path = "D:/upload/"
//                                + myFileName;
//                        File localFile = new File(path);
//                        f.transferTo(localFile);
//                        //剪裁图片
//                        String cmd = exePath + " " + path + " " + modelPath + " " + outputFilePath + myFileName + "/";
//                        try {
//                            Process p = Runtime.getRuntime().exec(cmd);
//
//                            BufferedInputStream in = new BufferedInputStream(p.getInputStream());
//                            BufferedReader inBr = new BufferedReader(new InputStreamReader(in));
//                            String lineStr;
//                            while ((lineStr = inBr.readLine()) != null)
//                                //获得命令执行后在控制台的输出信息
//                                System.out.println(lineStr);// 打印输出信息
//                            //检查命令是否执行失败。
//                            if (p.waitFor() != 0) {
//                                if (p.exitValue() == 1)//p.exitValue()==0表示正常结束，1：非正常结束
//                                    System.err.println("命令执行失败!");
//                            }
//                            inBr.close();
//                            in.close();
//                        } catch (IOException ex) {
//                            ex.printStackTrace();//捕捉异常
//                        } catch (InterruptedException ex) {
//                            ex.printStackTrace();
//                        }
////                        PythonInterpreter interpreter = new PythonInterpreter();
////                        interpreter.execfile("C:\\C:\\Users\\jeff\\Desktop\\conv3d_vis.py");
////                        PyFunction func = (PyFunction) interpreter.get("adder",
////                                PyFunction.class);
//                        //执行模型
//                        RunController rc;
//                        rc = new RunController(myFileName);
//                        String args[] = {""};
//                        String result = rc.run(args);
//
////                        byte[] bs = result.getBytes("iso8859-1");
////                        result = new String(bs, "GBK");
////                        PrintStream out = new PrintStream("D:\\test.txt");
////                        System.setOut(out);
//                        System.out.println(result);
////                        model.addAttribute("result", result);
////                        return "success";
//                        Map<String,String> map=new HashMap<String, String>();
//                        map.put("001",result);
//                        String jsonString= JSON.toJSONString(map);
//                        return jsonString;
//                    }
//                }
//            }
//        }
//return "";
//     }
//
//}


//    @RequestMapping("/toUpload.do")
//    public String toUpload() {
//        return "upload";
//    }
//    @RequestMapping(value = "/downLoadFile.do")   public ResponseEntity<byte[]> download(@RequestParam("name") String name,
//    @RequestParam("filePath") String path) throws IOException {
//        File file = new File(path);
//        HttpHeaders headers = new HttpHeaders();
//        String fileName = new String(name.getBytes("UTF-8"), "iso-8859-1");// 为了解决中文名称乱码问题
//        headers.setContentDispositionFormData("attachment", fileName);
//        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
//    }
//    @RequestMapping (value="/test",method=RequestMethod.POST)
//    public void test(@RequestParam("files") MultipartFile[] files) throws IOException{
//     for(MultipartFile file : files){
//      String fileName = file.getOriginalFilename();
//      System.out.print("文件："+fileName+" 上传成功");}
// }

package com.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;


@Controller
public class ViewController {
    @RequestMapping(value = "/upLoadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public Object upLoadFile(HttpServletRequest request)
            throws IllegalStateException, IOException {

        String UpLoadFilePath = "D:/upload/";
        String exePath = "D:/release1/run.exe";
        String modelPath = "D:/release1/shape_predictor_68_face_landmarks.dat";
        String outputFilePath = "D:/cutOutput/";
        String result = null;


        // @RequestParam("file") MultipartFile file,
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());
        // 判断 request 是否有文件上传,即多部分请求
        if (multipartResolver.isMultipart(request)) {
            // 转换成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            // 取得request中的所有文件名
            Iterator<String> iter = multiRequest.getFileNames();
            while (iter.hasNext()) {
                // 取得上传文件
                MultipartFile f = multiRequest.getFile(iter.next());
                if (f != null) {
                    // 取得当前上传文件的文件名称
                    String myFileName = f.getOriginalFilename();
                    // 如果名称不为“”,说明该文件存在，否则说明该文件不存在
                    if (myFileName.trim() != "") {
                        // 定义上传路径
                        String path = UpLoadFilePath + myFileName;
                        File localFile = new File(path);
                        f.transferTo(localFile);


                        // 剪裁图片
                        String cmd = exePath + " " + path + " " + modelPath+ " " + outputFilePath + myFileName + "/";
                        try {
                            Process p = Runtime.getRuntime().exec(cmd);

                            BufferedInputStream in = new BufferedInputStream(p.getInputStream());
                            BufferedReader inBr = new BufferedReader(new InputStreamReader(in));
                            String lineStr;
                            while ((lineStr = inBr.readLine()) != null)
                                //获得命令执行后在控制台的输出信息
                                System.out.println(lineStr);// 打印输出信息
                            //检查命令是否执行失败。
                            if (p.waitFor() != 0) {
                                if (p.exitValue() == 1)//p.exitValue()==0表示正常结束，1：非正常结束
                                    System.err.println("Cmd exec failed.");
                            }
                            inBr.close();
                            in.close();
                        }catch (IOException ex){
                            ex.printStackTrace();
                        }catch (InterruptedException ex){
                            ex.printStackTrace();
                        }

                        // 执行模型
                        RunController rc = new RunController(myFileName);
                        String args[] = {""};
                        result = rc.run(args);
                        System.out.println(result);
//                        System.out.println(request.getParameterNames());


                    }
                }
            }
        }
        Map<String, String> map = new HashMap<String, String>();
        if (result != null){
            map.put("status", "success");
            map.put("word", result);
        }
        else{
            map.put("status", "failed");
            map.put("word", result);
        }
        return  map;
    }


}

//@RunController
//public class fileController {
//    @RequestMapping("/login")
//    public String login(String userName, String password, Model model) {
//        if (userName.equals(password)) {
//
//            userName += "iiii";
//            model.addAttribute("userName", userName);
//            return "ok.jsp";
//
//        } else {
//            return "no.jsp";
//        }
//
//    }
//
//}

