package com.example.demo.test;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class TestVO {
	private Integer sabun;
	private String name;
	private String eng_name;
	private String id;
	
	private String pwd;
	private String pwd_as;
	private String pwd_chk;
	private String pwd_chk_as;
	
	private String phone;
	private String hp;
	private String reg_no;
	private Integer years;
	private String sex;
	private String email;
	private Integer zip;
	private String addr1;
	private String addr2;
	private String job_type;
	private String pos_gbn_code;
	private String dept_code;
	private Integer salary;
	private String join_gbn_code;
	private String gart_level;
	private String put_yn;
	private String mil_yn;
	private String mil_type;
	private String mil_level;
	private String mil_startdate;
	private String mil_enddate;
	private String kosa_reg_yn;
	private String kosa_class_code;
	private String join_date;
	private String retire_date;
//	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
//	private java.util.Date join_date;
//	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
//	private java.util.Date retire_date;
	private String crm_name;
	private String cmp_reg_no;
	private String reg_no_masking;//마스킹된 주민번호
	
	private MultipartFile carrier; //이력서
	private MultipartFile profile;//증명사진
	private MultipartFile cmp_reg; //사업자등록증
	
	private String cmp_reg_img; //사업자등록증
	private String profile_image; //프로필이미지
	private String carrier_image; //이력서이미지
	
	private String self_intro;
	private HashMap<String,String> searchParam;
	//공통
	private String gubun;
	private String code;
	private String note;
	
	//페이징
	//private int count; //현재페이지 번호
	private int num; //페이지당 출력할 데이터 개수
	private int pageNum; //하단 페이징 번호

	
	//검색값 넘기기
	private String sabunSch;
    private String searchName;
    private String searchJoin_gbn_code;
    private String searchPut_yn;
    private String searchPos_gbn_code;
    private String searchJoin_day;
    private String searchRetire_day;
    private String searchJob_type;
}
