package com.weather.proj.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/* 이 클래스는 컨트롤러가 실행되기 전에 인터셉터를 해서 먼저 실행할 클래스
 * 클라이언트가 요청하면 이 때 권한을 검사해서 컨트롤러 실행여부를 판잔하는 클래스
 * 인터셉터 클래스가 되기 위해서는
 * 1. 반드시 HandlerInterceptorAdapter를 상속받아야 한다
 * 2. preHandle()함수를  반드시 overriding 해야한다. 
 *    리턴값이 true이면 컨트롤러가 실행되고 false를 반환하면 컨트롤러가 실행되지 않음
 */
public class LoginCheck extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 로그인 여부를 판단
		//로그인이 되었다면 요청컨트롤러가 정상적으로 실행되고 되지 않았다면 컨트롤러가 실행되지 않음
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("UID");
		
		if(id==null || id.length()==0) { //로그인 X
			System.out.println("falsed->로그인 X");
			//로그인폼으로 보여주도록 하겠다
			response.sendRedirect("../loginFrm.do");
			return false;
		} else {                         
			System.out.println("true->Controller"); 
			return true;
		}
	}

}
