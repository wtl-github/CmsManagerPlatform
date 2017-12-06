package com.sgnbs.cms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgnbs.cms.dao.intf.SysLogDao;
import com.sgnbs.cms.entity.SysLog;
import com.sgnbs.cms.service.intf.SysLogService;

@Service
public class SysLogServiceImpl implements SysLogService{
	
	@Autowired
	private SysLogDao accountSysLogDao;
	public void insertSysLog(SysLog accountSysLog){
		accountSysLogDao.insertSysLog(accountSysLog);
	}
	
}
