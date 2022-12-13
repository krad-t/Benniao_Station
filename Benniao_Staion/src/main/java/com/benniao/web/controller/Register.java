package com.benniao.web.controller;

import com.benniao.entity.CommonUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/")
public class Register {
    //注册页面
    @RequestMapping(value="/user_register")
    public String user_register(){
        return "user_register";
    }

    //注册成功
    @RequestMapping(value="/register_success")
    public String register_success(){
        return "register_success";
    }
    //将数据存储
    @RequestMapping(value="/login")
    public String insertUser(@RequestParam("uid")String uid,
                             @RequestParam("username")String username,
                             @RequestParam("password")String password,
                             @RequestParam("phone")String phone){
        //创建CommonUser对象
        CommonUser commonuser = new CommonUser();
        commonuser.setUid(uid);
        commonuser.setUsername(username);
        commonuser.setPassword(password);
        commonuser.setPhone(phone);
        return "login";

    }


}
