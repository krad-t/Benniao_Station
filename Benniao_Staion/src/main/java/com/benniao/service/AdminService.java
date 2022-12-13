package com.benniao.service;

import com.benniao.entity.Parcel;
import com.benniao.entity.SystemAdmin;

import java.io.IOException;
import java.util.List;

public interface AdminService {
    List<Parcel> showManageParcel(String adminname) throws IOException;
    List<Parcel> searchManageParcel(String type, String content) throws IOException;
    void updateParcelInfo(String eid, String status, String code, String int_time, String out_time, String company) throws IOException;

    /**
     *
     * @param user_phone
     * @param code
     * @param company
     * @param admin
     * @return 0:存在对应手机号,入库成功 1:手机号不正确,入库失败 2:取件码冲突
     * @throws IOException
     */
    int addParcel(String user_phone,String code, String company, SystemAdmin admin) throws IOException;


    void updateAdminInfo(String aid, String username, String password, String phone) throws IOException;
}
