package com.sgnbs.cms.service.intf;

import java.util.List;

import com.sgnbs.cms.entity.Community;

public interface CommunityService {

	List<Community> listPageCommunity(Community community);

	Community getCommunityById(String id);

	boolean save(Community community);

}
