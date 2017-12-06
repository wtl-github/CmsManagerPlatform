package com.sgnbs.cms.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sgnbs.cms.dao.BaseDao;
import com.sgnbs.cms.dao.intf.WebUploadDao;
import com.sgnbs.cms.entity.WebUpload;

@Repository
public class WebUploadDaoImpl  extends BaseDao implements WebUploadDao {

	@Override
	public List<WebUpload> listPageWebUploadByUserID(WebUpload webUpload) {
		return this.getSqlSession().selectList("com.sgnbs.cms.dao.intf.WebUploadDao.listPageWebUploadByUserID",webUpload);
	}

	@Override
	public List<WebUpload> listPageWebUpload(WebUpload webUpload) {
		return this.getSqlSession().selectList("com.sgnbs.cms.dao.intf.WebUploadDao.listPageWebUpload",webUpload);
	}

	@Override
	public void insertWebUpload(Map<String, String> param) {
		 this.getSqlSession().insert("com.sgnbs.cms.dao.intf.WebUploadDao.insertWebUpload",param);
	}

	@Override
	public WebUpload getWebUploadByUploadId(int uploadid) {
		return  this.getSqlSession().selectOne("com.sgnbs.cms.dao.intf.WebUploadDao.getWebUploadByUploadId",uploadid);
	}

	@Override
	public void updateWebUploadStatus(WebUpload webUpload) {
		 this.getSqlSession().update("com.sgnbs.cms.dao.intf.WebUploadDao.updateWebUploadStatus",webUpload);
	}

	@Override
	public void updateWebUpload(WebUpload webUpload) {
		this.getSqlSession().update("com.sgnbs.cms.dao.intf.WebUploadDao.updateWebUpload",webUpload);
	}

}
