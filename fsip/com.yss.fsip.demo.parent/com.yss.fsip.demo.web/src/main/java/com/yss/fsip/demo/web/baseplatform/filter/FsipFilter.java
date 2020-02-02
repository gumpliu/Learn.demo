package com.yss.fsip.demo.web.baseplatform.filter;

import com.yss.fsip.common.util.HttpClient;
import com.yss.fsip.common.util.JWTTokenUtil;
import com.yss.fsip.common.util.StringUtil;
import com.yss.fsip.demo.web.baseplatform.config.FsipConfig;
import com.yss.fsip.demo.web.baseplatform.util.CookieUtil;
import com.yss.fsip.demo.web.baseplatform.util.FSIPConstants;
import com.yss.fsip.demo.web.baseplatform.util.JWTSessionUtil;
import io.jsonwebtoken.Claims;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * jwt 认证filter
 * 
 * @author LSP
 *
 */
@Order(1)
@WebFilter(filterName = "firstFilter", urlPatterns = "/*")
@Configuration
public class FsipFilter implements Filter {
	
	private Logger logger = LoggerFactory.getLogger(FsipFilter.class);
	
	@Autowired
	private FsipConfig fsipConfig;
	
	//TODO 需移动至配置文件
	private String excludedPaths = "/static/*,/templates/*,*.html,*.js,*.ico,*.png,*jpeg";

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;

		if (isFilterExcludeRequest(httpServletRequest) 
				|| cookieAuthentication(httpServletRequest) 
				|| sofaAuthentication(httpServletRequest, httpServletResponse)) {
			chain.doFilter(request, response);
		} else {
			//TODO 可以自行处理，返回500错误页面
//			throw new FSIPRuntimeException(FSIPErrorCode.AUTHENTICATION_FAIL_CODE, FSIPErrorCode.AUTHENTICATION_FAIL_MSG);
			//输出json
//			Result result =  ResultFactory.error(FSIPErrorCode.AUTHENTICATION_FAIL_CODE, FSIPErrorCode.AUTHENTICATION_FAIL_MSG);	
//			PrintWriter out = null;  
//            try {  
//                out = response.getWriter(); 
//                out.print(JSON.toJSONString(result));
//            } catch (IOException e) {  
//                e.printStackTrace();  
//            }finally {
//	            out.flush();  
//			}
//            return;
			//放行
			chain.doFilter(request, response);

		}
	}

	/**
	 * sofa 请求认证
	 * 
	 * @param httpServletRequest
	 * @param response
	 * @return
	 */
	private boolean sofaAuthentication(HttpServletRequest httpServletRequest, HttpServletResponse response) {
		String jwtToken = httpServletRequest.getHeader(FSIPConstants.SOFA_JWT_KEY);
		String sofaSessionId = httpServletRequest.getHeader(FSIPConstants.SOFA_SESSION_ID);

		if (StringUtil.isEmpty(jwtToken) || StringUtil.isEmpty(sofaSessionId)) {
			return false;
		}

		if (JWTTokenUtil.isVerify(jwtToken, FSIPConstants.SECRET_KEY)) {
			JWTSessionUtil.putSessionJwt(sofaSessionId, jwtToken);
			JWTSessionUtil.updateSessionTime(sofaSessionId);
			CookieUtil.putCookie(response, CookieUtil.SESSION_COOKIE_ID, sofaSessionId);
			return true;
		}
		return false;
	}

	/**
	 * cookie jwt 认证
	 * 
	 * @param httpServletRequest
	 * @return
	 */
	private boolean cookieAuthentication(HttpServletRequest httpServletRequest) {
		String cookieId = CookieUtil.getSessionIdCookie(httpServletRequest);

		if (StringUtil.isEmpty(cookieId)) {
			return false;
		}
		
		Claims claims = JWTTokenUtil.parseJWT(JWTSessionUtil.getJwt(cookieId), FSIPConstants.SECRET_KEY);
		long expireTime = (long) claims.get("expire");
		if (expireTime > System.currentTimeMillis() + FSIPConstants.JWT_REFRESH_TIME) {
			JWTSessionUtil.updateSessionTime(cookieId);
			return true;
		} else {
			return refreshJwt(cookieId);
		}
	}
	
	/**
	 * 刷新jwt, 失败重试三次
	 * 
	 * @param sessionId
	 * @return
	 */
	private boolean refreshJwt(String sessionId) {
		boolean refresh = false;
		for(int i = 0; i < 3; i++) {
			try {
				HttpClient httpClient = new HttpClient();
				Map<String, String> heards = new HashMap<String, String>();
				heards.put(FSIPConstants.SOFA_SESSION_ID, sessionId);
				heards.put(FSIPConstants.SOFA_JWT_KEY, JWTSessionUtil.getJwt(sessionId));
				String returnJson = httpClient.sendPost(fsipConfig.getSofaUrl() + "/sofa-sso/refreshJwt ", null, heards);
				if(returnJson.equals("false")) {
					JWTSessionUtil.removeSessionJwtTime(sessionId);
					refresh = false;
				}else {
					JWTSessionUtil.putSessionJwt(sessionId, returnJson);
					JWTSessionUtil.updateSessionTime(sessionId);
					refresh = true;
				}
				break;
			}catch (Exception e) {
				logger.error("refresh jwt fail, sessionId is {}. error msg ={}",sessionId,  e.getMessage());
				continue;
			}
		}
		return refresh;
	}
	

	/**
	 * 判断是否是 过滤器直接放行的请求 <br/>
	 * 主要用于静态资源的放行
	 */
	private boolean isFilterExcludeRequest(HttpServletRequest request) {
		
		String []  excludedPathArray = excludedPaths.split(",");

		if (null != excludedPathArray && excludedPathArray.length > 0) {
			String url = request.getRequestURI();
			for (String ecludedUrl : excludedPathArray) {
				if (ecludedUrl.startsWith("*.")) {
					// 如果配置的是后缀匹配, 则把前面的*号干掉，然后用endWith来判断
					if (url.endsWith(ecludedUrl.substring(1))) {
						return true;
					}
				} else if (ecludedUrl.endsWith("/*")) {
					if (!ecludedUrl.startsWith("/")) {
						// 前缀匹配，必须要是/开头
						ecludedUrl = "/" + ecludedUrl;
					}
					// 如果配置是前缀匹配, 则把最后的*号干掉，然后startWith来判断
					String prffixStr = request.getContextPath() + ecludedUrl.substring(0, ecludedUrl.length() - 1);
					if (url.startsWith(prffixStr)) {
						return true;
					}
				} else {
					// 如果不是前缀匹配也不是后缀匹配,那就是全路径匹配
					if (!ecludedUrl.startsWith("/")) {
						// 全路径匹配，也必须要是/开头
						ecludedUrl = "/" + ecludedUrl;
					}
					String targetUrl = request.getContextPath() + ecludedUrl;
					if (url.equals(targetUrl)) {
						return true;
					}
				}
			}
		}
		return false;
	}
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
}
