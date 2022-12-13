package com.benniao.dao;

import com.benniao.entity.CommonUser;

public interface CommonUserMapper {
    CommonUser findByUsername(String un);
    void updateUserInfo(String uid, String username, String password, String phone);

    void insertUserInfo(String uid,String username,String password,String phone);
}
