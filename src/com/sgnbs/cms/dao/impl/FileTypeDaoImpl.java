package com.sgnbs.cms.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sgnbs.cms.dao.BaseDao;
import com.sgnbs.cms.dao.intf.FileTypeDao;
import com.sgnbs.cms.entity.FileType;

@Repository
public class FileTypeDaoImpl  extends BaseDao  implements FileTypeDao {

	@Override
	public List<FileType> getTypelist(String typecode, String level) {
		Map<String,Object> para = new HashMap<String,Object>();
		para.put("typecode", typecode);
		para.put("level", level);
		return this.getSqlSession().selectList("com.sgnbs.cms.dao.intf.FileTypeDao.getTypelist",para);
	}

	@Override
	public FileType getTypeSuper(String typecode) {
		Map<String,Object> para = new HashMap<String,Object>();
		para.put("typecode", typecode);
		return this.getSqlSession().selectOne("com.sgnbs.cms.dao.intf.FileTypeDao.getTypeSuper",para);
	}

	@Override
	public List<FileType> getSubTypelist(String typecode, String level) {
		Map<String,Object> para = new HashMap<String,Object>();
		para.put("typecode", typecode);
		para.put("level", level);
		return this.getSqlSession().selectList("com.sgnbs.cms.dao.intf.FileTypeDao.getSubTypelist",para);
	}
}
