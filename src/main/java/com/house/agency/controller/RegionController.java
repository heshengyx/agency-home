package com.house.agency.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.data.manage.RegionManageData;
import com.house.agency.entity.Region;
import com.house.agency.page.IPage;
import com.house.agency.param.RegionQueryParam;
import com.house.agency.param.manage.RegionManageQueryParam;
import com.house.agency.service.IRegionService;
import com.myself.common.exception.ServiceException;
import com.myself.common.message.JsonMessage;
import com.myself.common.message.JsonResult;

@Controller
@RequestMapping("/home/region")
public class RegionController extends BaseController {

	private final static Logger logger = LoggerFactory
			.getLogger(RegionController.class);
	
	@Autowired
	private IRegionService regionService;
	
	@RequestMapping("country")
	public String pageCountry(Model model) {
		model.addAttribute("name", "国家");
		model.addAttribute("level", "1");
		return "region";
	}
	
	@RequestMapping("province")
	public String pageProvince(Model model) {
		model.addAttribute("name", "省份");
		model.addAttribute("level", "2");
		
		RegionQueryParam param = new RegionQueryParam();
		param.setLevel("1");
		setModel(model, regionService, param);
		return "region";
	}
	
	@RequestMapping("city")
	public String pageCity(Model model) {
		model.addAttribute("name", "市县");
		model.addAttribute("level", "3");
		
		RegionQueryParam param = new RegionQueryParam();
		param.setLevel("1");
		setModel(model, regionService, param);
		return "region";
	}
	
	@RequestMapping("district")
	public String pageDistrict(Model model) {
		model.addAttribute("name", "城区");
		model.addAttribute("level", "4");
		
		RegionQueryParam param = new RegionQueryParam();
		param.setLevel("1");
		setModel(model, regionService, param);
		return "region";
	}
	
	@RequestMapping("town")
	public String pageTown(Model model) {
		model.addAttribute("name", "乡镇");
		model.addAttribute("level", "5");
		
		RegionQueryParam param = new RegionQueryParam();
		param.setLevel("1");
		setModel(model, regionService, param);
		return "region";
	}
	
	@RequestMapping("/queryManageData")
	@ResponseBody
	public Object queryManageData(RegionManageQueryParam param) {
		IPage<RegionManageData> datas = regionService.queryManageData(param, param.getPage(),
				param.getLength());
		JsonResult<RegionManageData> jResult = new JsonResult<RegionManageData>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(datas.getTotalRecord());
		jResult.setRecordsFiltered(datas.getTotalRecord());
		jResult.setData((List<RegionManageData>) datas.getData());
		return jResult;
	}
	
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
	
	@RequestMapping("/save")
	@ResponseBody
	public Object save(Region param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			regionService.save(param);
			jMessage.setStatus(JsonMessage.TRUE);
			jMessage.setMessage("保存成功");
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
