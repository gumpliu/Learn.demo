package com.yss.fsip.demo.web.interfaces.dto.user;

/**
 * @Author: gumpLiu
 * @Date: 2019-12-02 16:18
 */
public class User {

    private String userName;
    private String pwd;
    private String email;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
