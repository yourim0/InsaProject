package com.example.demo.test;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.NumberUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		int seq = testService.selectSequence();
		System.out.println("seq"+seq);
		List<TestVO> result = testService.selectCommon();
		model.addAttribute("result",result);
		model.addAttribute("seq",seq);
		
		return "insaInputForm";
	}
	
	//등록POST
	@RequestMapping(value = "/insaInputForm.do", method=RequestMethod.POST)
	public String inputPost(TestVO vo, Model model) throws Exception {
		System.out.println("inputpost : " + vo);
		testService.insertTest(vo);
		System.out.println("insert완료");
		
		return "insaInputForm";
		
		//회원수정정보
//		System.out.println("회원정보 가져오기");
//		int sabun = vo.getSabun();
//		List<TestVO> info = testService.getInfo(sabun);
//		System.out.println(testService.getInfo(sabun));
//		model.addAttribute("info",info);
//		return "insaUpdateForm";
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
	public String list(Model model) throws Exception {
		System.out.println("listform getcommoncode");
		List<TestVO> result = testService.selectCommon(); //공통코드 selectbox
		model.addAttribute("result",result);
		
		return "insaListForm";
	}
	
	
	//게시물 목록
	@ResponseBody
	@RequestMapping(value="/insaListForm_Search.do", method= RequestMethod.POST)
	public List<TestVO> get(TestVO vo, Model model) throws Exception {
		System.out.println("Listget");
		System.out.println("Controller, seacrchList" + vo);
		List<TestVO> value = testService.searchList(vo);
		System.out.println("검색리스트 : "+ value);
		
		return value;
	}
	
	//페이징
	@ResponseBody
	@RequestMapping(value="/getListWithPaging", method= RequestMethod.GET)
	public Map<String, Object> paging(TestVO vo, @RequestParam("num") int num) throws Exception{
		System.out.println("getListWithPaging : " + vo );
		
		Map<String, Object> map = new HashMap<String,Object>();
		int count = testService.pageCnt(vo); //게시물 총 개수 
		System.out.println("count:"+count);
		int postNum = 10; //한 페이지에서 출력할 게시물 수
		int pageNum = (int)Math.ceil((double)count/postNum);//하단페이징번호(게시물총수/한페이지출력수 올림)
		//int displayPost = (num - 1) * postNum; //매개변수 num은 현재페이지 //출력할게시물
		
		
		List list = testService.getListWithPaging(vo,num,postNum); //목록출력
		
		System.out.println(list);
		
		map.put("list", list);
		map.put("pageNum", pageNum);
		
		return map;
	}
	
	
	@RequestMapping("/insaUpdateForm.do")
	public String update() {
		return "insaUpdateForm";
	}
	
	
	
}
