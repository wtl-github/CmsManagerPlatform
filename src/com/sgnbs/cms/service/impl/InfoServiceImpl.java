package com.sgnbs.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgnbs.cms.dao.intf.InfoDao;
import com.sgnbs.cms.entity.Info;
import com.sgnbs.cms.entity.Page;
import com.sgnbs.cms.service.intf.InfoService;

@Service
public class InfoServiceImpl implements InfoService{

	@Autowired
	private InfoDao infoDao;
	
	public List<Info> listPageInfo(Page page) {
		return infoDao.listPageInfo(page);
	}
}
