package com.benniao.dao;

import com.benniao.entity.CommonUser;

public interface CommonUserMapper {
    CommonUser findByUsername2(String un);
}
