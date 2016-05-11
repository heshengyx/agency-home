package com.house.agency.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.entity.TradeImage;
import com.house.agency.param.TradeImageParam;
import com.house.agency.service.ITradeImageService;
import com.myself.common.exception.ServiceException;
import com.myself.common.message.JsonMessage;

@Controller
@RequestMapping("/home/tradeImage")
public class TradeImageController extends BaseController {

	private final static Logger logger = LoggerFactory
			.getLogger(TradeImageController.class);
	
	@Autowired
	private ITradeImageService tradeImageService;
	
	@RequestMapping("/saveData")
	@ResponseBody
	public Object saveData(TradeImageParam param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			String id = tradeImageService.saveData(param);
			jMessage.setStatus(JsonMessage.TRUE);
			jMessage.setData(id);
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
	
	@RequestMapping("/trash")
	@ResponseBody
	public Object trash(String id) {
		JsonMessage jMessage = new JsonMessage();
		try {
			tradeImageService.deleteById(id);
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
	
	@RequestMapping("/update")
	@ResponseBody
	public Object update(TradeImage param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			tradeImageService.update(param);
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
	
	@RequestMapping("/cover")
	@ResponseBody
	public Object cover(TradeImage param) {
		JsonMessage jMessage = new JsonMessage();
		try {
			tradeImageService.cover(param);
			jMessage.setStatus(JsonMessage.TRUE);
			jMessage.setMessage("封面设置成功");
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
