package com.sgnbs.cms.result;

import java.util.List;

public class ArrayResp extends BaseResp {
	private List<?> detail;

	public List<?> getDetail() {
		return detail;
	}

	public void setDetail(List<?> detail) {
		this.detail = detail;
	}
}
