package com.yss.fsip.demo.web.baseplatform.util;

import java.util.HashMap;
import java.util.Map;

import com.yss.fsip.common.util.HttpClient;

/**
 * 测试
 * 
 * @author LSP
 *
 */
public class MianHttpClientTest {

	public static void main(String []args) {
		HttpClient httpClient = new HttpClient();
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("pageNumber", "1");
		paramMap.put("pageSize", "3");
		String str = httpClient.sendGet("http://127.0.0.1:8080/user/page", paramMap, null);
		
		System.out.println(str);
	}
	
}
