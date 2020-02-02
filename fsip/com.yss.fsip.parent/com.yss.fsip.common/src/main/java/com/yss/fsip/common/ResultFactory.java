package com.yss.fsip.common;

/**
 * resultVO 工具类
 * 
 * @author LSP
 *
 */
public class ResultFactory {
	
	public static Result success(Object object) {
        return createResult(FSIPErrorCode.SUCCESS_CODE,FSIPErrorCode.SUCCESS_MSG, object);
    }

    public static Result success() {
        return createResult(FSIPErrorCode.SUCCESS_CODE,FSIPErrorCode.SUCCESS_MSG);
    }
    
    public static Result error(String code,String msg) {
        return createResult(code, msg);
    }
    
    public static Result error(String code,String msg, String position) {
        return createResult(code, msg, position, null);
    }
    
    private static Result createResult(String code, String msg, Object object) {
    	return new Result(code, msg, null, object);
    }
    
    private static Result createResult(String code, String msg) {
    	return createResult(code, msg, null, null);
    }
    

    private static Result createResult(String code, String msg, String position, Object object) {
    	return new Result(code, msg, position, object);
    }
}
