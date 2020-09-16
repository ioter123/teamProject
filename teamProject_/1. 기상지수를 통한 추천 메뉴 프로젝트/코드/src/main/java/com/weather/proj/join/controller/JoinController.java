package com.weather.proj.join.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.weather.proj.board.service.BoardService;
import com.weather.proj.board.vo.BoardVO;
import com.weather.proj.join.service.JoinService;
import com.weather.proj.member.vo.MemberVO;



@Controller
public class JoinController {
	@Inject
	JoinService joinService;
	
	//회원가입(GET)
	@RequestMapping(value="joinProc.do", method=RequestMethod.GET)
	public String boardWrite() throws Exception{
		return "join/joinProc";
	}
	//회원가입(POST)
	@RequestMapping(value="joinProc.do", method=RequestMethod.POST)
	public String boardWrite(MemberVO vo, Model model, 
			                 RedirectAttributes rttr, 
			                 HttpServletRequest request, 
			                 HttpSession session) throws Exception{
		
		String phone = vo.getCus_phone1() + vo.getCus_phone2() + vo.getCus_phone3();
		vo.setCus_phone(phone);
		String email = vo.getCus_email1() + "@" + vo.getCus_email2();
		vo.setCus_email(email);
		
		joinService.joinInsert(vo);
		rttr.addFlashAttribute("authmsg" , "媛��엯�떆 �벑濡앺븳 �씠硫붿씪濡� �씤利앺빐二쇱꽭�슂.");
		
		return "join/joinEmailCfmReq";
	}
	//이메일 체크
	@RequestMapping(value = "/joinEmailCfm.do", method = RequestMethod.GET)
	public String joinEmailCfm(String cus_email, String key, Model model) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cus_email", cus_email);
		map.putIfAbsent("cus_authcode", key);
		
		joinService.mailCheck(map);
		model.addAttribute("cus_email", cus_email);

		return "join/joinEmailCfm";
	}
	
	//회원 정보 조회(GET)
	@RequestMapping(value="joinDetail.do", method=RequestMethod.GET)
	public ModelAndView joinDetail(HttpSession session,
			                       ModelAndView mav) throws Exception{

		String cus_id = (String)session.getAttribute("UID");
		MemberVO vo = joinService.joinView(cus_id);
		
		//이메일
		String email = vo.getCus_email();
		String email1 = email.substring(0, email.indexOf("@"));
		String email2 = email.substring(email.indexOf("@")+1);
		vo.setCus_email1(email1);
		vo.setCus_email2(email2);
		
		//핸드폰 번호
		String phone = vo.getCus_phone();
		String phone1 = phone.substring(0, 3);
		String phone2 = phone.substring(3, 7);
		String phone3 = phone.substring(7);
		vo.setCus_phone1(phone1);
		vo.setCus_phone2(phone2);
		vo.setCus_phone3(phone3);
		
		mav.addObject("vo", vo);
		mav.setViewName("join/joinDetail");

		return mav;		
	}
	
	//회원 정보 수정
	@RequestMapping(value="joinUpdate.do", method=RequestMethod.POST)
	public ModelAndView joinUpdate(MemberVO vo,
			                       HttpSession session,
			                       ModelAndView mav) throws Exception{
		String cus_id = (String)session.getAttribute("UID");
        vo.setCus_id(cus_id);
		String phone = vo.getCus_phone1() + vo.getCus_phone2() + vo.getCus_phone3();
		vo.setCus_phone(phone);
		String email = vo.getCus_email1() + "@" + vo.getCus_email2();
		vo.setCus_email(email);
				
		joinService.joinUpdate(vo);
		
		mav.addObject("vo", vo);
		mav.setViewName("join/joinDetail");

		return mav;	
	}
	
	//비밀번호 변경(GET)
	@RequestMapping(value="joinPwUpdate.do", method=RequestMethod.GET)
	public String joinPwUpdate() throws Exception{
		return "join/joinPwUpdate";
	}	
	//비밀번호 변경(POST)
	@RequestMapping(value="joinPwUpdate.do", method=RequestMethod.POST)
	public String joinPwUpdate(MemberVO vo, HttpSession session) throws Exception{
		String cus_id = (String)session.getAttribute("UID");
        vo.setCus_id(cus_id);
		
		joinService.joinPwUpdate(vo);
		
		session.invalidate();  //session 초기화
				
		return "redirect:/loginFrm.do";
	}
	
	//회원 탈퇴(GET)
	@RequestMapping(value="joinWithdraw.do", method=RequestMethod.GET)
	public String joinWithdraw() throws Exception{
		return "join/joinWithdraw";
	}
	//회원 탈퇴(POST)
	@RequestMapping(value="joinWithdraw.do", method=RequestMethod.POST)
	public String joinWithdraw(@RequestParam String cus_id, 
			                   @RequestParam String cus_password,
			                   HttpSession session) throws Exception{
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cus_id", cus_id);
		map.put("cus_password", cus_password);
		
		joinService.joinWithdraw(map);
		
		session.invalidate();  //session 초기화
				
		return "redirect:/main.do";
	}
		
	//아이디 체크
	@ResponseBody 
	@RequestMapping(value="joinIdCheck.do", method=RequestMethod.POST)
	public ResponseEntity<String> joinIdCheck(String cus_id)  throws Exception {
		String result = "valid";

		int check = joinService.joinIdCheck(cus_id);
				
		if(check == 1) {
			result = "invalid";
		}

		return new ResponseEntity<String>(result, HttpStatus.OK);
	}
	
	//비밀번호 체크
	@ResponseBody 
	@RequestMapping(value="joinPwCheck.do", method=RequestMethod.POST)
	public ResponseEntity<String> joinPwCheck(String cus_password, 
			                                  HttpSession session)  throws Exception {
		String cus_id = (String)session.getAttribute("UID");
		String result = "valid";

		int check = joinService.joinPwCheck(cus_id, cus_password);
						
		if(check != 1) {
			result = "invalid";
		}

		return new ResponseEntity<String>(result, HttpStatus.OK);
	}
}
