package com.benniao.service.impl;

import cn.hutool.core.io.FastByteArrayOutputStream;
import cn.hutool.extra.qrcode.QrCodeUtil;
import com.benniao.entity.CommonUser;
import com.benniao.entity.Parcel;
import com.benniao.entity.SystemAdmin;
import org.springframework.stereotype.Service;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;


@Service
public class GenerateQRCodeImpl implements com.benniao.service.GenerateQRCode {

    @Override
    public void generateAccountQRCode(Object currAccount, int ac_type, HttpServletResponse response) throws IOException {
        if(ac_type==0){
            currAccount = (CommonUser)currAccount;
        }else if (ac_type==1){
            currAccount = (SystemAdmin)currAccount;
        }
        String content = currAccount.toString();
        this.baseGenerateQRCode(content,response);

    }

    @Override
    public void generateParcelCode(Parcel parcel, HttpServletResponse response) throws IOException {
        String content = parcel.toString();
        this.baseGenerateQRCode(content,response);
    }

    @Override
    public void baseGenerateQRCode(String content, HttpServletResponse response) throws IOException {
        response.setDateHeader("Expires", 0);
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
        response.setContentType("image/jpeg");
        QrCodeUtil.generate(content, 300, 300, "jpg", response.getOutputStream());
    }
}
