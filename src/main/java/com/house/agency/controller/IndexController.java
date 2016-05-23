package com.house.agency.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.agency.entity.User;
import com.house.agency.service.IUserService;
import com.myself.common.message.JsonMessage;

@Controller
@RequestMapping("/home")
public class IndexController extends BaseController {
	
	private final static Logger logger = LoggerFactory
			.getLogger(IndexController.class);
	
	@Autowired
	private IUserService userService;

	@RequestMapping("")
	public String page() {
		return "index";
	}

	@RequestMapping("/login")
	@ResponseBody
	public Object login(User param) {
		JsonMessage jMessage = new JsonMessage();
		String account = param.getAccount();
		UsernamePasswordToken token = new UsernamePasswordToken(
				account, param.getPassword());
		Subject subject = SecurityUtils.getSubject();
		try {
			// token.setRememberMe(true);
			subject.login(token);
			jMessage.setStatus(JsonMessage.TRUE);
			logger.info("[{}]登录成功", new Object[]{account});
		} catch (Exception e) {
			logger.error("[{}]登录失败", new Object[]{account}, e);
			jMessage.setStatus(JsonMessage.FALSE);
			jMessage.setMessage("登录失败");
		}
		return jMessage;
	}
	
	@RequestMapping("/signup")
	@ResponseBody
	public Object signup(User param) {
		JsonMessage jMessage = new JsonMessage();
		String account = param.getAccount();
		try {
			userService.signup(param);
			jMessage.setStatus(JsonMessage.TRUE);
			logger.info("[{}]注册成功", new Object[]{account});
		} catch (Exception e) {
			logger.error("[{}]注册失败", new Object[]{account}, e);
			jMessage.setStatus(JsonMessage.FALSE);
			jMessage.setMessage("注册失败");
		}
		return jMessage;
	}
	
	@RequestMapping("/check")
	@ResponseBody
	public Object check(String account) {
		JsonMessage jMessage = new JsonMessage();
		try {
			userService.checkByAccount(account);
			logger.info("[{}]不存在", new Object[]{account});
			jMessage.setValid(Boolean.TRUE);
		} catch (Exception e) {
			logger.error("[{}]已存在", new Object[]{account}, e);
			jMessage.setValid(Boolean.FALSE);
			//jMessage.setMessage(e.getMessage());
		}
		return jMessage;
	}
	
	@RequestMapping("/logout")
	public String logout() {
		Subject subject = SecurityUtils.getSubject();
		if (subject.isAuthenticated()) {
			subject.logout(); //
		}
		return "redirect:/login.jsp";
	}
}
