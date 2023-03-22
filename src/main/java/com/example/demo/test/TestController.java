package com.example.demo.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		System.out.println("inputget");
		return "insaInputForm";
	}
	
	@RequestMapping(value = "/insaInputForm.do", method=RequestMethod.POST)
	public String inputPost(TestVO vo) {
		System.out.println("inputpost");
		testService.insertTest();
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
