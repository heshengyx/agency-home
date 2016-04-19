package com.house.agency.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.entity.Building;
import com.house.agency.page.IPage;
import com.house.agency.param.BuildingQueryParam;
import com.house.agency.service.IBuildingService;
import com.house.agency.service.IRegionService;
import com.myself.common.exception.ServiceException;
import com.myself.common.message.JsonMessage;
import com.myself.common.message.JsonResult;

@Controller
@RequestMapping("/home/building")
public class BuildingController extends BaseController {

	private final static Logger logger = LoggerFactory
			.getLogger(BuildingController.class);
	
	@Autowired
	private IBuildingService buildingService;
	
	@Autowired
	private IRegionService regionService;
	
	@RequestMapping("")
	public String pageBuilding(Model model) {
		setModel(model, regionService);
		return "building";
	}
	
	@RequestMapping("/query")
	@ResponseBody
	public Object query(BuildingQueryParam param) {
		IPage<Building> datas = buildingService.query(param, param.getPage(),
				param.getLength());
		JsonResult<Building> jResult = new JsonResult<Building>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(datas.getTotalRecord());
		jResult.setRecordsFiltered(datas.getTotalRecord());
		jResult.setData((List<Building>) datas.getData());
		return jResult;
	}
	
	@RequestMapping("/search")
	@ResponseBody
	public Object search(BuildingQueryParam param) {
		return buildingService.list(param);
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public Object save(Building param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			buildingService.save(param);
			jMessage.setCode(JsonMessage.SUCCESS_CODE);
		} catch (Exception e) {
			jMessage.setCode(JsonMessage.ERROR_CODE);
			if (e instanceof ServiceException) {
				jMessage.setMessage(e.getMessage());
			} else {
				jMessage.setMessage("系统异常");
			}
			logger.error(jMessage.getMessage(), e);
		}
		return jMessage;
	}
}
