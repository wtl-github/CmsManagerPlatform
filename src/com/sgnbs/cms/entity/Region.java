package com.sgnbs.cms.entity;

public class Region {
	
    private String regionId;
    private String regionName;
    private String regionAddress;
    private String regionDescription;
    private Integer regionAcreage;
    private Integer regionDelstatus = 0;
    private String subdistrictId;
    private String attachmentid;
    
    private Page page;
    
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

    public String getRegionAddress() {
        return regionAddress;
    }

    public void setRegionAddress(String regionAddress) {
        this.regionAddress = regionAddress == null ? null : regionAddress.trim();
    }

    public String getRegionDescription() {
        return regionDescription;
    }

    public void setRegionDescription(String regionDescription) {
        this.regionDescription = regionDescription == null ? null : regionDescription.trim();
    }

    public Integer getRegionAcreage() {
        return regionAcreage;
    }

    public void setRegionAcreage(Integer regionAcreage) {
        this.regionAcreage = regionAcreage;
    }

    public Integer getRegionDelstatus() {
        return regionDelstatus;
    }

    public void setRegionDelstatus(Integer regionDelstatus) {
        this.regionDelstatus = regionDelstatus;
    }

    public String getSubdistrictId() {
        return subdistrictId;
    }

    public void setSubdistrictId(String subdistrictId) {
        this.subdistrictId = subdistrictId == null ? null : subdistrictId.trim();
    }

    public String getAttachmentid() {
        return attachmentid;
    }

    public void setAttachmentid(String attachmentid) {
        this.attachmentid = attachmentid == null ? null : attachmentid.trim();
    }

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}
}