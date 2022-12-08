package com.benniao.service;

import com.benniao.entity.Parcel;

import java.io.IOException;
import java.util.List;

public interface ShowUserParcel {
    List<Parcel> showMyParcel(String un) throws IOException;
    List<Parcel> searchMyParcel(String type,String content) throws IOException;

}
