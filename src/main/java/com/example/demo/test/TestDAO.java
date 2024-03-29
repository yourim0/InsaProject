package com.example.demo.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TestDAO {
	public List<TestVO> selectTest();
	
	//시퀀스값
	public int selectSequence();
	//회원등록
	public int insertTest(TestVO vo);
	
	//공통코드
	public List<TestVO> selectCommon();

	//아이디 중복체크
	public int idCheck(String memberId);
	
	//등록한 회원정보수정정보
	public List<TestVO> getInfo(int sabun);
	
	//검색조건리스트
	public List<TestVO> searchList(TestVO vo);
	
	//페이징리스트
	public List<TestVO> getListWithPaging(HashMap data);
	
	//페이지 카운트
	public int pageCnt(TestVO vo); 
	
	//수정
	public int update(TestVO vo);
	
	//삭제
	public int delete(int sabun);
	
	//프로필
	public String getProfile(int sabun);
	
	//사업자
	public String getCmp_reg(int sabun);
	
	//이력서
	public String getCarrier(int sabun);
	
	
}
 
