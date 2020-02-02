package com.yss.fsip.demo.web.baseplatform.common;

import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

import com.alibaba.fastjson.JSON;
import com.yss.fsip.common.Result;
import com.yss.fsip.common.ResultFactory;
import com.yss.fsip.web.controller.BaseController;

/**
 * 统一返回结构
 * 
 * @author LSP
 *
 */
@ControllerAdvice
public class ResponseAdvisor implements ResponseBodyAdvice<Object> {

	public boolean supports(MethodParameter returnType, Class<? extends HttpMessageConverter<?>> converterType) {
		return BaseController.class.isAssignableFrom(returnType.getContainingClass())
				|| returnType.getContainingClass().getName().startsWith("com.yss.fsip.demo");
	}

	public Object beforeBodyWrite(Object body, MethodParameter returnType, MediaType selectedContentType,
			Class<? extends HttpMessageConverter<?>> selectedConverterType, ServerHttpRequest request,
			ServerHttpResponse response) {
		
		if (!(body instanceof Result)) {
		    Result result = ResultFactory.success(body);
		    if (body instanceof String) {
		     return JSON.toJSONString(result);
		    }
		    return result;
		   }

		return body;
	}

}