package com.sgnbs.cms.dao.intf;

import java.util.List;

import com.sgnbs.cms.entity.Info;
import com.sgnbs.cms.entity.Page;

public interface InfoDao {
	List<Info> listPageInfo(Page page);
}
