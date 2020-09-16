package com.weather.proj.life.controller;

import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.weather.proj.life.service.LifeWeatherService;
import com.weather.proj.life.vo.LifeJisuVO;


@Controller
public class LifeWeatherController {
	
	@Autowired
	LifeWeatherService lws;
	
	// 오늘의 생활지수 보여주기
	@RequestMapping("lifejisu")
	public ModelAndView todayjisu(LifeJisuVO vo, ModelAndView mv,HttpSession session) throws Exception {
		LinkedHashMap arealist=lws.selectjisu(vo);
		LifeJisuVO vo1=(LifeJisuVO)arealist.get("vo");
		arealist.remove("vo");
		String UID =(String)session.getAttribute("UID");
		String LEVEL =(String)session.getAttribute("LEVEL");
		mv.addObject("UID", UID);
		mv.addObject("LEVEL", LEVEL);
		mv.addObject("arealist", arealist);
		mv.addObject("vo1", vo1);
		mv.setViewName("lifeweather/life_weather"); 
		return mv;
	}
	
	// 지수 상세보기 보여주기
	@RequestMapping("lifejisudetail")
	public ModelAndView jisudetail(ModelAndView mv,HttpServletRequest request,HttpSession session) throws Exception {
		String jisu=request.getParameter("jisu");
		String UID =(String)session.getAttribute("UID");
		String LEVEL =(String)session.getAttribute("LEVEL");
		mv.addObject("UID", UID);
		mv.setViewName("lifeweather/life_weather_detail_"+jisu); 
		return mv;
	}
	// 산출표 창 띄우기
	@RequestMapping("popup_04")
	public ModelAndView popup4(ModelAndView mv) throws Exception {
		mv.setViewName("lifeweather/popup_04"); 
		return mv;
	}
	// 산출표 창 띄우기
	@RequestMapping("popup_03")
	public ModelAndView popup3(ModelAndView mv) throws Exception {
		mv.setViewName("lifeweather/popup_03"); 
		return mv;
	}
}
