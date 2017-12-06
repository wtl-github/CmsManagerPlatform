package com.sgnbs.cms.service.intf;

import java.util.List;

import com.sgnbs.cms.entity.Info;
import com.sgnbs.cms.entity.Page;

public interface InfoService {
	List<Info> listPageInfo(Page page);
}
