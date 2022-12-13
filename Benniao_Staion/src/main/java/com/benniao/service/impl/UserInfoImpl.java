package com.benniao.service.impl;

import com.benniao.dao.CommonUserMapper;
import com.benniao.dao.ParcelMapper;
import com.benniao.entity.CommonUser;
import com.benniao.entity.Parcel;
import com.benniao.service.UserInfo;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;

@Service(value = "UserInfoImpl")
public class UserInfoImpl implements UserInfo {
    public void updateUserInfo(String uid, String username, String password, String phone) throws IOException {
        String res = "mybatis-config.xml";
        InputStream in = Resources.getResourceAsStream(res);
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
        SqlSession sqlSession = factory.openSession();
        CommonUserMapper commonUserMapper = sqlSession.getMapper(CommonUserMapper.class);
        commonUserMapper.updateUserInfo(uid,username,password,phone);
    }

    public int insertUserInfo(String uid, String username, String password, String phone) throws IOException {
        String res = "mybatis-config.xml";
        InputStream in = Resources.getResourceAsStream(res);
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
        SqlSession sqlSession = factory.openSession(true);
        CommonUserMapper commonUserMapper = sqlSession.getMapper(CommonUserMapper.class);
        //判断重复
        CommonUser commonUser = commonUserMapper.findByUsername(username);
        if(commonUser!=null){
            return 1;
        }else{
            System.out.println(commonUserMapper.insertUserInfo(uid,username,password,phone));
        }
        return 0;
    }
}
