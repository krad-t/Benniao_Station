package com.benniao.web.controller;

import com.benniao.entity.CommonUser;
import com.benniao.entity.Parcel;
import com.benniao.service.ShowUserParcel;
import com.benniao.service.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("userHome")
public class UserHome {

    @Autowired
    private ShowUserParcel showUserParcel;

    @Autowired
    private UserInfo userInfo;

    private ModelAndView mv;

    public ModelAndView getMv() {
        return mv;
    }

    @RequestMapping(value = "/showAllParcel")
    public ModelAndView showAllParcel(HttpSession session) throws IOException {
        ModelAndView mv = new ModelAndView("parcel_list");
        CommonUser user = (CommonUser) session.getAttribute("account");
        List<Parcel> list = showUserParcel.showMyParcel(user.getUsername());
        mv.addObject("parcelList",list);
        return mv;
    }
    @RequestMapping(value = "showParcelQRCode",method = RequestMethod.POST)
    public String redirectToShowParcelQRCode(){
        return "redirect:/showParcelQRCode";
    }

    @RequestMapping(value = "search",method = RequestMethod.POST)
    public ModelAndView search(String type,String content) throws IOException {
        ModelAndView mv = new ModelAndView("parcel_list");
        List<Parcel> list = showUserParcel.searchMyParcel(type,content);
        mv.addObject("parcelList",list);
        return mv;
    }
    @RequestMapping(value = "userInfo",method = RequestMethod.GET)
    public ModelAndView userInfo(HttpSession session) throws IOException {
        ModelAndView mv = new ModelAndView("user_info");
        CommonUser user = (CommonUser) session.getAttribute("account");
        mv.addObject("uid",user.getUid());
        mv.addObject("username",user.getUsername());
        mv.addObject("password",user.getPassword());
        mv.addObject("phone",user.getPhone());
        return mv;
    }
    @RequestMapping(value = "updateUerInfo",method = RequestMethod.POST)
    public ModelAndView updateUerInfo(String uid,String username,String password,String phone) throws IOException {
        ModelAndView mv = new ModelAndView("user_info");
        userInfo.updateUserInfo(uid, username, password, phone);
        return mv;

    }

}
