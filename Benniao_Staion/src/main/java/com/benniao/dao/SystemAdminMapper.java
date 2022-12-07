package com.benniao.dao;

import com.benniao.entity.SystemAdmin;

public interface SystemAdminMapper {
    SystemAdmin findByUsername(String un);
}


