package com.benniao.dao;

import com.benniao.entity.Parcel;

import java.util.List;

public interface ParcelMapper {
    List<Parcel> selectByUsername(String username);
    List<Parcel> searchByCode(String username,String code);
    List<Parcel> searchByInt_time(String username,String int_time);
    List<Parcel> searchByAdmin_phone(String username,String admin_phone);
    List<Parcel> searchByStatus(String username,String content);
    List<Parcel> searchByCompany(String username,String content);

    int _updateByeid(String eid, String status, String code, String int_time, String out_time, String company);
    List<Parcel> _selectByAdminname(String adminname);
    List<Parcel> _searchByCode(String adminname,String code);
    List<Parcel> _searchByInt_time(String adminname,String int_time);
    List<Parcel> _searchByOut_time(String adminname,String out_time);
    List<Parcel> _searchByCompany(String adminname,String content);
    List<Parcel> _searchByUser_phone(String adminname,String user_phone);
    List<Parcel> _searchByStatus(String adminname,String content);
}
