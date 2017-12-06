package com.sgnbs.cms.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sgnbs.cms.dao.BaseDao;
import com.sgnbs.cms.dao.intf.CommunityDAO;
import com.sgnbs.cms.entity.Community;

@Repository
public class CommunityDAOImpl extends BaseDao implements CommunityDAO{

	@Override
	public List<Community> listPageCommunity(Community community) {
		return this.getSqlSession().selectList("com.sgnbs.cms.dao.intf.CommunityDAO.listPageCommunity", community);
	}

	@Override
	public Community getCommunityById(String id) {
		return this.getSqlSession().selectOne("com.sgnbs.cms.dao.intf.CommunityDAO.getCommunityById", id);
	}

	@Override
	public void update(Community community) {
		this.getSqlSession().update("com.sgnbs.cms.dao.intf.CommunityDAO.update", community);
	}

	@Override
	public void insert(Community community) {
		this.getSqlSession().insert("com.sgnbs.cms.dao.intf.CommunityDAO.insert", community);
	}

}
