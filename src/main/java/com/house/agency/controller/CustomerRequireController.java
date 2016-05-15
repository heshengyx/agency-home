package com.house.agency.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.data.home.CustomerRequireHomeData;
import com.house.agency.entity.Customer;
import com.house.agency.entity.CustomerRequire;
import com.house.agency.entity.User;
import com.house.agency.page.IPage;
import com.house.agency.param.CustomerRequireQueryParam;
import com.house.agency.service.ICustomerRequireService;
import com.house.agency.service.ICustomerService;
import com.house.agency.service.IRegionService;
import com.myself.common.exception.ServiceException;
import com.myself.common.message.JsonMessage;
import com.myself.common.message.JsonResult;

@Controller
@RequestMapping("/home/customerRequire")
public class CustomerRequireController extends BaseController {

	private final static Logger logger = LoggerFactory
			.getLogger(CustomerRequireController.class);
	
	@Autowired
	private IRegionService regionService;
	
	@Autowired
	private ICustomerService customerService;
	
	@Autowired
	private ICustomerRequireService customerRequireService;
	
	@RequestMapping("")
	public String page(Model model) {
		setModel(model, regionService);
		
		User user = getCurrentUser();
		List<Customer> customers = customerService.queryDataByUid(user.getId());
		model.addAttribute("customers", customers);
		return "customerRequire";
	}
	
	@RequestMapping("/queryData")
	@ResponseBody
	public Object queryData(CustomerRequireQueryParam param) {
		IPage<CustomerRequireHomeData> datas = customerRequireService.queryData(param, param.getPage(),
				param.getLength());
		JsonResult<CustomerRequireHomeData> jResult = new JsonResult<CustomerRequireHomeData>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(datas.getTotalRecord());
		jResult.setRecordsFiltered(datas.getTotalRecord());
		jResult.setData((List<CustomerRequireHomeData>) datas.getData());
		return jResult;
	}
	
	@RequestMapping("/saveOrUpdate")
	@ResponseBody
	public Object saveOrUpdate(CustomerRequire param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			customerRequireService.saveOrUpdate(param);
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
	
	@RequestMapping("/getData")
	@ResponseBody
	public Object getData(String id) {
		JsonMessage jMessage = new JsonMessage();
		CustomerRequire data = null;
		try {
			data = customerRequireService.getDataById(id);
			jMessage.setStatus(JsonMessage.TRUE);
			jMessage.setData(data);
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
	
	@RequestMapping("/getDataByRequireId")
	@ResponseBody
	public Object getDataByRequireId(String requireId) {
		JsonMessage jMessage = new JsonMessage();
		CustomerRequireHomeData data = null;
		try {
			data = customerRequireService.getDataByRequireId(requireId);
			jMessage.setStatus(JsonMessage.TRUE);
			jMessage.setData(data);
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
	
	@RequestMapping("/trash")
	@ResponseBody
	public Object trash(String id) {
		JsonMessage jMessage = new JsonMessage();
		try {
			customerRequireService.deleteById(id);
			jMessage.setStatus(JsonMessage.TRUE);
			jMessage.setMessage("删除成功");
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
