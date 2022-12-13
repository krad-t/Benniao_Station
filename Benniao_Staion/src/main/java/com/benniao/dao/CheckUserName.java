package com.benniao.dao;

import com.benniao.entity.CommonUser;

import java.sql.SQLException;

public interface CheckUserName {
    public CommonUser CheckUserName(String username) throws SQLException;
}
