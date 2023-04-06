package com.example.demo.test;

import java.util.List;

public interface TestService {
	public List<TestVO> selectTest();
	
	//시퀀스값
	public int selectSequence();
	//정보입력
	public int insertTest(TestVO vo) throws Exception;
	
	//공통코드 리스트
	public List<TestVO> selectCommon() throws Exception;
	
	//아이디 중복체크
	public int idCheck(String memberId) throws Exception;
	
	//등록한 회원정보수정정보
	public List<TestVO> getInfo(int sabun) throws Exception;
	
	//검색조건리스트
	public List<TestVO> searchList(TestVO vo) throws Exception;
	
	//페이지 카운트
	public int pageCnt(TestVO vo) throws Exception; 
	
	//페이징리스트
	public List<TestVO> getListWithPaging(TestVO vo,int num, int postNum) throws Exception; 
	
	//수정
	public int update(TestVO vo) throws Exception; 
	
	//삭제
	public int delete(int sabun) throws Exception;
	
	//프로필
	public String getProfile(int sabun) throws Exception;
	
	//사업자
	public String getCmp_reg(int sabun) throws Exception;
	
	//이력서
	public String getCarrier(int sabun) throws Exception;
	
}
