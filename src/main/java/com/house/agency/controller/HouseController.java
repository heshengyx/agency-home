package com.house.agency.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.data.HouseListData;
import com.house.agency.entity.House;
import com.house.agency.page.IPage;
import com.house.agency.param.HouseQueryParam;
import com.house.agency.service.IHouseService;
import com.house.agency.service.IRegionService;
import com.myself.common.exception.ServiceException;
import com.myself.common.message.JsonMessage;
import com.myself.common.message.JsonResult;

@Controller
@RequestMapping("/home/house")
public class HouseController extends BaseController {

	private final static Logger logger = LoggerFactory
			.getLogger(HouseController.class);
	
	@Autowired
	private IHouseService houseService;
	
	@Autowired
	private IRegionService regionService;
	
	@RequestMapping("/used/sale")
	public String pageUsedSale(Model model) {
		setModel(model, regionService);
		return "house";
	}
	
	@RequestMapping("/new/sale")
	public String pageNewSale(Model model) {
		setModel(model, regionService);
		return "house";
	}
	
	@RequestMapping("/used/sale/add")
	public String pageUsedSaleAdd(Model model) {
		return "house-add";
	}
	
	@RequestMapping("/select")
	@ResponseBody
	public Object select(String buildingUnitId) {
		JsonMessage jMessage = new JsonMessage();
		List<House> datas = null;
		try {
			datas = houseService.queryByBuildingUnitId(buildingUnitId);
			jMessage.setStatus(JsonMessage.TRUE);
			jMessage.setData(datas);
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
	
	@RequestMapping("/queryData")
	@ResponseBody
	public Object queryData(HouseQueryParam param) {
		IPage<HouseListData> datas = houseService.queryData(param, param.getPage(),
				param.getLength());
		JsonResult<HouseListData> jResult = new JsonResult<HouseListData>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(datas.getTotalRecord());
		jResult.setRecordsFiltered(datas.getTotalRecord());
		jResult.setData((List<HouseListData>) datas.getData());
		return jResult;
	}
	
	@RequestMapping("")
	public String pageHouse(Model model) {
		setModel(model, regionService);
		return "houses";
	}
	
	@RequestMapping("/query")
	@ResponseBody
	public Object query(HouseQueryParam param) {
		IPage<House> datas = houseService.query(param, param.getPage(),
				param.getLength());
		JsonResult<House> jResult = new JsonResult<House>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(datas.getTotalRecord());
		jResult.setRecordsFiltered(datas.getTotalRecord());
		jResult.setData((List<House>) datas.getData());
		return jResult;
	}
}
