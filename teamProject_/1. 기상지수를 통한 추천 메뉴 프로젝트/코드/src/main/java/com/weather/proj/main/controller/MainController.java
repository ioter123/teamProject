package com.weather.proj.main.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.weather.proj.life.service.LifeWeatherService;
import com.weather.proj.life.vo.LifeJisuVO;
import com.weather.proj.life.vo.ProductVO;
import com.weather.proj.main.service.MainService;
import com.weather.proj.temp.dao.WeatherDAO;
import com.weather.proj.temp.vo.WeatherVO;

@Controller
public class MainController {
	
	@Autowired
	MainService ms;	
	
	@Autowired
	LifeWeatherService lws;
	
	@Autowired
	WeatherDAO dao;
	
	// 메인화면 보여주기
	@RequestMapping("main")
	public ModelAndView mainPage(LifeJisuVO vo, WeatherVO vo2,ModelAndView mv,HttpSession session) throws Exception{
		// 상품 데이터 가져오기
		ArrayList<ProductVO> list=ms.mainProduct();
		// 지역별 데이터 가져오기
		List<WeatherVO> list2 = (List<WeatherVO>)dao.selectLoc();
		// 생활지수 데이터 가져오기
		LinkedHashMap arealist=lws.selectjisu(vo);
		LifeJisuVO vo1=(LifeJisuVO)arealist.get("vo");
		arealist.remove("vo");
		// 지역별 오늘의 날씨 정보 가져오기
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat format= new SimpleDateFormat("yyyyMMdd");
		Date timetemp=new Date();
		String today = format.format(timetemp);
		vo2.setToday(today);
		ArrayList list3=new ArrayList();
		for(WeatherVO VO:list2) {
			vo2.setLocal_code(VO.getLocal_code());
			WeatherVO vo3=dao.selectLoc2(vo2);
			list3.add(vo3);
		}
		// 로그인 확인 여부를 위한 세션값
		String UID =(String)session.getAttribute("UID");
		String LEVEL =(String)session.getAttribute("LEVEL");
		
		mv.addObject("UID", UID);
		mv.addObject("LEVEL", LEVEL);
		mv.addObject("arealist", arealist);
		mv.addObject("vo1", vo1);
		mv.addObject("list3", list3);
		mv.addObject("list2", list2);
		mv.addObject("list", list);
		mv.setViewName("main/main");
		return mv;
	}

}
