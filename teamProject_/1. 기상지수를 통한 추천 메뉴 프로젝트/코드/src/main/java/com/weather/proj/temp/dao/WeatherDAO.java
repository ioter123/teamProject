package com.weather.proj.temp.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.weather.proj.temp.vo.WeatherVO;

public class WeatherDAO extends SqlSessionDaoSupport {
	@Autowired
	SqlSessionTemplate session;
	
	// 지역 정보 가져오기
	public List<WeatherVO> selectLoc() throws Exception{ 
		return (List)session.selectList("weather.weatherLoc"); 
	}
	// 특정 지역 오늘의 날씨 가져오기
	public WeatherVO selectLoc2(WeatherVO vo) throws Exception{ 
		return session.selectOne("weather.weatherLoc2", vo); 
	}
	// 오늘 기온 정보 가져오기
	public List<WeatherVO> selectLoc3(WeatherVO vo) throws Exception{ 
		return (List)session.selectList("weather.weatherLoc3", vo); 
	}
	// 어제 기온 정보 가져오기
	public List<WeatherVO> selectLoc4(WeatherVO vo) throws Exception{ 
		return (List)session.selectList("weather.weatherLoc4", vo); 
	}
	// 실시간 날씨 정보 저장
	public void SaveWeather(WeatherVO vo) {
		session.insert("weather.weatherSave",vo);
		
	}
	
	
}
