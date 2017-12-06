package com.sgnbs.cms.entity;

import java.util.Date;

public class SysLog {
	private Integer id;
	private Integer userId;
	private String optionDesc;
	private String optionIp;
	private String optionMethod;
	private Date optionTime;
	private String parame;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getOptionDesc() {
		return optionDesc;
	}
	public void setOptionDesc(String optionDesc) {
		this.optionDesc = optionDesc;
	}
	public String getOptionIp() {
		return optionIp;
	}
	public void setOptionIp(String optionIp) {
		this.optionIp = optionIp;
	}
	public String getOptionMethod() {
		return optionMethod;
	}
	public void setOptionMethod(String optionMethod) {
		this.optionMethod = optionMethod;
	}
	public Date getOptionTime() {
		return optionTime;
	}
	public void setOptionTime(Date optionTime) {
		this.optionTime = optionTime;
	}
	public String getParame() {
		return parame;
	}
	public void setParame(String parame) {
		this.parame = parame;
	}
	
}
