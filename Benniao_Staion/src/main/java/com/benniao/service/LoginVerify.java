package com.benniao.service;

import com.benniao.dto.Account;

import java.io.IOException;

public interface LoginVerify {
    Account verify(String un, String pw, Integer ut) throws IOException;
}
