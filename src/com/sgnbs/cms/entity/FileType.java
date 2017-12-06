package com.sgnbs.cms.entity;

public class FileType {
	private Integer id;
	private String typeCode;
	private String superCode;
	private String typeName;
	private String level;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}
	public String getSuperCode() {
		return superCode;
	}
	public void setSuperCode(String superCode) {
		this.superCode = superCode;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	
}
