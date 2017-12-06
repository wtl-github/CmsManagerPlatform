package com.sgnbs.cms.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgnbs.cms.dao.intf.CommunityDAO;
import com.sgnbs.cms.entity.Community;
import com.sgnbs.cms.service.intf.CommunityService;

@Service
public class CommunityServiceImpl implements CommunityService{

	@Autowired
	private CommunityDAO communityDAO;

	@Override
	public List<Community> listPageCommunity(Community community) {
		return communityDAO.listPageCommunity(community);
	}

	@Override
	public Community getCommunityById(String id) {
		return communityDAO.getCommunityById(id);
	}

	@Override
	public boolean save(Community community) {
		try {
			if(StringUtils.isNotBlank(community.getId())){
				communityDAO.update(community);
			}else{
				communityDAO.insert(community);
			}
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
}
