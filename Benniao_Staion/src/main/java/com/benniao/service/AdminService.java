package com.benniao.service;

import com.benniao.entity.Parcel;

import java.io.IOException;
import java.util.List;

public interface AdminService {
    List<Parcel> showManageParcel(String adminname) throws IOException;
    List<Parcel> searchManageParcel(String type, String content) throws IOException;
    void updateParcelInfo(String eid, String status, String code, String int_time, String out_time, String company) throws IOException;
}
