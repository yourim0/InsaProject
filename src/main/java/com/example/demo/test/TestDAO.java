package com.example.demo.test;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TestDAO {
	public List<TestVO> selectTest();
	
	public void insertTest(TestVO vo);
	
	public List<TestVO> selectCommon();

	//아이디 중복체크
	public int idCheck(String memberId);
	
	
}
 
