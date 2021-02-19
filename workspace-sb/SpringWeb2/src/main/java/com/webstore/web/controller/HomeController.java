package com.webstore.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/index")
	public String sampleMethod() {
		return "home.index";
	}
	
	@RequestMapping("/gumi")
	public String sampleMethod2() {
		return "home.gumi";
	}
	
	@RequestMapping("/help")
	public String list() {
		return "home.help";
	}
}
