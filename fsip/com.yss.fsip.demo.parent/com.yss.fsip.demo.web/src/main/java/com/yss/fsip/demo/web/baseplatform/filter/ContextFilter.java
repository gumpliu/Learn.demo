package com.yss.fsip.demo.web.baseplatform.filter;

import com.yss.fsip.common.util.StringUtil;
import com.yss.fsip.demo.web.baseplatform.context.FSIPContextFactory;
import com.yss.fsip.demo.web.baseplatform.util.CookieUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 维护FSIPContext上下文
 * 
 * @author LSP
 *
 */
@Order(2)
@WebFilter(filterName = "contextFilter", urlPatterns = "/*")
@Configuration
public class ContextFilter implements Filter {
	
	private Logger logger = LoggerFactory.getLogger(ContextFilter.class);

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		if(!StringUtil.isEmpty(CookieUtil.getSessionIdCookie(httpServletRequest))) {
			FSIPContextFactory.createContext(httpServletRequest);
		}
		chain.doFilter(request, response);
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
