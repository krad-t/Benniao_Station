package com.benniao.web.controller;

import com.benniao.entity.Parcel;
import com.benniao.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import javax.annotation.Resource;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Map;


@Controller
public class CreateQRCode {
    @Resource(name = "GenerateQRCodeImpl")
    private GenerateQRCode generateQRCode;
    @Autowired
    private UserHome userHome;
    @RequestMapping(value = "showAccountQRCode",method = RequestMethod.GET)
    public void showAccountQRCode(HttpServletResponse response, HttpSession session) throws IOException {
        int ac_type =  (int)session.getAttribute("account_type");
        Object account = session.getAttribute("account");
        generateQRCode.generateAccountQRCode(account,ac_type,response);
    }

    @RequestMapping("showParcelQRCode")
    public void showParcelQRCode(
            @RequestParam(name = "parcel")
            String parcel,
            HttpServletResponse response) throws IOException {
        generateQRCode.generateParcelCode(parcel,response);
    }

}
