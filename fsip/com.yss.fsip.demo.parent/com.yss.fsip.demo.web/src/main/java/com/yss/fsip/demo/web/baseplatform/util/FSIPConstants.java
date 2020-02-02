package com.yss.fsip.demo.web.baseplatform.util;

/**
 * FSIP 公共常量
 * @author LSP
 *
 */
public final class FSIPConstants {

    /**
     * SOFA_HOME 默认相对路径
     */
    public static final String SECRET_KEY = "123456";
    
    public static final String CLSSPATH_PREFIX = "classpath:";
    
    public static final String FILE_PREFIX = "file:.";
    
    public static final String SOFA_JWT_KEY = "Authorization";
    
    public static final String SOFA_SESSION_ID = "SOFAJSESSIONID";
    //定时轮休时间间隔
	public final static long INTERVAL_TIME = 60 * 1000;
	//jwt有效时间
	public final static long JWT_REFRESH_TIME = 30 * 60 * 1000;




 
}
