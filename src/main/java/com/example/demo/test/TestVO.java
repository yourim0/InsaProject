package com.example.demo.test;

import java.sql.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TestVO {
	private Integer sabun;
	private String name;
	private String eng_name;
	private String id;
	private String pwd;
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
	private Date mil_startdate;
	private Date mil_enddate;
	private String kosa_reg_yn;
	private String kosa_class_code;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private java.util.Date join_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private java.util.Date retire_date;
	private String crm_name;
	private String cmp_reg_no;
	private String cmp_reg_img;
	private String carrier;
	private String profile;
	private String profile_image;
	private String self_intro;
	private String carrier_image;
	
	private String gubun;
	private String code;
	private String note;
	
}
