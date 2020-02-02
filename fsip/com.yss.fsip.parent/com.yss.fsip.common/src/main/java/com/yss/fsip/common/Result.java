package com.yss.fsip.common;

import java.io.Serializable;

import com.yss.fsip.common.util.StringUtil;
/**
 * web返回信息
 * 
 * @author LSP
 *
 * @param <T>
 */
public class Result implements Serializable {
	
    private static final long serialVersionUID = 4564124491192825748L;
    
    private boolean success;
	
	private String code;
	
	private String msg;
	
	private String position;
	
	private Object data;
	
	public Result() {}
	
	public Result(String code, String message) {
		this(code, message, null, null);
	}
	
	public Result(String code, String message,String position) {
		this(code, message, position, null);
	}


	public Result(String code, String message, String position, Object data) {
		this.data = data;
		this.code = code;
		this.position = position;
		this.msg = message;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public boolean isSuccess() {
		if(StringUtil.isEmpty(code)) {
			return false;
		}
		
		return code.equals(FSIPErrorCode.SUCCESS_CODE);
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}
	
}
