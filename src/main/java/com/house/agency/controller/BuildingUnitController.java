package com.house.agency.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.entity.BuildingUnit;
import com.house.agency.service.IBuildingUnitService;
import com.myself.common.exception.ServiceException;
import com.myself.common.message.JsonMessage;

@Controller
@RequestMapping("/home/buildingUnit")
public class BuildingUnitController extends BaseController {
	
	private final static Logger logger = LoggerFactory
			.getLogger(BuildingUnitController.class);

	@Autowired
	private IBuildingUnitService buildingUnitService;
	
	@RequestMapping("/select")
	@ResponseBody
	public Object select(String buildingId) {
		JsonMessage jMessage = new JsonMessage();
		List<BuildingUnit> datas = null;
		try {
			datas = buildingUnitService.queryByBuildingId(buildingId);
			jMessage.setCode(JsonMessage.SUCCESS_CODE);
			jMessage.setData(datas);
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
