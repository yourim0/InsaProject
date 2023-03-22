package com.example.demo.test;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TestDAO {
	public List<TestVO> selectTest();
}
 
