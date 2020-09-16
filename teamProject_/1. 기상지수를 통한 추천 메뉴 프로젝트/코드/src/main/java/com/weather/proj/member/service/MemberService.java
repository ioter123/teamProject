package com.weather.proj.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weather.proj.member.dao.MemberDAO;
import com.weather.proj.member.vo.MemberVO;



@Service
public class MemberService {
	
	@Autowired
	MemberDAO dao;
	
	public String  loginProc(MemberVO vo, HttpSession session) {
		MemberVO result = dao.loginProc(vo);
        String url = "";
		
		if(result==null) {
			return "loginFrm.do?loginck=no";
		}
		else if(result.getCus_out().equals("Y")){
			return "loginFrm.do?loginck=out";
		}
		else if(result.getCus_emailck().equals("N")){
			return "loginFrm.do?loginck=email";
		}
		else {
			session.setAttribute("UID",result.getCus_id());
			session.setAttribute("UNAME",result.getCus_name());
			session.setAttribute("LEVEL",String.valueOf(result.getCus_class()));
			url = "main.do";
		}
		
		return url;
	}
	

	public List<MemberVO> searchId(MemberVO vo) {

		List<MemberVO> result = dao.searchId(vo);
		
		return result;
	
	}

	
	public MemberVO searchPw(MemberVO vo) {
		
		MemberVO result = dao.searchPassword(vo);
		return result;
	}

	public void setPw(MemberVO vo) {
		
		dao.setPw(vo);
		
	}

	public int check(MemberVO vo) {
		
		//int check = dao.check(vo);
		
		return dao.check(vo);
	}

}





