package com.gump.activity.bean;

public class ProcessDefinitionVo {

	private String id;
	private String key;
	private int version;
	private String startFormUrl;
	  	
	public ProcessDefinitionVo() {
		super();
	}

	public ProcessDefinitionVo(String id, String key, int version, String startFormUrl) {
		super();
		this.id = id;
		this.key = key;
		this.version = version;
		this.startFormUrl = startFormUrl;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}

	public String getStartFormUrl() {
		return startFormUrl;
	}

	public void setStartFormUrl(String startFormUrl) {
		this.startFormUrl = startFormUrl;
	}
	
}
