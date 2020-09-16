package com.weather.proj.temp.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.weather.proj.temp.dao.WeatherDAO;
import com.weather.proj.temp.service.WeatherParsing;
import com.weather.proj.temp.vo.WeatherVO;
@Controller
public class WeatherController {
	
	@Autowired
	WeatherDAO dao;
	
	// 오늘의 날씨 실시간으로 보여주기
	@RequestMapping("weathertoday")
	public ModelAndView showList(WeatherVO vo,ModelAndView mv) throws Exception{
		List<WeatherVO> list = (List<WeatherVO>)dao.selectLoc();
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat format= new SimpleDateFormat("yyyyMMdd");
		Date timetemp=new Date();
		cal.setTime(timetemp);
		cal.add(Calendar.DATE, -1);
		String yesterday=format.format(cal.getTime());
		String today = format.format(timetemp);
		vo.setToday(today);
		vo.setYesterday(yesterday);
		
		WeatherVO vo2=dao.selectLoc2(vo);
		List<WeatherVO> list3=dao.selectLoc3(vo);
		List<WeatherVO> list4=dao.selectLoc4(vo);
		
		mv.addObject("list",list);
		mv.addObject("list3",list3);
		mv.addObject("list4",list4);
		mv.addObject("vo2",vo2);
		mv.setViewName("weather/weathertoday");
		return mv;
	}
	
	// 날씨 기온, 강수량 데이터 보여주기
	@RequestMapping("weatherview")
	public String weatherview() throws Exception{
		
		return "weatherview/weatherview";
	}
}
