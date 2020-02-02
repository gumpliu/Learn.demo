package com.yss.fsip.demo.web.baseplatform.context;

import java.util.Map.Entry;
import java.util.Set;

/**
 * FSIP上下文API
 * 
 * @author LSP
 *
 */
public class FSIPContext {
	/**
	 * 用户ID
	 */
	private String userId;
	/**
	 * 客户端IP
	 */
	private String remoteAddress = "";

	/**
	 * 工作模式
	 */
	private String workMode = "";
	/**
	 * 请求ID
	 */
	private String requestId = "";

	/** 用户名 */
	private String userName = "";
	/**
	 * 登录名称
	 */
	private String loginName = null;
	
	/**
	 * 日志轨迹ID
	 */
	private String loggerTrackId = null;
	
	private String userCode;
	private String functionCode = "N";
	private String operationId = "N";
	private String proxyGrantingTicket;


	public String getAttribute(String key) {
		return ContextSupport.getParameter(key);
	}

	public void removeAttribute(String key) {
		ContextSupport.removeParameter(key);
	}


	public String getRemoteAddress() {

		return this.remoteAddress;
	}


	public String getUserId() {
		return this.userId;
	}

	public String getWorkMode() {

		return this.workMode;
	}

	public void setAttribute(String key, String value) {

		ContextSupport.setParameter(key, value);
	}

	/**
	 * 设置IP地址
	 * 
	 * @param remoteAddress
	 *            IP地址
	 */
	public void setRemoteAddress(String remoteAddress) {

		this.remoteAddress = remoteAddress;
	}

	/**
	 * 设置工作模式
	 * 
	 * @param workMode
	 *            工作模式
	 */
	public void setWorkMode(String workMode) {

		this.workMode = workMode;
	}

	private long threadId = 0;

	/**
	 * @return 线程ID
	 */
	public long getThreadId() {

		return threadId;
	}

	/**
	 * @param threadId
	 *            线程ID
	 */
	public void setThreadId(long threadId) {

		this.threadId = threadId;
	}

	public String getRequestId() {

		return this.requestId;
	}

	/**
	 * 设置请求ID
	 * 
	 * @param requestId
	 *            请求ID
	 */
	public void setRequestId(String requestId) {

		this.requestId = requestId;

	}

	public Set<Entry<String, String>> getAttributes() {

		return ContextSupport.getParameters().entrySet();
	}

	public String getFunctionCode() {

		return functionCode;
	}

	public void setFunctionCode(String functionCode) {

		this.functionCode = functionCode;
	}

	public String getOperationId() {

		return operationId;
	}

	public void setOperationId(String operationId) {

		this.operationId = operationId;
	}

	public void setUserName(String userName) {

		this.userName = userName;
	}

	public String getUserName() {

		return this.userName;
	}

	public String getLoginName() {

		if (loginName == null) loginName = getAttribute("FLOGIN_CODE");

		return loginName;
	}

	public void setLoginName(String loginName) {

		this.loginName = loginName;
	}

	public void setUserId(String userId) {

		this.userId = userId;

	}

	public String getUserCode() {

		return this.userCode;
	}

	
	/**
	 * @param userCode the userCode to set
	 */
	public void setUserCode(String userCode) {
	
		this.userCode = userCode;
	}

	
	public String getLoggerTrackId() {
	
		return loggerTrackId;
	}
	
	public void setLoggerTrackId(String loggerTrackId) {
	
		this.loggerTrackId = loggerTrackId;
	}

	public String getProxyGrantingTicket() {

		return proxyGrantingTicket;
	}

	public void setProxyGrantingTicket(String proxyGrantingTicket) {

		this.proxyGrantingTicket = proxyGrantingTicket;
	}

    @Override
    public String toString() {
        return "SOFAContextImpl [userId=" + userId + ", remoteAddress=" + remoteAddress 
                + ", workMode=" + workMode + ", requestId=" + requestId + ", userName=" + userName + ", loginName="
                + loginName + ", loggerTrackId=" + loggerTrackId + ", userCode=" + userCode + ", functionCode="
                + functionCode + ", operationId=" + operationId + ", proxyGrantingTicket=" + proxyGrantingTicket
                + ", threadId=" + threadId + "]";
    }
}
