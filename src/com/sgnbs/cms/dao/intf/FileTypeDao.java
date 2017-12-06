package com.sgnbs.cms.dao.intf;

import java.util.List;

import com.sgnbs.cms.entity.FileType;

public interface FileTypeDao {
	List<FileType> getTypelist(String typecode,String level);
	
	FileType getTypeSuper(String typecode);
	
	List<FileType> getSubTypelist(String typecode,String level);
}
