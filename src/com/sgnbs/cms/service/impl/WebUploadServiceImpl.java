package com.sgnbs.cms.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sgnbs.cms.dao.intf.AttachmentDAO;
import com.sgnbs.cms.dao.intf.WebUploadDao;
import com.sgnbs.cms.entity.Attachment;
import com.sgnbs.cms.entity.WebUpload;
import com.sgnbs.cms.service.intf.WebUploadService;
import com.sgnbs.cms.util.Config;

@Service
public class WebUploadServiceImpl implements WebUploadService {

	@Autowired
	private WebUploadDao webUploadDao;
	
	@Autowired
	private AttachmentDAO attachmentDAO;
	
	
	@Override
	public List<WebUpload> listPageWebUploadByUserID(WebUpload webUpload) {
		return webUploadDao.listPageWebUploadByUserID(webUpload);
	}

	@Override
	public List<WebUpload> listPageWebUpload(WebUpload webUpload) {
		return webUploadDao.listPageWebUpload(webUpload);
	}

	@Override
	public void insertWebUpload(Map<String, String> param) {
		webUploadDao.insertWebUpload(param);
	}

	@Override
	public String getUploadName(List<MultipartFile> uploadFiles) {
		if (uploadFiles != null && uploadFiles.size() > 0) {
			// 插入附件表
			String path = Config.getProperty("base.url");
			String uploadurl = Config.getProperty("base.upload");
			String ftpPath = Config.getProperty("ftpPath.url");
			StringBuffer buff = new StringBuffer();
			for (MultipartFile multipartFile : uploadFiles) {
				Attachment attachment = new Attachment();
				attachment.setName(multipartFile.getOriginalFilename());
				attachment.setUrl(ftpPath);
				attachment.setShowUrl(path + uploadurl
						+ multipartFile.getOriginalFilename());
				buff.append(attachmentDAO.insertAttachment(attachment));
				buff.append(",");
			}
			String buffStr = buff.toString();
			return buffStr.substring(0, buffStr.length() - 1);
		}
		return null;
	}

	@Override
	public WebUpload getWebUploadByUploadId(int uploadid) {
		return webUploadDao.getWebUploadByUploadId(uploadid);
	}

	@Override
	public void updateWebUploadStatus(WebUpload webUpload) {
		webUploadDao.updateWebUploadStatus(webUpload);
	}

	@Override
	public List<Attachment> getAttachment(List<String> param) {
		return attachmentDAO.getAttachmentByIds(param);
	}

	@Override
	public void updateWebUpload(WebUpload webUpload) {
		webUploadDao.updateWebUpload(webUpload);
		
	}
}
