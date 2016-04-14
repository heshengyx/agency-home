package com.house.agency.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.data.HouseListData;
import com.house.agency.page.IPage;
import com.house.agency.param.HouseQueryParam;
import com.house.agency.service.IHouseService;
import com.myself.common.message.JsonResult;

@Controller
@RequestMapping("/home/house")
public class HouseController extends BaseController {

	@Autowired
	private IHouseService houseService;
	
	@RequestMapping("")
	public String page(Model model) {
		return "house";
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
