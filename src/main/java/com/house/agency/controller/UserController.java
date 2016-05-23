package com.house.agency.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.house.agency.service.IUserService;

@Controller
@RequestMapping("/home/user")
public class UserController extends BaseController {

	private final static Logger logger = LoggerFactory
			.getLogger(UserController.class);
	
	@Autowired
	private IUserService userService;
	
	@RequestMapping("")
	public String page() {
		return "user";
	}
}
