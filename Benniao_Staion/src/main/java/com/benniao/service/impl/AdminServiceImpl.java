package com.benniao.service.impl;

import com.benniao.dao.CommonUserMapper;
import com.benniao.dao.ParcelMapper;
import com.benniao.entity.CommonUser;
import com.benniao.entity.Parcel;
import com.benniao.entity.SystemAdmin;
import com.benniao.service.AdminService;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.List;
import java.util.UUID;

@Service
public class AdminServiceImpl implements AdminService {
    private String un;
    @Override
    public List<Parcel> showManageParcel(String adminname) throws IOException {
        this.un=adminname;
        String res = "mybatis-config.xml";
        InputStream in = Resources.getResourceAsStream(res);
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
        SqlSession sqlSession = factory.openSession();
        ParcelMapper parcelMapper = sqlSession.getMapper(ParcelMapper.class);
        List<Parcel> list = parcelMapper._selectByAdminname(adminname);
        return list;
    }

    @Override
    public List<Parcel> searchManageParcel(String type, String content) throws IOException {
        String res = "mybatis-config.xml";
        InputStream in = Resources.getResourceAsStream(res);
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
        SqlSession sqlSession = factory.openSession();
        ParcelMapper parcelMapper = sqlSession.getMapper(ParcelMapper.class);
        List<Parcel> list = null;
        if(type.equals("")){
            return this.showManageParcel(un);
        }else {
            if(type.equals("按取件码")){
                list = parcelMapper._searchByCode(un,content);
            }else if (type.equals("按入库日期")){
                list = parcelMapper._searchByInt_time(un,content);
            }else if (type.equals("按出库日期")){
                list = parcelMapper._searchByOut_time(un,content);
            }else if (type.equals("按快递公司")){
                list = parcelMapper._searchByCompany(un,content);
            }else if (type.equals("按状态")){
                list = parcelMapper._searchByStatus(un,content);
            }else if (type.equals("用户电话")){
                list = parcelMapper._searchByUser_phone(un,content);
            }
        }
        return list;
    }

    @Override
    public void updateParcelInfo(String eid, String status, String code, String int_time, String out_time, String company) throws IOException {
        String res = "mybatis-config.xml";
        InputStream in = Resources.getResourceAsStream(res);
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
        SqlSession sqlSession = factory.openSession(true);
        ParcelMapper parcelMapper = sqlSession.getMapper(ParcelMapper.class);
        System.out.println(parcelMapper._updateByeid(eid, status, code, int_time, out_time, company));
    }

    @Override
    public int addParcel(String user_phone,String code, String company, SystemAdmin admin) throws IOException {
        String res = "mybatis-config.xml";
        InputStream in = Resources.getResourceAsStream(res);
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
        SqlSession sqlSession = factory.openSession(true);
        ParcelMapper parcelMapper = sqlSession.getMapper(ParcelMapper.class);
        CommonUserMapper commonUserMapper = sqlSession.getMapper(CommonUserMapper.class);
        CommonUser commonUser = commonUserMapper.findByUserphone(user_phone);
        if(commonUser==null){
            return 1;
        }else{
            //判断取件码是否冲突
            Parcel p =  parcelMapper.searchByCodeAccurate(commonUser.getUsername(),code);
            if(p!=null){
                return 2;
            }
            long msb = System.currentTimeMillis();
            long lsb = System.currentTimeMillis();
            UUID uuidConstructor = new UUID(msb, lsb);
            String uuid = uuidConstructor.toString();
            parcelMapper._insertParcel(uuid,commonUser.getUsername(),user_phone,company,code,new Date(System.currentTimeMillis()),new Date(0),0, admin.getPhone());
        }
        return 0;

    }
}
