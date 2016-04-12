package com.house.agency.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class IndexController extends BaseController {

	@RequestMapping("")
	public String page() {
		return "index";
	}
}
