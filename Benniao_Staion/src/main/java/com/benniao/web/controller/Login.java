package com.benniao.web.controller;

import com.benniao.dto.Account;
import com.benniao.service.impl.LoginVerify;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

@Controller
public class Login {
    @Autowired
    LoginVerify lv;



    @RequestMapping("")
    public ModelAndView init() {
        return new ModelAndView("../../index");
    }

    @RequestMapping(value = "login",method = RequestMethod.POST)
    public ModelAndView loginJudge(@RequestParam(value = "username")
                                           String un,
                                   @RequestParam(value = "password")
                                           String pw,
                                   @RequestParam(value = "usertype")
                                           String ut
    ) {

        ModelAndView mv = new ModelAndView("../../index");
        Account ac = null;
        Integer ust = null;
        if (ut.equals("普通用户")) {
            ust = 0;
        } else if (ut.equals("管理员")) {
            ust = 1;
        }


        try {
            ac = lv.verify(un, pw, ust);
        } catch (IOException e) {
            e.printStackTrace();
        }

        if (ac != null) {
            switch (ac.loginStatus) {
                case 0:
                    mv.setViewName("main");
                    break;
                case 1:
                    mv.addObject("usernameError", "账户不存在");
                    break;
                case 2:
                    mv.addObject("passwordError", "密码错误");
                    break;
            }
        }
        return mv;

    }

}
