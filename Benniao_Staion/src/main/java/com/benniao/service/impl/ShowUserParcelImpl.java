package com.benniao.service.impl;

import com.benniao.dao.ParcelMapper;
import com.benniao.entity.Parcel;
import com.benniao.service.ShowUserParcel;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Service
public class ShowUserParcelImpl implements ShowUserParcel {
    @Autowired
    private ParcelMapper parcelMapper;
    private String un;
    @Override
    public List<Parcel> showMyParcel(String un) throws IOException {
        this.un=un;
        String res = "mybatis-config.xml";
        InputStream in = Resources.getResourceAsStream(res);
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
        SqlSession sqlSession = factory.openSession();
        ParcelMapper parcelMapper = sqlSession.getMapper(ParcelMapper.class);
        return parcelMapper.selectByUsername(un);
    }

    @Override
    public List<Parcel> searchMyParcel(String type, String content) throws IOException {
        String res = "mybatis-config.xml";
        InputStream in = Resources.getResourceAsStream(res);
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
        SqlSession sqlSession = factory.openSession();
        ParcelMapper parcelMapper = sqlSession.getMapper(ParcelMapper.class);
        List<Parcel> list = null;
        if(type.equals("")){
            return this.showMyParcel(un);
        }else {
            if(type.equals("按取件码")){
                list = parcelMapper.searchByCode(un,content);
            }else if (type.equals("按入库日期")){
                list = parcelMapper.searchByInt_time(un,content);
            }else if (type.equals("按管理员电话")){
                list = parcelMapper.searchByAdmin_phone(un,content);
            }else if (type.equals("按状态")){
                //修改一下
                list = parcelMapper.searchByStatus(un,content);
            }else if (type.equals("按快递公司")){
                list = parcelMapper.searchByCompany(un,content);
            }
        }
        return list;

    }
}
