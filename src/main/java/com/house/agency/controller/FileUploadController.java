package com.house.agency.controller;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.house.agency.entity.Image;
import com.house.agency.file.FileHandler;
import com.house.agency.param.ImageParam;
import com.house.agency.service.IImageService;
import com.myself.common.exception.ServiceException;
import com.myself.common.message.JsonMessage;
import com.myself.common.utils.FileUtil;

@Controller
@RequestMapping("/home/file")
public class FileUploadController extends BaseController {

	private final static Logger logger = LoggerFactory
			.getLogger(FileUploadController.class);
	
	@Autowired
	private IImageService imageService;
	
	@RequestMapping("/upload")
	@ResponseBody
	public Object upload(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request, ImageParam param) {
		JsonMessage jMessage = new JsonMessage();
		String tempFolder = request.getSession().getServletContext()
				.getRealPath(FileUtil.TEMP_FOLDER);
		String uploadFolder = request.getSession().getServletContext()
				.getRealPath(FileUtil.UPLOAD_FOLDER);
		param.setFolder(FileUtil.UPLOAD_FOLDER);
		try {
			Map<String, File> map = FileHandler.upload(multipartFile, tempFolder);
			Image data = imageService.upload(param, map, uploadFolder);
			jMessage.setData(data);
			jMessage.setStatus(JsonMessage.TRUE);
			jMessage.setMessage("文件上传成功");
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
	public Object trash(String id, HttpServletRequest request) {
		JsonMessage jMessage = new JsonMessage();
		String path = request.getSession().getServletContext()
				.getRealPath("/");
		try {
			imageService.trash(id, path);
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
