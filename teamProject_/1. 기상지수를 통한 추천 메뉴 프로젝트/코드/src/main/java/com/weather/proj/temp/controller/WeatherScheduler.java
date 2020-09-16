package com.weather.proj.temp.controller;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.weather.proj.life.vo.LifeJisuVO;
import com.weather.proj.life.vo.ProductVO;
import com.weather.proj.temp.dao.WeatherDAO;
import com.weather.proj.temp.service.WeatherParsing;
import com.weather.proj.temp.vo.WeatherVO;


public class WeatherScheduler{
	@Autowired
	WeatherParsing wp;
	
	@Autowired
	
	WeatherDAO dao;
	
	// 실시간 날씨 정보 DB로 받아오기
	@Scheduled(cron="0 35 0/1 * * ?")
	public void updateData() throws Exception {
		wp.weatherParsing();
		
	}

}
