package com.sgnbs.cms.result;

import java.util.Map;

public class ObjectResp extends BaseResp {
	private Map<String, ?> detail;

	public Map<String, ?> getDetail() {
		return detail;
	}

	public void setDetail(Map<String, ?> detail) {
		this.detail = detail;
	}

}
