package com.spring.admin.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainAdminController {

	@RequestMapping(value="/adminLogin", method=RequestMethod.GET)
	public String main() {
		return "index";
	}
	
	
}
