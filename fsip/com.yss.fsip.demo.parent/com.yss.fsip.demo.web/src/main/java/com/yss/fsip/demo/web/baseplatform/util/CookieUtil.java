package com.yss.fsip.demo.web.baseplatform.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 获取console cookie
 * 
 * @author LSP
 * @version 1.0, 2019年6月28日
 * @since 1.0, 2019年6月28日
 */
public class CookieUtil {
	
	private static final Logger logger = LoggerFactory.getLogger(CookieUtil.class);
	
	public static String SESSION_COOKIE_ID = "SESSIONID";

	
	/**
	 * put cookie 
	 * 
	 * @param request
	 * @return
	 */
	public static void putCookie(HttpServletResponse response, String cookieKey, String value) {
		Cookie cookie = new Cookie(cookieKey, value);
		response.addCookie(cookie);
	}
	
	/**
	 * 获取sessionId
	 * 
	 * @param request
	 * @param cookieKey
	 * @return
	 */
	public static String getSessionIdCookie(HttpServletRequest request) {
		return getCookie(request, SESSION_COOKIE_ID);
	}

	
	
	/**
	 * 获取 cookie 
	 * 
	 * @param request
	 * @return
	 */
	public static String getCookie(HttpServletRequest request, String cookieKey) {
		
			Cookie[] cookies = request.getCookies();
			if(cookies != null) {
				for (Cookie cookie : cookies) {
			           if(cookie.getName().equals(cookieKey)) {
			        	   return cookie.getValue();
			           }
			        }
			}
			
			return "";
	}

}
