package com.house.agency.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home/customerRequire")
public class CustomerRequireController extends BaseController {

	private final static Logger logger = LoggerFactory
			.getLogger(CustomerRequireController.class);
}
