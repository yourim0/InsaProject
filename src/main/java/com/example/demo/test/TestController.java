package com.example.demo.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.NumberUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

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

	// 등록GET
	@RequestMapping("/insaInputForm.do")
	public String input(Model model) throws Exception {
		System.out.println("inputget");
		System.out.println("getcommoncode");
		int seq = testService.selectSequence();
		System.out.println("seq" + seq);
		List<TestVO> result = testService.selectCommon();
		model.addAttribute("result", result);
		model.addAttribute("seq", seq);

		return "insaInputForm";
	}

	// 등록
	@RequestMapping(value = "/insaInputForm.do", method = RequestMethod.POST)
	public String inputPost(TestVO vo, @RequestParam(value = "carrier", required = false) MultipartFile carrier,
			@RequestParam(value = "profile", required = false) MultipartFile profile,
			@RequestParam(value = "cmp_reg", required = false) MultipartFile cmp_reg, Model model,
			HttpServletRequest request) throws Exception {

		System.out.println("inputpost : " + vo);
		String path = request.getSession().getServletContext().getRealPath("/resources/imgs/");
		// String path = "C:/upload/";

		MultipartFile multifile1 = carrier;
		MultipartFile multifile2 = profile;
		MultipartFile multifile3 = cmp_reg;

		if (!multifile1.isEmpty()) { // 이력서
			String fileName1 = multifile1.getOriginalFilename();
			File f1 = new File(path + fileName1);
			if (f1.exists()) {
				String onlyFileName = fileName1.substring(0, fileName1.indexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String time = sdf.format(new Date(System.currentTimeMillis()));
				String extension = fileName1.substring(fileName1.indexOf("."));
				fileName1 = onlyFileName + time + extension;
				File file1 = new File(path + fileName1);
				multifile1.transferTo(file1);
			} else {
				multifile1.transferTo(f1);
			}
			vo.setCarrier_image(fileName1);
		} else {
			vo.setCarrier_image("");
		}

		if (!multifile2.isEmpty()) { // 프로필 - 기본이미지 필요, 이미지파일만 가능
			String fileName2 = multifile2.getOriginalFilename();
			File f2 = new File(path + fileName2);
			if (f2.exists()) {
				String onlyFileName = fileName2.substring(0, fileName2.indexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String time = sdf.format(new Date(System.currentTimeMillis()));
				String extension = fileName2.substring(fileName2.indexOf("."));
				fileName2 = onlyFileName + time + extension;
				File file2 = new File(path + fileName2);
				multifile2.transferTo(file2);
			} else {
				multifile2.transferTo(f2);
			}
			vo.setProfile_image(fileName2);
		} else {
			vo.setProfile_image("default_profile.png");
		}

		if (!multifile3.isEmpty()) { // 사업자등록증
			String fileName3 = multifile3.getOriginalFilename();
			File f3 = new File(path + fileName3);
			if (f3.exists()) {
				String onlyFileName = fileName3.substring(0, fileName3.indexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String time = sdf.format(new Date(System.currentTimeMillis()));
				String extension = fileName3.substring(fileName3.indexOf("."));
				fileName3 = onlyFileName + time + extension;
				File file3 = new File(path + fileName3);
				multifile3.transferTo(file3);
			} else {
				multifile3.transferTo(f3);
			}
			vo.setCmp_reg_img(fileName3);
		} else {
			vo.setCmp_reg_img("");
		}

		System.out.println("upload success");

		int a = testService.insertTest(vo);
		
		System.out.println("insert완료");

		if(a != 0) {
			model.addAttribute("success", "OK");
		}else {
			model.addAttribute("success", "Fail");
		}
		
		int seq = testService.selectSequence();
		List<TestVO> result = testService.selectCommon();
		model.addAttribute("result", result);
		model.addAttribute("seq", seq);
		
		return "insaInputForm";

		// return null;
	}

	// 아이디 중복검사
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
	public String list(@RequestParam(value = "num", required = false) Integer num,
			@RequestParam(value = "sabun", required = false) Integer sabun,
			@RequestParam(value = "sabunSch", required = false) String sabunSch,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "join_gbn_code", required = false) String join_gbn_code,
			@RequestParam(value = "pos_gbn_code", required = false) String pos_gbn_code,
			@RequestParam(value = "join_date", required = false) String join_date,
			@RequestParam(value = "retire_date", required = false) String retire_date,
			@RequestParam(value = "put_yn", required = false) String put_yn,
			@RequestParam(value = "job_type", required = false) String job_type, Model model) throws Exception {

		List<TestVO> result = testService.selectCommon(); // 공통코드 selectbox
		System.out.println("listform getcommoncode");
		model.addAttribute("result", result);
		return "insaListForm";
	}



	// 페이징
	@ResponseBody
	@RequestMapping(value = "/getListWithPaging", method = RequestMethod.GET)
	public Map<String, Object> paging(TestVO vo, @RequestParam("num") int num) throws Exception {
		System.out.println("getListWithPaging : " + vo);
		System.out.println("num : " + num);
		Map<String, Object> map = new HashMap<String, Object>();
		
		int count = testService.pageCnt(vo); // 게시물 총 개수
		System.out.println("count:" + count);
		int postNum = 10; // 한 페이지에서 출력할 게시물 수
		int pageNum = (int) Math.ceil((double) count / postNum);// 하단페이징번호(게시물총수/한페이지출력수 올림)
		int displayPost = (num - 1) * postNum; // 매개변수 num은 현재페이지 //출력할게시물

		int pageNum_cnt = 5; // 한번에 표시할 페이징 번호의 갯수
		int endPageNum = (int) (Math.ceil((double) num / (double) pageNum_cnt) * pageNum_cnt); // 표시되는 페이지 번호 중 마지막 번호
		System.out.println("endPageNum : " + endPageNum);

		int startPageNum = endPageNum - (pageNum_cnt - 1);// 표시되는 페이지 번호 중 첫번째 번호
		System.out.println("startPageNum : " + startPageNum);

		int endPageNum_tmp = (int) (Math.ceil((double) count / (double) postNum)); // 마지막 번호 재계산

		if (endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
		System.out.println("endPageNum_tmp : " + endPageNum_tmp);
		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * postNum >= count ? false : true;

		List list = testService.getListWithPaging(vo, num, postNum); // 목록출력

		System.out.println("list" + list);
		System.out.println("prev" + prev);
		System.out.println("next" + next);

		map.put("list", list);
		map.put("pageNum", pageNum);
		map.put("startPageNum", startPageNum);
		map.put("endPageNum", endPageNum);
		map.put("prev", prev);
		map.put("next", next);
		map.put("num", num);
		return map;
	}

	//update입력폼 //list에서 사번 눌렀을때 여기로 먼저 온다
	@RequestMapping("/insaUpdateForm.do")
	public String update(TestVO vo, Model model) throws Exception {
		
		 // System.out.println("insaUpdateForm:" + vo.getSabun());
		  
		  List<TestVO> result = testService.selectCommon(); 
		  List<TestVO> info = testService.getInfo(vo.getSabun()); 
		  System.out.println("insaupdate" + info);
		  int sabun = vo.getSabun();
		  
		  HashMap<String, String> searchParam = new HashMap<String, String>();
		  searchParam.put("num", String.valueOf(vo.getNum())); 
		  searchParam.put("sabunSch", vo.getSabunSch()); 
		  searchParam.put("searchName", vo.getSearchName());
		  searchParam.put("searchJoin_gbn_code", vo.getSearchJoin_gbn_code());
		  searchParam.put("searchPos_gbn_code", vo.getSearchPos_gbn_code());
		  searchParam.put("searchJoin_day",vo.getSearchJoin_day());
		  searchParam.put("searchRetire_day", vo.getSearchRetire_day());
		  searchParam.put("searchPut_yn", vo.getSearchPut_yn()); 
		  searchParam.put("searchJob_type", vo.getSearchJob_type());
		  
		  model.addAttribute("sabun", sabun); 
		  model.addAttribute("info", info); //회원정보
		  model.addAttribute("result", result); //공통코드
		  model.addAttribute("searchParam", searchParam); //검색어정보
		 
		return "insaUpdateForm";
	}

	// 수정
	@RequestMapping(value = "/insaUpdateForm.do", method = RequestMethod.POST)
	public String update(TestVO vo, @RequestParam(value = "carrier", required = false) MultipartFile carrier,
			@RequestParam(value = "profile", required = false) MultipartFile profile,
			@RequestParam(value = "cmp_reg", required = false) MultipartFile cmp_reg, Model model,
			HttpServletRequest request, RedirectAttributes redirectAttr) throws Exception {

		
		System.out.println("update:" + vo);
		System.out.println(vo.getReg_no());
		System.out.println(vo.getReg_no_masking());
		String path = request.getSession().getServletContext().getRealPath("/resources/imgs/");
		// String path = "C:/upload/";

		MultipartFile multifile1 = carrier;
		MultipartFile multifile2 = profile;
		MultipartFile multifile3 = cmp_reg;

		Integer sabun = vo.getSabun();

		// carrier
		if (!multifile1.isEmpty()) {
			String fileName1 = multifile1.getOriginalFilename();
			System.out.println("새로운파일: " + fileName1);
			File f1 = new File(path + fileName1);

			if (f1.exists()) {
				String onlyFileName = fileName1.substring(0, fileName1.indexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_HH");
				String time = sdf.format(new Date(System.currentTimeMillis()));
				String extension = fileName1.substring(fileName1.indexOf("."));
				fileName1 = onlyFileName + "_" + time + extension;
			}
			if (!testService.getCarrier(vo.getSabun()).equals("default_carrier.png")) {
				File del_file = new File(path + testService.getCarrier(vo.getSabun()));
				del_file.delete(); // 파일삭제
			}
			vo.setCarrier_image(fileName1);
			multifile1.transferTo(new File(path + fileName1));
		} else {
			vo.setCarrier_image(vo.getCarrier_image());
		}

		// profile
		if (!multifile2.isEmpty()) {
			String fileName2 = multifile2.getOriginalFilename();
			File f2 = new File(path + fileName2);

			if (f2.exists()) {
				String onlyFileName = fileName2.substring(0, fileName2.indexOf("."));
				System.out.println("onlyFileName" + onlyFileName);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_HH");
				String time = sdf.format(new Date(System.currentTimeMillis()));
				String extension = fileName2.substring(fileName2.indexOf("."));
				fileName2 = onlyFileName + "_" + time + extension;
			}
			if (!testService.getProfile(vo.getSabun()).equals("default_profile.png")) {
				System.out.println("삭제할 기존 파일명 : " + testService.getProfile(vo.getSabun()));
				File del_file = new File(path + testService.getProfile(vo.getSabun()));
				del_file.delete(); // 파일삭제
			}
			vo.setProfile_image(fileName2);
			System.out.println("새로 업로드된 파일명 : " + vo.getProfile());
			multifile2.transferTo(new File(path + fileName2));
		} else {
			System.out.println("업로드 파일이 없음 : " + vo.getProfile());
			vo.setProfile_image(vo.getProfile_image());
		}

		// reg_img
		if (!multifile3.isEmpty()) {
			String fileName3 = multifile3.getOriginalFilename();
			System.out.println("새로 업로드된 파일명 : " + fileName3);
			File f3 = new File(path + fileName3);

			if (f3.exists()) {
				String onlyFileName = fileName3.substring(0, fileName3.indexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_HH");
				String time = sdf.format(new Date(System.currentTimeMillis()));
				String extension = fileName3.substring(fileName3.indexOf("."));
				fileName3 = onlyFileName + "_" + time + extension;
			}
			if (!testService.getProfile(vo.getSabun()).equals("default_cmpreg.png")) {
				System.out.println(testService.getCmp_reg(vo.getSabun()));
				File delfile = new File(path + testService.getCmp_reg(vo.getSabun()));
				delfile.delete(); // 파일삭제
			}
			vo.setCmp_reg_img(fileName3);
			System.out.println("새로 업로드된 파일명 : " + vo.getCmp_reg());
			multifile3.transferTo(new File(path + fileName3));
		} else {
			System.out.println("업로드 파일이 없음 : " + vo.getCmp_reg());
			vo.setCmp_reg_img(vo.getCmp_reg_img());
		}

		int a = testService.update(vo);
		
		System.out.println("update : " + a);
		if(a != 0) {
			redirectAttr.addFlashAttribute("updateSuccess", "OK");
		}else {
			redirectAttr.addFlashAttribute("updateSuccess", "fail");
		}

		List<TestVO> result = testService.selectCommon();
		List<TestVO> info = testService.getInfo(sabun);

		model.addAttribute("sabun", sabun); //사번
		model.addAttribute("info", info); //수정된 회원정보
		model.addAttribute("result", result); //공통코드
		//String SearchName = encodeURl(encodeURlComponent(vo.getSearchName()));//null
		//String name1 = new String(vo.getSearchName().getBytes("8859_1"), "UTF-8");//??
		//vo.setSearchName(URLDecoder.decode(vo.getSearchName()));
		String encodedParam = URLEncoder.encode(vo.getSearchName(), "UTF-8");
		// --------------num넘겨줘야함
		StringBuffer buff = new StringBuffer();
		buff.append("redirect:insaListForm.do?");
		buff.append("num=");
		buff.append(vo.getNum() + "&");
		buff.append("sabun=");
		buff.append(vo.getSabun() + "&");
		buff.append("sabunSch=");
		buff.append(vo.getSabunSch() + "&");
		buff.append("name=");
		buff.append(encodedParam + "&");
		buff.append("join_gbn_code=");
		buff.append(vo.getSearchJoin_gbn_code() + "&");
		buff.append("pos_gbn_code=");
		buff.append(vo.getSearchPos_gbn_code() + "&");
		buff.append("join_date=");
		buff.append(vo.getSearchJoin_day() + "&");
		buff.append("retire_date=");
		buff.append(vo.getSearchRetire_day() + "&");
		buff.append("put_yn=");
		buff.append(vo.getSearchPut_yn() + "&");
		buff.append("job_type=");
		buff.append(vo.getSearchJob_type());

		String redirectUrl = buff.toString();

		return redirectUrl;
		// return "redirect:insaUpdateForm.do";
	}

	private String encodeURI(String searchName) {
		// TODO Auto-generated method stub
		return null;
	}

	private Object encodeURlComponent(String searchName) {
		// TODO Auto-generated method stub
		return null;
	}

	// update에서 삭제
	@RequestMapping(value="/deleteUpdate.do", method = RequestMethod.POST)
	public String delete(TestVO vo, RedirectAttributes redirectAttr) throws Exception {
		System.out.println("삭제");
		System.out.println("delete:" + vo.getSabun());
		int sabun = vo.getSabun();
		int a = testService.delete(sabun);
		System.out.println("삭제결과 : " + a);

		if(a != 0) {
			redirectAttr.addFlashAttribute("delSuccess", "OK");
		}else {
			redirectAttr.addFlashAttribute("delSuccess", "fail");
		}
		
		String encodedParam = URLEncoder.encode(vo.getSearchName(), "UTF-8");

		// --------------num넘겨줘야함
		StringBuffer buff = new StringBuffer();
		buff.append("redirect:insaListForm.do?");
		buff.append("num=");
		buff.append(vo.getNum() + "&");
		buff.append("sabun=");
		buff.append(vo.getSabun() + "&");
		buff.append("sabunSch=");
		buff.append(vo.getSabunSch() + "&");
		buff.append("name=");
		buff.append(encodedParam + "&"); //유니코드에러
		buff.append("join_gbn_code=");
		buff.append(vo.getSearchJoin_gbn_code() + "&");
		buff.append("pos_gbn_code=");
		buff.append(vo.getSearchPos_gbn_code() + "&");
		buff.append("join_date=");
		buff.append(vo.getSearchJoin_day() + "&");
		buff.append("retire_date=");
		buff.append(vo.getSearchRetire_day() + "&");
		buff.append("put_yn=");
		buff.append(vo.getSearchPut_yn() + "&");
		buff.append("job_type=");
		buff.append(vo.getSearchJob_type());

		String redirectUrl = buff.toString();

		return redirectUrl;
		//String delRe = "삭제되었습니다.";
		//return "redirect:insaListForm.do";
	}

	// list에서 checkbox 삭제
	@RequestMapping(value="/delete.do", method = RequestMethod.POST)
	@ResponseBody
	public Object delete(@RequestParam(value = "sabunList[]") List<String> delList) throws Exception {
		System.out.println("arrdelete:" + delList);
		for (String i : delList) {
			int a = Integer.parseInt(i);
			testService.delete(a);
			System.out.println("삭제");
		}

		Map<String, Object> result = new HashMap<String, Object>();
		// System.out.println("삭제완료");
		// return "redirect:insaListForm.do";
		result.put("code", "OK");
		result.put("message", "삭제되었습니다.");
		return result;
	}

	// 다운로드 : ajax처리 불가능. 통신 200ok지만 클라이언트에서 다운로드 컨트롤 못함
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("/download") public byte[] fileDownload(HttpServletRequest
	 * request, HttpServletResponse response, String fileName3) {
	 * System.out.println("download"); System.out.println("name = " + fileName3);
	 * byte[] down = null;
	 * 
	 * try { String path =
	 * WebUtils.getRealPath(request.getSession().getServletContext(),
	 * "resources/imgs"); File file = new File(path + "/" + fileName3);
	 * System.out.println(file);
	 * 
	 * down = FileCopyUtils.copyToByteArray(file); String filename = new
	 * String(file.getName().getBytes(), "8859_1"); System.out.println("filename" +
	 * filename);
	 * 
	 * response.setHeader("Content-Disposition", "attachment; filename=\"" +
	 * filename + "\""); response.setContentLength(down.length);
	 * 
	 * } catch (FileNotFoundException e) { e.printStackTrace(); } catch (IOException
	 * e) { e.printStackTrace(); }
	 * 
	 * return down;
	 * 
	 * }
	 */

	/*
	 * @GetMapping("/download") public String download(HttpServletRequest request,
	 * HttpServletResponse response, String fileName3) throws IOException {
	 * 
	 * String path = WebUtils.getRealPath(request.getSession().getServletContext(),
	 * "resources/imgs/") + fileName3;
	 * 
	 * byte[] fileByte = FileUtils.readFileToByteArray(new File(path));
	 * 
	 * //response.setContentType("application/octet-stream");
	 * response.setHeader("Content-Disposition", "attachment; fileName=\"" +
	 * URLEncoder.encode(fileName3, "UTF-8")+"\";");
	 * response.setHeader("Content-Transfer-Encoding", "binary");
	 * 
	 * response.getOutputStream().write(fileByte);
	 * response.getOutputStream().flush(); response.getOutputStream().close();
	 * 
	 * return path; }
	 */

	
	//파일다운로드
	@GetMapping("/download/{file}")
	public void fileDownload(@PathVariable String file, HttpServletResponse response, HttpServletRequest request)
			throws IOException {

		String path = request.getSession().getServletContext().getRealPath("/resources/imgs/");
		File f = new File(path, file);
		// file 다운로드 설정
		response.setContentType("application/download");
		response.setContentLength((int) f.length());
		response.setHeader("Content-disposition", "attachment;filename=\"" + file + "\"");
		// response 객체를 통해서 서버로부터 파일 다운로드
		OutputStream os = response.getOutputStream();
		// 파일 입력 객체 생성
		FileInputStream fis = new FileInputStream(f);
		FileCopyUtils.copy(fis, os);
		fis.close();
		os.close();
	}

}
