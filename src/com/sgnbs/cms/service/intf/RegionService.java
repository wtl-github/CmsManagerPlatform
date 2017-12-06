package com.sgnbs.cms.service.intf;

import java.util.List;

import com.sgnbs.cms.entity.Region;

public interface RegionService {

	List<Region> listPageRegion(Region region);

	Region getRegionById(String regionId);

	boolean save(Region region);

	void deleteRegion(Region region);

	void deleteRegions(String regionIds);

}
