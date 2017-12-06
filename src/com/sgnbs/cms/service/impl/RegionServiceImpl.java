package com.sgnbs.cms.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgnbs.cms.dao.intf.RegionDAO;
import com.sgnbs.cms.entity.Region;
import com.sgnbs.cms.service.intf.RegionService;

@Service
public class RegionServiceImpl implements RegionService{

	@Autowired
	private RegionDAO regionDAO;

	@Override
	public List<Region> listPageRegion(Region region) {
		return regionDAO.listPageRegion(region);
	}

	@Override
	public Region getRegionById(String regionId) {
		return regionDAO.getRegionById(regionId);
	}

	@Override
	public boolean save(Region region) {
		try {
			if(StringUtils.isNotBlank(region.getRegionId())){
				regionDAO.update(region);
			}else{
				preHandle(region);
				regionDAO.insert(region);
			}
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	@Override
	public void deleteRegion(Region region) {
		region.setRegionDelstatus(1);
		regionDAO.deleteRegion(region);
	}

	@Override
	public void deleteRegions(String regionIds) {
		String[] regionId = regionIds.split(",");
		for (int i = 0; i < regionId.length; i++) {
			Region region = new Region();
			region.setRegionId(regionId[i]);
			region.setRegionDelstatus(1);
			regionDAO.deleteRegion(region);
		}
	}
	
	/**
	 * 预处理小区表Id 000101   前四位是社区编号  后两位是小区编号
	 * @return
	 */
	public void preHandle(Region region){
		String regionMaxId = regionDAO.getMaxId();
		StringBuilder regionId = new StringBuilder(regionMaxId.substring(0,regionMaxId.length()-2));
		String id = regionMaxId.substring(regionMaxId.length()-2,regionMaxId.length());
		String regionNewId = Integer.toString(Integer.parseInt(id)+1);
		
		region.setRegionId(regionId.append(regionNewId).toString());
		region.setSubdistrictId(regionMaxId.substring(0,regionMaxId.length()-2));
	}

}
