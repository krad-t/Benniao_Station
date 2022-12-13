package com.benniao.dao;

import com.benniao.entity.SystemAdmin;

public interface SystemAdminMapper {
    SystemAdmin findByUsername(String un);
    void updateAdminInfo(String aid, String username, String password, String phone);
}


