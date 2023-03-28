package com.example.demo.test;

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
	public void insertTest(TestVO vo) throws Exception{
		System.out.println(vo.getMil_startdate()); 
		testDAO.insertTest(vo);
		 
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
		return null;
	}

	@Override
	public int selectSequence() {
		System.out.println("sequence");
		int seq = testDAO.selectSequence();
		return seq;
	}

	@Override
	public List<TestVO> searchList(TestVO vo) {
		System.out.println("searchList");
		List<TestVO> searchList = testDAO.searchList(vo);
		return searchList;
	}


}
