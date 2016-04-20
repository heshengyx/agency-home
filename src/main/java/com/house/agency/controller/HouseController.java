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
import com.house.agency.entity.Region;
import com.house.agency.page.IPage;
import com.house.agency.param.HouseQueryParam;
import com.house.agency.param.RegionQueryParam;
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
		setModel(model);
		return "house";
	}
	
	@RequestMapping("/new/sale")
	public String pageNewSale(Model model) {
		setModel(model);
		return "house";
	}
	
	@RequestMapping("/used/sale/add")
	public String pageUsedSaleAdd(Model model) {
		return "house-add";
	}
	
	private void setModel(Model model) {
		RegionQueryParam param = new RegionQueryParam();
		param.setCode("SZ");
		List<Region> regions = regionService.list(param);
		model.addAttribute("regions", regions);
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
}
