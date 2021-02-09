package com.akila.vle.dao;

import com.akila.vle.bean.LoginBean;
import com.akila.vle.bean.PasswordBean;
import com.akila.vle.bean.UserBean;

import java.security.NoSuchAlgorithmException;

public interface LoginDao {
    public UserBean getLoggedUser(String username);

    public int updatePassword(String username, PasswordBean passwordBean) throws NoSuchAlgorithmException;
    public int updateProfile(String col, String val,String username);
    public String getLecture(int fID);
}
