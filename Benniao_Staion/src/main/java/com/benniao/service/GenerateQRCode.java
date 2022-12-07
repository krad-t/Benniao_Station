package com.benniao.service;


import com.benniao.entity.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface GenerateQRCode<T> {
    void generateAccountQRCode(T currAccount,int ac_type,HttpServletResponse response) throws IOException;
    void generateParcelCode(Parcel parcel, HttpServletResponse response) throws IOException;
    void baseGenerateQRCode(String content,HttpServletResponse response) throws IOException;
}
