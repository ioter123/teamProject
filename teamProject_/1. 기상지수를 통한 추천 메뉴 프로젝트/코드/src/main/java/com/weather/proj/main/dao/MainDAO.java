package com.weather.proj.main.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.weather.proj.life.vo.ProductVO;

public class MainDAO extends SqlSessionDaoSupport {
	@Autowired
	SqlSessionTemplate session; 
	
	public ArrayList<ProductVO> mainProduct() {
		return (ArrayList)session.selectList("mainProduct.mainProductList");
	}
	

}
