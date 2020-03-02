package com.yss.fsip.web.filter;

import com.yss.fsip.context.FSIPContext;
import com.yss.fsip.context.FSIPContextFactory;
import com.yss.fsip.util.BeanUtil;
import com.yss.fsip.web.context.FSIPWebContextFactory;
import com.yss.fsip.web.context.FSIPWebContextFactoryImpi;
import com.yss.fsip.web.utils.CookieUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;
import org.springframework.util.StringUtils;

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
@Order
@WebFilter(filterName = "contextFilter", urlPatterns = "/*")
public class ContextFilter implements Filter {
	
	private Logger logger = LoggerFactory.getLogger(ContextFilter.class);

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		if(StringUtils.isEmpty(CookieUtils.getSessionIdCookie(httpServletRequest))) {
			FSIPContext fsipContext = getContextFactory(request).createContext();
			fsipContext.getUserId();
		}
		chain.doFilter(request, response);
	}
	//兼容filter 低版本，低版本没有默认实现
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

	//兼容filter 低版本，低版本没有默认实现
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}

	private FSIPContextFactory getContextFactory(ServletRequest request){

		FSIPWebContextFactory factory = BeanUtil.getBean(FSIPWebContextFactory.class);

		if(factory == null){
			factory = new FSIPWebContextFactoryImpi();
		}

		factory.setRequest(request);

		return factory;
	}
}
