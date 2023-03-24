package com.example.demo.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	//등록GET
	@RequestMapping("/insaInputForm.do")
	public String input(Model model) throws Exception {
		System.out.println("inputget");
		System.out.println("getcommoncode");
		List<TestVO> result = testService.selectCommon();
		model.addAttribute("result",result);
		
		return "insaInputForm";
	}
	
	//등록POST
	@RequestMapping(value = "/insaInputForm.do", method=RequestMethod.POST)
	public String inputPost(TestVO vo) throws Exception {
		System.out.println("inputpost");
		testService.insertTest(vo);
		System.out.println("insert완료");
		
		return "insaInputForm";
	}
	
	//아이디 중복검사
	@RequestMapping("/memberIdChk")
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception {
		System.out.println("memberChk() 진입");
		int result = testService.idCheck(memberId);
		System.out.println("result" + result);

		if (result == 0) {
			return "success";
		} else {
			return "fail";
		}
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
