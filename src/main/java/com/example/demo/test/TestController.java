package com.example.demo.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@Autowired
	TestService testService;
	
	
	@RequestMapping("/test")
	public String test() {
		testService.selectTest();
		return "test";
	}
	
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/insaInputForm.do")
	public String input() {
		return "insaInputForm";
	}
	
	@RequestMapping("/insaListForm.do")
	public String list() {
		return "insaListForm";
	}
	
	@RequestMapping("/insaUpdateForm.do")
	public String update() {
		return "insaUpdateForm";
	}
	
	
}
