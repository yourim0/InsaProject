package com.example.demo.test;

import java.net.URLDecoder;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.NumberUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
		
		int seq = testService.selectSequence();
		List<TestVO> result = testService.selectCommon();
		model.addAttribute("result",result);
		model.addAttribute("seq",seq);
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
	public String list(@RequestParam(value="num",required=false) Integer num, @RequestParam(value="sabun",required=false) Integer sabun, 
			@RequestParam(value="sabunSch",required=false) String sabunSch, @RequestParam(value="name",required=false) String name,
			 @RequestParam(value="join_gbn_code",required=false) String join_gbn_code, @RequestParam(value="pos_gbn_code",required=false) String pos_gbn_code, 
			 @RequestParam(value="join_date",required=false) String join_date,@RequestParam(value="retire_date",required=false) String retire_date, 
			 @RequestParam(value="put_yn",required=false) String put_yn, @RequestParam(value="job_type",required=false) String job_type,Model model) throws Exception {
		
		List<TestVO> result = testService.selectCommon(); //공통코드 selectbox
		System.out.println("listform getcommoncode");
		model.addAttribute("result",result);
		return "insaListForm";
	}
	
	//검색 후의 list --삭제 
	@RequestMapping(value="/seachList.do", method= RequestMethod.GET)
	public String search(@RequestParam("num") int num, @RequestParam("sabun") int sabun, @RequestParam("sabunSch") String sabunSch, @RequestParam("name") String name,
			 @RequestParam("join_gbn_code") String join_gbn_code, @RequestParam("pos_gbn_code") String pos_gbn_code, @RequestParam("join_date") String join_date,
			 @RequestParam("retire_date") String retire_date, @RequestParam("put_yn") String put_yn, @RequestParam("job_type") String job_type, Model model) throws Exception{

		model.addAttribute("search",true);

		return "insaListForm";
	}
	
	
//	//게시물 목록
//	@ResponseBody
//	@RequestMapping(value="/insaListForm_Search.do", method= RequestMethod.POST)
//	public List<TestVO> get(TestVO vo, Model model) throws Exception {
//		System.out.println("Listget");
//		System.out.println("Controller, seacrchList" + vo);
//		List<TestVO> value = testService.searchList(vo);
//		System.out.println("검색리스트 : "+ value);
//		
//		return value;
//	}
	
	//페이징
	@ResponseBody
	@RequestMapping(value="/getListWithPaging", method= RequestMethod.GET)
	public Map<String, Object> paging(TestVO vo, @RequestParam("num") int num) throws Exception{
		System.out.println("getListWithPaging : " + vo );
		System.out.println("num : " + num );
		Map<String, Object> map = new HashMap<String,Object>();
		int count = testService.pageCnt(vo); //게시물 총 개수 
		System.out.println("count:"+count);
		int postNum = 10; //한 페이지에서 출력할 게시물 수
		int pageNum = (int)Math.ceil((double)count/postNum);//하단페이징번호(게시물총수/한페이지출력수 올림)
		int displayPost = (num - 1) * postNum; //매개변수 num은 현재페이지 //출력할게시물

		int pageNum_cnt = 5;	// 한번에 표시할 페이징 번호의 갯수
		int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt); // 표시되는 페이지 번호 중 마지막 번호
		System.out.println("endPageNum : " + endPageNum );
		
		int startPageNum = endPageNum - (pageNum_cnt - 1);// 표시되는 페이지 번호 중 첫번째 번호
		System.out.println("startPageNum : " + startPageNum );
		
		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)postNum)); // 마지막 번호 재계산
		 
		if(endPageNum > endPageNum_tmp) {
		 endPageNum = endPageNum_tmp;
		}
		System.out.println("endPageNum_tmp : " + endPageNum_tmp );
		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * postNum >= count ? false : true;
		
		List list = testService.getListWithPaging(vo,num,postNum); //목록출력
		
		System.out.println("list"+list);
		System.out.println("prev"+prev);
		System.out.println("next"+next);
		
		map.put("list", list);
		map.put("pageNum", pageNum);
		map.put("startPageNum", startPageNum);
		map.put("endPageNum", endPageNum);
		map.put("prev", prev);
		map.put("next", next);
		map.put("select", num);
		return map;
	}
	
	
	
	
	//검색어받는애
	@RequestMapping("/insaUpdateForm.do")
	public String update(@RequestParam("num") int num, @RequestParam("sabun") int sabun, @RequestParam("sabunSch") String sabunSch, @RequestParam("name") String name,
			 @RequestParam("join_gbn_code") String join_gbn_code, @RequestParam("pos_gbn_code") String pos_gbn_code, @RequestParam("join_date") String join_date,
			 @RequestParam("retire_date") String retire_date, @RequestParam("put_yn") String put_yn, @RequestParam("job_type") String job_type, Model model) throws Exception {
		System.out.println("insaUpdateForm:"+sabun) ;
		
		List<TestVO> result = testService.selectCommon();
		List<TestVO> info = testService.getInfo(sabun);
		System.out.println(info);
	
		HashMap<String,String> searchParam = new HashMap<String,String>();
		searchParam.put("num", String.valueOf(num));
		searchParam.put("sabunSch", String.valueOf(sabunSch));
		searchParam.put("name", URLDecoder.decode(name,"UTF-8"));
		searchParam.put("join_gbn_code",join_gbn_code);
		searchParam.put("pos_gbn_code",pos_gbn_code);
		searchParam.put("join_date", join_date);
		searchParam.put("retire_date", retire_date);
		searchParam.put("put_yn", put_yn);
		searchParam.put("job_type", job_type);
		
		model.addAttribute("sabun",sabun);
		model.addAttribute("info",info);
		model.addAttribute("result",result);
		model.addAttribute("searchParam",searchParam);
		return "insaUpdateForm";
	}
	
	//수정
	@RequestMapping(value="/insaUpdateForm.do", method= RequestMethod.POST)
	public String update(TestVO vo) throws Exception {
		System.out.println("update:"+vo) ;
		testService.update(vo);
		System.out.println("update완료");
		
		StringBuffer buff = new StringBuffer();
		buff.append("redirect:insaUpdateForm.do?");
		buff.append("sabun=");
		buff.append(vo.getSabun()+"&");
		buff.append("sabunSch=");
		buff.append(vo.getSearchParam().get("sabunSch")+"&");
		buff.append("name=");
		buff.append(vo.getSearchParam().get("name")+"&");
		buff.append("join_gbn_code=");
		buff.append(vo.getSearchParam().get("join_gbn_code")+"&");
		buff.append("pos_gbn_code=");
		buff.append(vo.getSearchParam().get("pos_gbn_code")+"&");
		buff.append("join_date=");
		buff.append(vo.getSearchParam().get("join_date")+"&");
		buff.append("retire_date=");
		buff.append(vo.getSearchParam().get("retire_date")+"&");
		buff.append("put_yn=");
		buff.append(vo.getSearchParam().get("put_yn")+"&");		
		buff.append("job_type=");
		buff.append(vo.getSearchParam().get("job_type"));
		
		String redirectUrl = buff.toString();
		return redirectUrl;
	}

	//update에서 삭제
	@RequestMapping("/delete.do")
	public String delete(@RequestParam("sabun") int sabun) throws Exception {
		System.out.println("delete:"+sabun) ;
		testService.delete(sabun);
		System.out.println("삭제완료");
		return "redirect:insaListForm.do";
	}
	
	//checkbox 삭제
	@RequestMapping(value="/delete.do", method= RequestMethod.POST)
	@ResponseBody
	public Object delete(@RequestParam(value="sabunList[]") List<String> delList) throws Exception {
		System.out.println("arrdelete:"+delList) ;
		 for(String i : delList) {
			 int a = Integer.parseInt(i);
			 testService.delete(a);
			 System.out.println("삭제완료");
	        }

		 Map<String, Object> result = new HashMap<String,Object>();
		//System.out.println("삭제완료");
		//return "redirect:insaListForm.do";
		 result.put("code", "OK");
		 result.put("message", "삭제완료.");
		 return result;
	}
	

	
}
