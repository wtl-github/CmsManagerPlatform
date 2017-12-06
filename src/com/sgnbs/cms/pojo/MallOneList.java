package com.sgnbs.cms.pojo;

import java.util.List;

public class MallOneList {
	
	private String typeCode;
	private String typeName;
	private List<MallTwoList> mallTwoList;
	
	public List<MallTwoList> getMallTwoList() {
		return mallTwoList;
	}
	public void setMallTwoList(List<MallTwoList> mallTwoList) {
		this.mallTwoList = mallTwoList;
	}
	public String getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

}
