package com.house.agency.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.param.BuildingQueryParam;
import com.house.agency.service.IBuildingService;

@Controller
@RequestMapping("/home/building")
public class BuildingController extends BaseController {

	private final static Logger logger = LoggerFactory
			.getLogger(BuildingController.class);
	
	@Autowired
	private IBuildingService buildingService;
	
	@RequestMapping("/search")
	@ResponseBody
	public Object search(BuildingQueryParam param) {
		return buildingService.list(param);
	}
}
