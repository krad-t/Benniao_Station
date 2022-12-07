package com.benniao.dao;

import com.benniao.entity.Parcel;

import java.util.List;

public interface ParcelMapper {
    List<Parcel> selectByUsername(String username);
    Parcel updateStatus(int newStatusCode,String username);
}
