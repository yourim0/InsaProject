package com.example.demo.test;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class TestServiceImpl implements TestService {

	@Autowired
	TestDAO testDAO;
	
	@Override
	public List<TestVO> selectTest() {
		List<TestVO> testList = testDAO.selectTest();
		String testStr = testList.get(0).getName();
		System.out.println(testStr);
		return null;
	}

	@Override
	public int insertTest(TestVO vo) throws Exception{
		System.out.println(vo.getMil_startdate()); 
		int a = testDAO.insertTest(vo);
		 return a;
	}

	@Override
	public List<TestVO> selectCommon() throws Exception{
		System.out.println("selectCommon");
		List<TestVO> commonList = testDAO.selectCommon();
		System.out.println("selectCommon" + commonList);
		return commonList;
	}

	@Override
	public int idCheck(String memberId) throws Exception{
		System.out.println("idCheck" + testDAO.idCheck(memberId));
		return testDAO.idCheck(memberId);
	}

	@Override
	public List<TestVO> getInfo(int sabun) {
		List<TestVO> getInfo = testDAO.getInfo(sabun);
		System.out.println(getInfo);
		return getInfo;
	}

	@Override
	public int selectSequence() {
		System.out.println("sequence");
		int seq = testDAO.selectSequence();
		return seq;
	}

	@Override
	public List<TestVO> searchList(TestVO vo) throws Exception {
		System.out.println("searchList");
		List<TestVO> searchList = testDAO.searchList(vo);
		return searchList;
	}

	//게시물 수
	@Override
	public int pageCnt(TestVO vo) throws Exception {
		int cnt = testDAO.pageCnt(vo);
		return cnt;
	}
	
	//페이징리스트
	@Override
	public List<TestVO> getListWithPaging(TestVO vo, int num, int postNum) {
		System.out.println("service"+ vo) ;
		System.out.println("service"+ num) ;
		System.out.println("service"+ postNum) ;
		HashMap data = new HashMap();
		data.put("num", num);
		data.put("postNum", postNum);
		data.put("vo", vo);
		List<TestVO> getListWithPaging = testDAO.getListWithPaging(data);
		System.out.println("service"+getListWithPaging);
		return getListWithPaging;
	}

	//수정
	@Override
	public int update(TestVO vo) throws Exception {
		System.out.println("serviceUpdate"+ vo) ;
		int a= testDAO.update(vo);
		return a;
	}

	@Override
	public int delete(int sabun) throws Exception {
		System.out.println("serviceDelete") ;
		int a = testDAO.delete(sabun);
		return a;
	}

	
	//이미지
	@Override
	public String getProfile(int sabun) throws Exception {
		String profile = testDAO.getProfile(sabun);
		return profile;
	}

	@Override
	public String getCmp_reg(int sabun) throws Exception {
		String cmp_reg = testDAO.getCmp_reg(sabun);
		return cmp_reg;
	}

	@Override
	public String getCarrier(int sabun) throws Exception {
		String carrier = testDAO.getCarrier(sabun);
		return carrier;
	}
	
	


}
