package com.sgnbs.cms.controller;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sgnbs.cms.entity.FileType;
import com.sgnbs.cms.pojo.ProcessResult;
import com.sgnbs.cms.service.intf.FileTypeService;

@Controller
@RequestMapping(value="/fileType")
public class FileTypeController {

	@Autowired
	private FileTypeService fileTypeService;

	@RequestMapping(value = "/getFiletype")
	@ResponseBody
	public ProcessResult getFileType(@RequestParam String typecode,
			@RequestParam String level) throws Exception {
		List<FileType> fileTypeList = null;
		if(StringUtils.isBlank(typecode) == false)
		    fileTypeList = fileTypeService.getSubTypelist(typecode,level);
		return new ProcessResult("200", "success", fileTypeList);
	}
}
