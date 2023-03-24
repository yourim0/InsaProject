package com.example.demo.test;

import java.util.List;

public interface TestService {
	public List<TestVO> selectTest();
	
	//정보입력
	public void insertTest(TestVO vo) throws Exception;
	
	//공통코드 리스트
	public List<TestVO> selectCommon() throws Exception;
	
	//아이디 중복체크
	public int idCheck(String memberId) throws Exception;
}
