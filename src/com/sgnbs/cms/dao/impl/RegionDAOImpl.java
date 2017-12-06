package com.sgnbs.cms.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sgnbs.cms.dao.BaseDao;
import com.sgnbs.cms.dao.intf.RegionDAO;
import com.sgnbs.cms.entity.Region;

@Repository
public class RegionDAOImpl extends BaseDao implements RegionDAO{

	@Override
	public List<Region> listPageRegion(Region region) {
		return this.getSqlSession().selectList("com.sgnbs.cms.dao.intf.RegionDAO.listPageRegion", region);
	}

	@Override
	public Region getRegionById(String regionId) {
		return this.getSqlSession().selectOne("com.sgnbs.cms.dao.intf.RegionDAO.getRegionById", regionId);
	}

	@Override
	public void update(Region region) {
		this.getSqlSession().update("com.sgnbs.cms.dao.intf.RegionDAO.update", region);
	}

	@Override
	public void insert(Region region) {
		this.getSqlSession().insert("com.sgnbs.cms.dao.intf.RegionDAO.insert", region);
	}

	@Override
	public String getMaxId() {
		return this.getSqlSession().selectOne("com.sgnbs.cms.dao.intf.RegionDAO.getRegionMaxId");
	}

	@Override
	public void deleteRegion(Region region) {
		this.getSqlSession().update("com.sgnbs.cms.dao.intf.RegionDAO.delete", region);
	}

}
