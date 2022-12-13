package com.benniao.service;

import java.io.IOException;

public interface UserInfo {
    void updateUserInfo(String uid,String username,String password,String phone) throws IOException;

    /**
     *
     * @param uid
     * @param username
     * @param password
     * @param phone
     * @return 0-注册成功 1-注册失败：用户名冲突
     * @throws IOException
     */
    int insertUserInfo(String uid,String username,String password,String phone) throws IOException;

}
