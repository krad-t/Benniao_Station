package com.benniao.web.controller;

import com.benniao.service.impl.GenerateQRCodeImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.*;
import java.io.IOException;


@Controller
public class CreateQRCode {
    @Autowired
    GenerateQRCodeImpl generateQRCode;

    @RequestMapping(value = "showAccountQRCode",method = RequestMethod.GET)
    public void showQRCode(HttpServletResponse response, HttpSession session) throws IOException {
        int ac_type =  (int)session.getAttribute("account_type");
        Object account = session.getAttribute("account");;
        generateQRCode.generateAccountQRCode(account,ac_type,response);
    }
}
