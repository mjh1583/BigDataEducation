package com.webstore.web.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {
	
	@RequestMapping("/index")
	public String sampleMethod() {
		return "Hello Spring Boot!!";
	}
	
	@RequestMapping("/gumi")
	public String sampleMethod2() {
		return "Hello Gumi!!";
	}
}
