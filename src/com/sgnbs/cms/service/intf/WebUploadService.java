package com.sgnbs.cms.service.intf;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.sgnbs.cms.entity.Attachment;
import com.sgnbs.cms.entity.WebUpload;

public interface WebUploadService {

	List<WebUpload> listPageWebUploadByUserID(WebUpload webUpload);	
	
	List<WebUpload> listPageWebUpload(WebUpload webUpload);
	
	void insertWebUpload(Map<String,String> param);
	
	String getUploadName(List<MultipartFile> uploadFiles);
	
	WebUpload getWebUploadByUploadId(int uploadid);
	
	void updateWebUploadStatus(WebUpload webUpload);
	
	void updateWebUpload(WebUpload webUpload);
	
	List<Attachment> getAttachment(List<String> param);
}
