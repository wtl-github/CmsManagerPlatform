package com.sgnbs.cms.pojo;


public class ProcessResult {

    private String result;
    private String description;
    private Object detail;

    public ProcessResult() {
    }

    public ProcessResult(String result, String description, Object detail) {
        this.result = result;
        this.description = description;
        this.detail = detail;
    }
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Object getDetail() {
        return detail;
    }

    public void setDetail(Object detail) {
        this.detail = detail;
    }

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
    
}
