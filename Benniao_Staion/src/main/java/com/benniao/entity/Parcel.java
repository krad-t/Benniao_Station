package com.benniao.entity;

import java.sql.Date;

public class Parcel {
    private String eid;
    private String username;
    private String user_phone;
    private String company;
    private String code;
    private Date int_time;
    private Date out_time;
    private int status;
    private String admin_phone;

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getInt_time() {
        return int_time;
    }

    public void setInt_time(Date int_time) {
        this.int_time = int_time;
    }

    public Date getOut_time() {
        return out_time;
    }

    public void setOut_time(Date out_time) {
        this.out_time = out_time;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getAdmin_phone() {
        return admin_phone;
    }

    public void setAdmin_phone(String admin_phone) {
        this.admin_phone = admin_phone;
    }

    @Override
    public String toString() {
        return "Parcel{" +
                "eid='" + eid + '\'' +
                ", username='" + username + '\'' +
                ", user_phone='" + user_phone + '\'' +
                ", company='" + company + '\'' +
                ", code='" + code + '\'' +
                ", int_time=" + int_time +
                ", out_time=" + out_time +
                ", status=" + status +
                ", admin_phone='" + admin_phone + '\'' +
                '}';
    }
}
