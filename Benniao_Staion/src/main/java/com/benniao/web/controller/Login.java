package com.benniao.web.controller;

import com.benniao.dto.AccountLoginStatus;
import com.benniao.entity.CommonUser;
import com.benniao.entity.SystemAdmin;
import com.benniao.service.impl.LoginVerifyImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class Login {
    @Autowired
    LoginVerifyImpl lv;

    public AccountLoginStatus ac;
    /**
     * 初始页面
     *
     * @return index页面
     */
    @RequestMapping("")
    public ModelAndView init() {
        return new ModelAndView("../../index");
    }

    /**
     * 登录请求
     *
     * @param un 请求参数
     * @param pw 请求参数
     * @param ut 请求参数
     * @return
     */
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public ModelAndView loginJudge(@RequestParam(value = "username")
                                           String un,
                                   @RequestParam(value = "password")
                                           String pw,
                                   @RequestParam(value = "usertype")
                                           String ut,
                                   HttpSession session
    ) {
        ModelAndView mv = new ModelAndView("../../index");
        ac = null;
        Integer ac_type = null;
        if (ut.equals("普通用户")) {
            ac_type = 0;
        } else if (ut.equals("管理员")) {
            ac_type = 1;
        }

        try {
            ac = lv.verify(un, pw, ac_type);
        } catch (IOException e) {
            e.printStackTrace();
        }

        if (ac != null) {
            switch (ac.loginStatus) {
                case 0:
                    if(ac_type==0){
                        mv.setViewName("user_home");
                        mv.addObject("username",((CommonUser)(ac.user)).getUsername());

                    }else if(ac_type==1){
                        mv.setViewName("admin_home");
                        mv.addObject("username",((SystemAdmin)(ac.user)).getUsername());
                    }
                    session.setAttribute("account",ac.user);
                    session.setAttribute("account_type",ac_type);
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
