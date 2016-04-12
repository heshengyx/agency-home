package com.house.agency.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home/house")
public class HouseController extends BaseController {

	@RequestMapping("")
	public String page(Model model) {
		return "house";
	}
}
