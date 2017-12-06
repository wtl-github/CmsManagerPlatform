package com.sgnbs.cms.pojo;

import java.util.List;

public class MallTwoList {
	private String typeCode;
	private String typeName;
	private List<MallThreeList> mallThreeList;
	
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
	public List<MallThreeList> getMallThreeList() {
		return mallThreeList;
	}
	public void setMallThreeList(List<MallThreeList> mallThreeList) {
		this.mallThreeList = mallThreeList;
	}
	
}
