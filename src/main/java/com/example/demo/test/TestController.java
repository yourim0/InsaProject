package com.example.demo.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	//공통코드 가져오기
//	@RequestMapping("/getCommoncode.do")
//	public String getCommoncode(Model model) {
//		System.out.println("getcommoncode");
//		List<TestVO> result = testService.selectCommon();
//		System.out.println(result);
//		model.addAttribute("result",result);
//		return "insaInputForm";
//	}
//	
	//등록GET
	@RequestMapping("/insaInputForm.do")
	public String input(Model model) {
		System.out.println("inputget");
		System.out.println("getcommoncode");
		List<TestVO> result = testService.selectCommon();
		model.addAttribute("result",result);
		
		return "insaInputForm";
	}
	
	//등록POST
	@RequestMapping(value = "/insaInputForm.do", method=RequestMethod.POST)
	public String inputPost(TestVO vo) {
		System.out.println("inputpost");
		System.out.println(vo.getJoin_date().getClass().getSimpleName());
		testService.insertTest(vo);
		System.out.println("insert완료");
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
