package com.benniao.entity;

public class CommonUser {
    private String uid;
    private String username;
    private String password;
    private String phone;

    public CommonUser(String uid, String username, String password, String phone) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.phone = phone;
    }

    public CommonUser() {
    }

    @Override
    public String toString() {
        return "CommonUser{" +
                "uid='" + uid + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
