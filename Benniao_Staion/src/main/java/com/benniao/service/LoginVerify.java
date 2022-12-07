package com.benniao.service;

import com.benniao.dto.AccountLoginStatus;

import java.io.IOException;

public interface LoginVerify {
    AccountLoginStatus verify(String un, String pw, Integer ut) throws IOException;
}
