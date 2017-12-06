package com.sgnbs.cms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sgnbs.cms.entity.Region;
import com.sgnbs.cms.service.intf.RegionService;

@Controller
@RequestMapping(value="/region")
public class RegionController {
	@Autowired
	private RegionService regionService;
	
	/**
	 * 显示小区列表
	 * @param region
	 * @return
	 */
	@RequestMapping
	public ModelAndView list(Region region) {
		List<Region> regionList = regionService.listPageRegion(region);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/region/region");
		mv.addObject(regionList);
		mv.addObject(region);
		return mv;
	}
	@RequestMapping(value="/add")
	public ModelAndView add() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/region/region_info");
		return mv; 
	}
	@RequestMapping(value="/edit")
	public ModelAndView edit(@RequestParam String regionId) {
		Region region = regionService.getRegionById(regionId);
		ModelAndView mv = new ModelAndView();
		mv.addObject(region);
		mv.setViewName("/region/region_info");
		return mv; 
	}
	@RequestMapping(value="/save")
	public ModelAndView save(Region region) {
		ModelAndView mv = new ModelAndView();
		if(regionService.save(region)){
			mv.addObject("msg","success");
		}else{
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv; 
	}
	@RequestMapping(value="/delete")
	public String delete(Region region) {
		regionService.deleteRegion(region);
		return "redirect:/region.html";
	}
	@RequestMapping(value="/deletes")
	public String deletes(@RequestParam String regionIds) {
		regionService.deleteRegions(regionIds);
		return "redirect:/region.html";
	}
	
}
