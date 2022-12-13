package com.benniao.dao;

import com.benniao.entity.CommonUser;

public interface CommonUserMapper {
    CommonUser findByUsername(String un);
    CommonUser findByUserphone(String up);
    void updateUserInfo(String uid, String username, String password, String phone);

    int insertUserInfo(String uid,String username,String password,String phone);
}
