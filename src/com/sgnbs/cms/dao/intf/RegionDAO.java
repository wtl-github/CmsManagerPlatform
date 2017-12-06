package com.sgnbs.cms.dao.intf;

import java.util.List;

import com.sgnbs.cms.entity.Region;

public interface RegionDAO {

	List<Region> listPageRegion(Region region);

	Region getRegionById(String regionId);

	void update(Region region);

	void insert(Region region);

	String getMaxId();

	void deleteRegion(Region region);

}
