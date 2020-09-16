package com.weather.proj.main.service;


import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weather.proj.life.vo.ProductVO;
import com.weather.proj.main.dao.MainDAO;

@Service
public class MainService {
	
	@Autowired
	MainDAO dao;
	
	public ArrayList<ProductVO> mainProduct(){
		ArrayList<ProductVO> list=dao.mainProduct();
		return list;
	}
	

}
