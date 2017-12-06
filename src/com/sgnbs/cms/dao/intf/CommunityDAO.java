package com.sgnbs.cms.dao.intf;

import java.util.List;

import com.sgnbs.cms.entity.Community;

public interface CommunityDAO {

	List<Community> listPageCommunity(Community community);

	Community getCommunityById(String id);

	void update(Community community);

	void insert(Community community);

}
