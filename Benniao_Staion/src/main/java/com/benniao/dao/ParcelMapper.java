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

    Parcel updateStatus(int newStatusCode,String username);
}
