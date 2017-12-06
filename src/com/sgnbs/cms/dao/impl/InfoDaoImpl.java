package com.sgnbs.cms.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sgnbs.cms.dao.BaseDao;
import com.sgnbs.cms.dao.intf.InfoDao;
import com.sgnbs.cms.entity.Info;
import com.sgnbs.cms.entity.Page;

@Repository
public class InfoDaoImpl extends BaseDao implements InfoDao {

	@Override
	public List<Info> listPageInfo(Page page) {
		return this.getSqlSession().selectList("com.sgnbs.cms.dao.intf.InfoDao.listPageInfo",page);
	}
}
