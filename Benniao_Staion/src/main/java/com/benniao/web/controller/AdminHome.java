package com.benniao.web.controller;

import com.benniao.entity.Parcel;
import com.benniao.entity.SystemAdmin;
import com.benniao.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping(value = "adminHome")
public class AdminHome {
    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/showManageParcel")
    public ModelAndView showManageParcel(HttpSession session) throws IOException {
        ModelAndView mv = new ModelAndView("parcel_list_admin");
        SystemAdmin admin = (SystemAdmin) session.getAttribute("account");
        mv.addObject("parcelList", adminService.showManageParcel(admin.getUsername()));
        return mv;
    }
    @RequestMapping(value = "/search")
    public ModelAndView search(String type,String content) throws IOException {
        ModelAndView mv = new ModelAndView("parcel_list_admin");
        List<Parcel> list = adminService.searchManageParcel(type,content);
        mv.addObject("parcelList",list);
        return mv;
    }

    @RequestMapping(value = "/updateParcelInfo")
    public ModelAndView updateParcelInfo(
            String eid,
            String statusCode,
            String code,
            String int_time,
            String out_time,
            String company,
            HttpSession session
            ) throws IOException {
        adminService.updateParcelInfo(eid,statusCode,code ,int_time, out_time, company);
        return this.showManageParcel(session);
    }
}
