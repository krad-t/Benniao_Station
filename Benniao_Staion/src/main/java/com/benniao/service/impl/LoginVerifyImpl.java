package com.benniao.service.impl;

import com.benniao.dao.CommonUserMapper;
import com.benniao.dao.SystemAdminMapper;
import com.benniao.dto.AccountLoginStatus;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Service;

import com.benniao.entity.*;

import java.io.IOException;
import java.io.InputStream;
import java.util.Objects;

@Service
public class LoginVerifyImpl implements com.benniao.service.LoginVerify {
    @Override
    public AccountLoginStatus verify(String un, String pw, Integer ut) throws IOException {
        AccountLoginStatus accountLoginStatus = new AccountLoginStatus<>();
        String res = "mybatis-config.xml";
        InputStream in = Resources.getResourceAsStream(res);
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
        SqlSession sqlSession = factory.openSession();

        SystemAdminMapper systemAdminMapper = sqlSession.getMapper(SystemAdminMapper.class);
        CommonUserMapper commonUserMapper = sqlSession.getMapper(CommonUserMapper.class);

        switch (ut) {
            case 1:
                SystemAdmin sa  = systemAdminMapper.findByUsername(un);
                if (sa == null) {
                    System.out.println("账户不存在");
                    accountLoginStatus.loginStatus = 1;
                } else {
                    if (!Objects.equals(sa.getPassword(), pw)) {
                        System.out.println("密码不存在");
                        accountLoginStatus.loginStatus = 2;
                    } else {
                        accountLoginStatus.loginStatus = 0;
                        accountLoginStatus.user = sa;
                    }
                }
                break;
            case 0:
                CommonUser cu  = commonUserMapper.findByUsername(un);
                if (cu == null) {
                    System.out.println("账户不存在");
                    accountLoginStatus.loginStatus = 1;
                } else {
                    if (!Objects.equals(cu.getPassword(), pw)) {
                        System.out.println("密码不存在");
                        accountLoginStatus.loginStatus = 2;
                    } else {
                        accountLoginStatus.loginStatus = 0;
                        accountLoginStatus.user = cu;
                    }
                }
                break;
        }
        return accountLoginStatus;
    }


}
