package com.benniao.dto;

public class Account<T> {
    /**
     * 0:成功 1:账户不存在 2:密码错误
     */
    public Integer loginStatus;
    public T user;
}
