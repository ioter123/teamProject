package com.weather.proj.life.service;


import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weather.proj.life.dao.SelectlifeDAO;
import com.weather.proj.life.vo.LifeJisuVO;

@Service
public class LifeWeatherService {
	
	@Autowired
	SelectlifeDAO dao;
	
	// 지수 정보 가져오기
	public LinkedHashMap selectjisu(LifeJisuVO vo) throws Exception {

		// 지점번호, 지점 이름
		List<HashMap<String, Object>> areaList=dao.localCodeList();
		LinkedHashMap areaName= new LinkedHashMap();
		for (HashMap<String, Object> map:areaList) {
			areaName.put(map.get("LOCAL_SI"), map.get("LOCAL_CODE"));
		}
		LifeJisuVO vo1=dao.selectJisu(vo);
		areaName.put("vo", vo1);
		return areaName;
	}	

}
