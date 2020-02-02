package com.yss.fsip.demo.api.vo;

import java.io.Serializable;

public class UserVo implements Serializable {
	
    private String id;
    private String userName;
    private String pwd;
    private String email;
    
    public UserVo() {}
    
    public UserVo(String id, String userName, String pwd, String email) {
    	this.id = id;
    	this.userName = userName;
    	this.pwd = pwd;
    	this.email = email;
    }

    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
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
