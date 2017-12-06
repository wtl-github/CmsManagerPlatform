package com.sgnbs.cms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sgnbs.cms.entity.Community;
import com.sgnbs.cms.service.intf.CommunityService;

@Controller
@RequestMapping(value="/community")
public class CommunityController {
	@Autowired
	private CommunityService communityService;
	
	/**
	 * 显示社区列表
	 * @param community
	 * @return
	 */
	@RequestMapping
	public ModelAndView list(Community community) {
		List<Community> communityList = communityService.listPageCommunity(community);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/community/community");
		mv.addObject("communityList",communityList);
		mv.addObject("community",community);
		return mv;
	}
	@RequestMapping(value="/add")
	public ModelAndView add() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/community/community_info");
		return mv; 
	}
	@RequestMapping(value="/edit")
	public ModelAndView edit(@RequestParam String id) {
		Community community = communityService.getCommunityById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject(community);
		mv.setViewName("/community/community_info");
		return mv; 
	}
	@RequestMapping(value="save")
	public ModelAndView save(Community community) {
		ModelAndView mv = new ModelAndView();
		if(communityService.save(community)){
			mv.addObject("msg","success");
		}else{
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv; 
	}
}
