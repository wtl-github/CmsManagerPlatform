package com.sgnbs.cms.dao.impl;

import org.springframework.stereotype.Repository;

import com.sgnbs.cms.dao.BaseDao;
import com.sgnbs.cms.dao.intf.SysLogDao;
import com.sgnbs.cms.entity.SysLog;

@Repository
public class SysLogDaoImpl extends BaseDao implements SysLogDao{
	@Override
	public void insertSysLog(SysLog accountSysLog){
		this.getSqlSession().insert("com.sgnbs.cms.dao.intf.SysLogDao.insertSysLog",accountSysLog);
	}
}
