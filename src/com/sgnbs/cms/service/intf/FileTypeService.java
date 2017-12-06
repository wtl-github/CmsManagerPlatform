package com.sgnbs.cms.service.intf;

import java.util.List;

import com.sgnbs.cms.entity.FileType;
import com.sgnbs.cms.pojo.MallOneList;

public interface FileTypeService {
	List<FileType> getTypelist(String typecode,String level);
	
	FileType getTypeSuper(String typecode);
	
	List<FileType> getSubTypelist(String typecode,String level);
	
	List<MallOneList> getThreeLevelData();
}
