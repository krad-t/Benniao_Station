package com.benniao.service;

import java.io.IOException;

public interface UserInfo {
    void updateUserInfo(String uid,String username,String password,String phone) throws IOException;
}
