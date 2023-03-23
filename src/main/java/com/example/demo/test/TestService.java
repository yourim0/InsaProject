package com.example.demo.test;

import java.util.List;

public interface TestService {
	public List<TestVO> selectTest();
	
	public void insertTest(TestVO vo);
	
	public List<TestVO> selectCommon();
}
