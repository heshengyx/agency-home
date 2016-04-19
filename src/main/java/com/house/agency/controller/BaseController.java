package com.house.agency.controller;

import java.util.List;

import org.springframework.ui.Model;

import com.house.agency.entity.Region;
import com.house.agency.param.RegionQueryParam;
import com.house.agency.service.IRegionService;

public abstract class BaseController {

	protected void setModel(Model model, IRegionService regionService) {
		RegionQueryParam param = new RegionQueryParam();
		param.setCode("SZ");
		List<Region> regions = regionService.list(param);
		model.addAttribute("regions", regions);
	}
}
