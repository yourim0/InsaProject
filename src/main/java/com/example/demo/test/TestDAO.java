package com.example.demo.test;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TestDAO {
	public List<TestVO> selectTest();
	
	//시퀀스값
	public int selectSequence();
	//회원등록
	public void insertTest(TestVO vo);
	
	//공통코드
	public List<TestVO> selectCommon();

	//아이디 중복체크
	public int idCheck(String memberId);
	
	//등록한 회원정보수정정보
	public List<TestVO> getInfo(int sabun);
	
	//검색조건리스트
	public List<TestVO> searchList(TestVO vo);
}
 
