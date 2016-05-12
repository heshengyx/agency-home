package com.house.agency.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.entity.Customer;
import com.house.agency.entity.User;
import com.house.agency.page.IPage;
import com.house.agency.param.CustomerQueryParam;
import com.house.agency.service.ICustomerService;
import com.house.agency.service.IRegionService;
import com.myself.common.exception.ServiceException;
import com.myself.common.message.JsonMessage;
import com.myself.common.message.JsonResult;

@Controller
@RequestMapping("/home/customer")
public class CustomerController extends BaseController {

	private final static Logger logger = LoggerFactory
			.getLogger(CustomerController.class);
	
	@Autowired
	private IRegionService regionService;
	
	@Autowired
	private ICustomerService customerService;
	
	@RequestMapping("")
	public String pageHouse(Model model) {
		setModel(model, regionService);
		
		return "customer";
	}
	
	@RequestMapping("/queryData")
	@ResponseBody
	public Object queryData(CustomerQueryParam param) {
		IPage<Customer> datas = customerService.query(param, param.getPage(),
				param.getLength());
		JsonResult<Customer> jResult = new JsonResult<Customer>();
		jResult.setDraw(param.getDraw());
		jResult.setRecordsTotal(datas.getTotalRecord());
		jResult.setRecordsFiltered(datas.getTotalRecord());
		jResult.setData((List<Customer>) datas.getData());
		return jResult;
	}
	
	@RequestMapping("/saveOrUpdate")
	@ResponseBody
	public Object saveOrUpdate(Customer param) {
		JsonMessage jMessage = new JsonMessage();
		User user = getCurrentUser();
		param.setUserId(user.getId());
		try {
			customerService.saveOrUpdate(param);
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
		Customer data = null;
		try {
			data = customerService.getDataById(id);
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
			customerService.deleteById(id);
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
