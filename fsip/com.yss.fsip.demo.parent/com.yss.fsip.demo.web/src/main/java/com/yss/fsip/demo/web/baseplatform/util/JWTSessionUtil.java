package com.yss.fsip.demo.web.baseplatform.util;

import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 
 * 维护sessionId->jwt 
 *   sessionId->时间
 * 
 * @author LSP
 *
 */
public class JWTSessionUtil {
	//保存session -> 最后访问时间
	private static Map<String, Long> mapSessionTime = new ConcurrentHashMap<String, Long>();
	
	//保存session ->   
	private static Map<String, String> mapSessionJwt = new ConcurrentHashMap<String, String>();
	
	/**
	 * 更新sessionId最后访问时间
	 * 
	 * @param sessionId
	 */
	public static void updateSessionTime(String sessionId) {
		mapSessionTime.put(sessionId, System.currentTimeMillis());
	}
	
	/**
	 * 获取sessionId最后访问时间
	 * 
	 * @param sessionId
	 */
	public static long getSessionTime(String sessionId) {
		return mapSessionTime.get(sessionId);
	}
	
	/**
	 * 获取SessionTime Set<Map.Entry<String, Long>>
	 * 
	 * @return Set<Map.Entry<String, Long>>
	 */
	public static Set<Map.Entry<String, Long>> getSessionTimeSet(){
		return  mapSessionTime.entrySet();
	}
	
	/**
	 * 清理sessionId最后访问时间
	 * 
	 * @param sessionId
	 */
	public static void removeSessionTime(String sessionId) {
		mapSessionTime.remove(sessionId);
	}
	
	/**
	 * 存放sessionId -> jwt
	 * 
	 * @param sessionId
	 * @param jwt
	 */
	public static void putSessionJwt(String sessionId, String jwt) {
		mapSessionJwt.put(sessionId, jwt);
	}
	
	/**
	 * 获取jwt
	 * 
	 * @param sessionId
	 */
	public static String getJwt(String sessionId) {
		return mapSessionJwt.get(sessionId);
	}
	
	/**
	 * 清理 sessionId -> jwt
	 * 
	 * @param sessionId
	 */
	public static void removeSessionJwt(String sessionId) {
		mapSessionJwt.remove(sessionId);
	}
	
	/**
	 * 清理 sessionId -> jwt,time
	 * 
	 * @param sessionId
	 */
	public static void removeSessionJwtTime(String sessionId) {
		removeSessionJwt(sessionId);
		removeSessionTime(sessionId);
	}
	
}
