package com.weather.proj.member.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.weather.proj.member.util.Email;
import com.weather.proj.member.util.EmailSend;
import com.weather.proj.member.service.MemberService;
import com.weather.proj.member.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	MemberService mSerive;
	
	@Autowired
    private EmailSend emailSender;
	
    @Autowired
    private Email email;
    
    private NaverLoginBO naverLoginBO;
    
    @Autowired
    KakaoController kc;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
    
	@RequestMapping("loginProc")
	public ModelAndView  loginProc(MemberVO vo, HttpSession session){
		vo.setLoginck("");
		String url =mSerive.loginProc(vo, session);
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView(url);
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping(value = "loginFrm", method = { RequestMethod.GET, RequestMethod.POST })
	public  ModelAndView   loginFrm(MemberVO vo, Model model, HttpSession session,ModelAndView mv) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        model.addAttribute("url", naverAuthUrl);
        mv.addObject("loginck",vo.getLoginck());
        mv.setViewName("member/loginFrm");
		return mv;
	}
	
	//아이디찾기
	@RequestMapping("loginSearchProc")
	public ModelAndView searchId(MemberVO vo){
		String cus_name = vo.getCus_name();
		System.out.println("111111:"+cus_name);
		//MemberVO result=mSerive.searchId(vo);
		List<MemberVO> result=mSerive.searchId(vo);
		
		String url;
		ModelAndView mv = new ModelAndView();
		if(result.size()==0) {
			url= "Search_No.do";
			
		}else {	
			//ID 찿아왔어
			//1) 어디로(주소)
			url= "Search_Yes.do";
			String cus_id = "";
			for(int i=0; i<result.size(); i++) {
				if(i==0) {
					cus_id = result.get(i).getCus_id();
				}else {
					cus_id = cus_id + ", " + result.get(i).getCus_id();
				}
			}
			MemberVO result1 = result.get(0);
			//2) 데이터(정보) 넘겨주기 - cus_id, cus_name
			mv.addObject("cus_id",cus_id);     //(1)db
			mv.addObject("cus_name",cus_name); //(2)이름
		}
		RedirectView rv = new RedirectView(url);
		mv.setView(rv);
		return mv;
	}
	
	// 아이디 찾기 성공
//	@RequestMapping("Search_Yes")
//	public  ModelAndView   searchYes(MemberVO vo,ModelAndView mv) {	
//		mv.addObject("cus_id",vo.getCus_id());
//		mv.setViewName("member/Search_Yes");
//		return mv;
//	}
	@RequestMapping("Search_Yes")
	public  ModelAndView   searchYes(String cus_id,
			                         String cus_name,
			                         ModelAndView mv) {	
		mv.addObject("cus_id",cus_id);
		mv.addObject("cus_name",cus_name);
		mv.setViewName("member/Search_Yes");
		return mv;
	}
	
	// 아이디 찾기 실패
	@RequestMapping("Search_No")
	public  String   searchNo() {
		return "member/Search_No";
	}
	
	@RequestMapping("loginSearch")
	public  String   searchIdFrm() {
		return "member/loginSearch";
	}
	
	@RequestMapping(value="logoutProc", produces = "application/json")
	public ModelAndView  logoutProc(HttpSession session){
		//JsonNode node = kc.Logout(session.getAttribute("token").toString());
		session.invalidate();
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView("main.do");
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("pwSearch_Yes")
	public  ModelAndView   pwsearchYes(MemberVO vo,ModelAndView mv) {
		mv.addObject("cus_password",vo.getCus_password());
		mv.setViewName("member/pwSearch_Yes");
		return mv;
	}
	
	@RequestMapping("pwSearch_No")
	public  String   pwsearchNo() {
		return "member/pwSearch_No";
	}
	
	@RequestMapping("pwSearch")
	public  String   searchpwFrm() {
		return "member/pwSearch";
	}
	
	//비밀번호 찾기
	@RequestMapping("pwSearchProc")
	public ModelAndView searchPwe(MemberVO vo) throws Exception{
		String url;
		ModelAndView mv = new ModelAndView();
		
		//MemberVO result=mSerive.searchPw(vo);
		
		//* 회원(cus_name, cus_id, cus_email) 존재여부 체크
		int isCheck = mSerive.check(vo);
		    
		//   :회원존재 -> 
		if(isCheck == 1) {
			//    1. 회원 초기화 패스워드 생성
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			uuid = uuid.substring(0, 10);
			vo.setCus_password(uuid);	
			
			//    2. 초기화 패스워드로 수정
			 mSerive.setPw(vo);
			
			//    3. 이메일 전송
			 email.setContent(new StringBuffer().append("<h2><span style='color:blue;'>JESUS</span> 임시비밀번호 안내입니다.</h2></br></br>").
			 			append("<p>안녕하세요.<p>").
			 			append("<p>JESUS를 이용해 주셔서 진심으로 감사드립니다.<p/>").
			 			append("<p>회원님의 임시비밀번호는 아래와 같습니다.</p></p></p>").
			 			append(vo.getCus_password()).
			 			append("</br></br><p>아래 <span style='color:blue;'>'홈페이지 로그인'</span> 글자를 클릭하여 임시비밀번호로 로그인 하신 후 비밀번호를 수정하여 이용해주시길 당부드립니다.</p>").
			 			append("<p>감사합니다.<p/><br/>").		
			 			append("<a href='http://teamJesus.iptime.org/proj/loginFrm.do' target='_blank'>[홈페이지 로그인]</a>").toString());
			 	email.setReceiver(vo.getCus_email());
	     		email.setSubject("[JESUS 임시비밀번호 발급] *아이디:" + vo.getCus_id());
	     		emailSender.SendEmail(email);
	     		url = "pwSearch_Yes.do";
				}
			//   :회원존재X -> pwSearch_No.do
		else {
			url= "pwSearch_No.do";
		}
		
		RedirectView rv = new RedirectView(url);
		mv.setView(rv);
		return mv;
	}

	private Object setCus_Class() {
		return null;
	}
	}











