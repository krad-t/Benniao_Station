package com.benniao.web.controller;

import com.benniao.entity.CommonUser;
import com.benniao.service.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.IOException;

@Controller
@RequestMapping(value = "/")
public class Register {
    @Resource(name = "UserInfoImpl")
    private UserInfo ui; //自动装入
    //注册页面
    @RequestMapping(value="/userRegister")
    public String user_register(){
        return "user_register";
    }

    //注册成功
    @RequestMapping(value="/registerSuccess")
    public String register_success(){
        return "register_success";
    }
    //将数据存储
    @RequestMapping(value="/register")
    public ModelAndView insertUser(@RequestParam("uid")String uid,
                                   @RequestParam("username")String username,
                                   @RequestParam("password")String password,
                                   @RequestParam("phone")String phone) throws IOException {
        int registerCode = ui.insertUserInfo(uid,username,password,phone);
        ModelAndView mv = new ModelAndView();
        if(registerCode==0){
            mv.setViewName("register_success");
        }else if(registerCode==1){
            mv.addObject("registerFailed","用户名冲突");
            mv.setViewName("user_register");
        }
       return mv;
    }


}
