package com.sgnbs.cms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sgnbs.cms.entity.Info;
import com.sgnbs.cms.entity.Page;
import com.sgnbs.cms.service.intf.InfoService;

@Controller
@RequestMapping(value="/info")
public class InfoController {
	
	@Autowired
	private InfoService infoService;
	@RequestMapping
	public String info(Model model,Page page){
		List<Info> infoList = infoService.listPageInfo(page);
		model.addAttribute("infoList", infoList);
		model.addAttribute("page", page);
		return "info";
	}
	
}
