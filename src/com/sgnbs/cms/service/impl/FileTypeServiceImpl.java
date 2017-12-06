package com.sgnbs.cms.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sgnbs.cms.dao.intf.FileTypeDao;
import com.sgnbs.cms.entity.FileType;
import com.sgnbs.cms.pojo.MallOneList;
import com.sgnbs.cms.pojo.MallThreeList;
import com.sgnbs.cms.pojo.MallTwoList;
import com.sgnbs.cms.service.intf.FileTypeService;

@Service
public class FileTypeServiceImpl implements FileTypeService {

	@Autowired
	private FileTypeDao fileTypeDao;
	
	@Override
	public List<FileType> getTypelist(String typecode, String level) {
		return fileTypeDao.getTypelist(typecode, level);
	}

	@Override
	public FileType getTypeSuper(String typecode) {
		return fileTypeDao.getTypeSuper(typecode);
	}

	@Override
	public List<FileType> getSubTypelist(String typecode, String level) {
		return fileTypeDao.getSubTypelist(typecode, level);
	}

	@Override
	public List<MallOneList> getThreeLevelData(){
		List<MallOneList> mallOne = new ArrayList<MallOneList>();
		
		List<FileType> fileTypeList = fileTypeDao.getTypelist(null, "1");
		for(FileType ft1 :fileTypeList){
			MallOneList mallOneList = new MallOneList();
			mallOneList.setTypeCode(ft1.getTypeCode());
			mallOneList.setTypeName(ft1.getTypeName());
			
			List<FileType> fileTypeList2 = fileTypeDao.getSubTypelist(ft1.getTypeCode(), "2");
			List<MallTwoList> mallTwo = new ArrayList<MallTwoList>();
			
			for(FileType ft2 :fileTypeList2){
				MallTwoList mallTwoList = new MallTwoList();
				mallTwoList.setTypeCode(ft2.getTypeCode());
				mallTwoList.setTypeName(ft2.getTypeName());
				
				List<FileType> fileTypeList3 = fileTypeDao.getSubTypelist(ft2.getTypeCode(), "3");
				List<MallThreeList> mallThree = new ArrayList<MallThreeList>();
				
				for(FileType ft3 :fileTypeList3){
					MallThreeList mallThreeList = new MallThreeList();
					mallThreeList.setTypeCode(ft3.getTypeCode());
					mallThreeList.setTypeName(ft3.getTypeName());
					
					mallThree.add(mallThreeList);
				}
				
				mallTwoList.setMallThreeList(mallThree);
				mallTwo.add(mallTwoList);
			}
			
			mallOneList.setMallTwoList(mallTwo);
			mallOne.add(mallOneList);
		}
		return mallOne;
	}
}
