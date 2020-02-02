package com.yss.fsip.demo.web.baseplatform.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix="fsip")
public class FsipConfig {
	
	//sofa地址
	private String sofaUrl;
	
	//节点编码
	private String nodeCode;
	

	public String getNodeCode() {
		return nodeCode;
	}

	public void setNodeCode(String nodeCode) {
		this.nodeCode = nodeCode;
	}

	public String getSofaUrl() {
		return sofaUrl;
	}

	public void setSofaUrl(String sofaUrl) {
		this.sofaUrl = sofaUrl;
	}
}
