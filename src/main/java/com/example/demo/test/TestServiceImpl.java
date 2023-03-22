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

}
