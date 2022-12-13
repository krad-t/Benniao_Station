package com.benniao.entity;

import cn.hutool.db.DbUtil;
import com.benniao.dao.CheckUserName;

import java.sql.*;

public class checkUserName implements CheckUserName {
    @Override
    public CommonUser CheckUserName(String username) throws SQLException {
        DatabaseMetaData DBUtil = null;
        Connection conn = DBUtil.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        CommonUser commonuser = null;
        String sql = "SELECT username FROM user WHERE username= ? ";
        try{
            ps = conn.prepareStatement(sql);
            ps.setString(1,username);
            rs = ps.executeQuery();
            while (rs.next()){
                commonuser = new CommonUser();
                commonuser.setUsername(rs.getString("username"));
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally {
            DbUtil.close(conn,ps,rs);

        }
        return commonuser;
    }
}
