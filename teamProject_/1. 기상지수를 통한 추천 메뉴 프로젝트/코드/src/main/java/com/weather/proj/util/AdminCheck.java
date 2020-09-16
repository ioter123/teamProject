package com.weather.proj.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class AdminCheck extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String level = (String)session.getAttribute("LEVEL");
		if(level==null) {
			response.sendRedirect("main.do");
			return false;
		}else if(level.equals("0")) { 
			response.sendRedirect("main.do");
			return false;
		} else {
			return true;
		}
		
	}

}
