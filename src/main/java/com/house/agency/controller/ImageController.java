package com.house.agency.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.data.manage.ImageManageData;
import com.house.agency.param.ImageQueryParam;
import com.house.agency.service.IImageService;
import com.myself.common.exception.ServiceException;
import com.myself.common.message.JsonMessage;

@Controller
@RequestMapping("/home/image")
public class ImageController extends BaseController {
	
	@Autowired
	private IImageService imageService;

	private final static Logger logger = LoggerFactory
			.getLogger(ImageController.class);
	
	@RequestMapping("/queryData")
	@ResponseBody
	public Object queryData(ImageQueryParam param) {
		JsonMessage jMessage = new JsonMessage();
		List<ImageManageData> data = null;
		try {
			data = imageService.queryDataByFuid(param);
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
}
