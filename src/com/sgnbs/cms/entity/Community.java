package com.sgnbs.cms.entity;

public class Community {
	
    private String id;
    private String subdistrictName;
    private String subdistrictAddress;
    private String subdistrictTel;
    private Integer delstatus = 0;
    private String regionId;
    private String regionName;

    private Page page;
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getSubdistrictName() {
        return subdistrictName;
    }

    public void setSubdistrictName(String subdistrictName) {
        this.subdistrictName = subdistrictName == null ? null : subdistrictName.trim();
    }

    public String getSubdistrictAddress() {
        return subdistrictAddress;
    }

    public void setSubdistrictAddress(String subdistrictAddress) {
        this.subdistrictAddress = subdistrictAddress == null ? null : subdistrictAddress.trim();
    }

    public String getSubdistrictTel() {
        return subdistrictTel;
    }

    public void setSubdistrictTel(String subdistrictTel) {
        this.subdistrictTel = subdistrictTel == null ? null : subdistrictTel.trim();
    }

    public Integer getDelstatus() {
        return delstatus;
    }

    public void setDelstatus(Integer delstatus) {
        this.delstatus = delstatus;
    }

    public String getRegionId() {
        return regionId;
    }

    public void setRegionId(String regionId) {
        this.regionId = regionId == null ? null : regionId.trim();
    }

    public String getRegionName() {
        return regionName;
    }

    public void setRegionName(String regionName) {
        this.regionName = regionName == null ? null : regionName.trim();
    }

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}
}