package com.house.agency.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.entity.Region;
import com.house.agency.param.RegionQueryParam;
import com.house.agency.service.IRegionService;
import com.myself.common.exception.ServiceException;
import com.myself.common.message.JsonMessage;

@Controller
@RequestMapping("/home/region")
public class RegionController extends BaseController {

	private final static Logger logger = LoggerFactory
			.getLogger(RegionController.class);
	
	@Autowired
	private IRegionService regionService;
	
	@RequestMapping("/list")
	@ResponseBody
	public Object list(String parentId) {
		JsonMessage jMessage = new JsonMessage();
		RegionQueryParam param = new RegionQueryParam();
		param.setParentId(parentId);
		
		List<Region> regions = null;
		try {
			regions = regionService.list(param);
			jMessage.setStatus(JsonMessage.TRUE);
			jMessage.setData(regions);
		} catch (Exception e) {
			jMessage.setStatus(JsonMessage.FALSE);
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
