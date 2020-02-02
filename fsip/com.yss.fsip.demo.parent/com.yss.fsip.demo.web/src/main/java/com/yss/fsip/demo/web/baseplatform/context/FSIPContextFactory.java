package com.yss.fsip.demo.web.baseplatform.context;

import com.yss.fsip.common.util.JWTTokenUtil;
import com.yss.fsip.common.util.StringUtil;
import com.yss.fsip.demo.web.baseplatform.util.CookieUtil;
import com.yss.fsip.demo.web.baseplatform.util.FSIPConstants;
import com.yss.fsip.demo.web.baseplatform.util.JWTSessionUtil;
import io.jsonwebtoken.Claims;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Locale;
import java.util.Map.Entry;

public class FSIPContextFactory {
	
    static Logger log = LoggerFactory.getLogger(FSIPContextFactory.class);
    
    private static InheritableThreadLocal<FSIPContext> contexts = new InheritableThreadLocal<FSIPContext>();
   
    public static FSIPContext getContext() {
        return contexts.get();
    }
    
    public static void remove() {
        contexts.remove();
    }
    /**
     * 创建FsipContext上下文
     * 
     * @param request
     * @return
     */
    public static FSIPContext createContext(ServletRequest request) {
        FSIPContext context = new FSIPContext();
        contexts.set(context);
        log.debug("已将上下文关联到线程：" + Thread.currentThread().getId());
        setUserParams(request, context);
        context.setAttribute("fullContextPath", getFullContextPath((HttpServletRequest) request));
        // 将用户IP设置到Context中
        context.setRemoteAddress(getIp(request)); 
        // TODO 获取工作模式：从公共配置文件中获取
        context.setWorkMode(getWorkMode(request));

        context.setLoggerTrackId(null);
        
        return context;
    }

    /**
     * 维护用户相关信息
     * 
     * @param request
     * @param context
     */
    private static void setUserParams(ServletRequest request, FSIPContext context) {
        try {
            if (request != null) {
            	String cookieId = CookieUtil.getSessionIdCookie((HttpServletRequest)request);
            	log.info("FSIPContextFactory.setUserParams sessionId={},threadId={}", cookieId,Thread.currentThread().getId());
            	if(!StringUtil.isEmpty(cookieId)) {
            		Claims claims = JWTTokenUtil.parseJWT(JWTSessionUtil.getJwt(cookieId), FSIPConstants.SECRET_KEY);
            		if(!StringUtil.isEmpty(claims.get("userId"))) {
                		context.setUserId(claims.get("userId").toString());
            		}
            		for(Entry<String, Object> entry : claims.entrySet()) {
            			context.setAttribute(entry.getKey(), entry.getValue().toString());
            		}
            	}
            	
            } else {
                log.debug("ServletRequest is null,不能填充上下文对象");
            }
        } catch (Exception e) {
            log.warn("FSIPContext setContext :" + e.getMessage(), e);
        }

    }

    /**
     * 获取用户IP.
     * @param request
     * @return String
     */
    private static String getIp(ServletRequest request) {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String ip = httpRequest.getParameter("clientAddress");
        if (ip == null) {
            ip = httpRequest.getHeader("clientAddress");
        }
        if (ip == null) {
            ip = httpRequest.getHeader("x-forwarded-for");
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = httpRequest.getHeader("Proxy-Client-IP");
            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = httpRequest.getHeader("WL-Proxy-Client-IP");
            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getRemoteAddr();
            }
        }
        return ip;
    }

    private static Locale getLocal(ServletRequest request) {

        return Locale.CHINA;
    }

    /**
     * 将当前的BasePath保存到session中
     * @param httpRequest
     */
    private static String getFullContextPath(HttpServletRequest httpRequest) {

        HttpSession session = httpRequest.getSession(false);
        String basePath = httpRequest.getScheme() + "://" + httpRequest.getServerName() + ":"
                + httpRequest.getServerPort() + httpRequest.getContextPath();
        if (session != null) {

            session.setAttribute("basePath", basePath);
        }
        return basePath;
    }

    /**
     * @param request
     * @return
     */
    private static String getWorkMode(ServletRequest request) {

        return "";
    }
}
