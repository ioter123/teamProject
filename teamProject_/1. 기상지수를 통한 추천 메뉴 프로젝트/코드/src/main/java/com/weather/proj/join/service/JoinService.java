package com.weather.proj.join.service;

import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.weather.proj.join.dao.JoinDAO;
import com.weather.proj.join.util.AuthKey;
import com.weather.proj.join.util.MailHandler;
import com.weather.proj.member.vo.MemberVO;

@Service
public class JoinService {

	@Inject
	JoinDAO joinDAO;
	@Inject
	private JavaMailSender mailSender;
	
	//회원가입 및 이메일인증
	@Transactional
	public void joinInsert(MemberVO vo) throws Exception {
		//1. 회원가입DAO
		joinDAO.joinInsert(vo);  
		
		//2. 회원가입-이메일인증
		String key = new AuthKey().getKey(50, false);   // 인증키 생성
		vo.setCus_authcode(key);		
		joinDAO.createAuthKey(vo); 
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[JESUS 이메일 인증]");
		//IP(localhost) 변경예정 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		sendMail.setText(
				  new StringBuffer().append("<h2><span style='color:blue;'>JESUS</span> 메일인증 안내입니다.</h2></br></br>").
				  		append("<p>안녕하세요.<p/>").
				  		append("<p>JESUS를 이용해 주셔서 진심으로 감사드립니다.<p/>").
				  		append("<p>아래 <span style='color:blue;'>'메일인증'</span>글자를 클릭하여 회원가입을 완료해 주세요.<p/>").
				  		append("<p>감사합니다.<p/><br/>").
				  		append("<a href='http://teamJesus.iptime.org/proj/joinEmailCfm.do?cus_email=").
				  		append(vo.getCus_email()).
				  		append("&key=").
				  		append(key).
				  		append("' target='_blank'> [메일 인증]  </a>").toString()
		);
		sendMail.setFrom("snfndwl8250@gmail.com", "JESUS admin");
		sendMail.setTo(vo.getCus_email());
		sendMail.send();
		
	}
	//사용자가 인증을 확인하였을 때 서버에서 요청받기
	public void mailCheck(HashMap<String, String> map) {
		joinDAO.mailCheck(map);	
	}
	//아이디중복체크
	public int joinIdCheck(String cus_id) throws Exception {
		return joinDAO.joinIdCheck(cus_id);		
	}
	//회원정보보기
	public MemberVO joinView(String cus_id) throws Exception {
		return joinDAO.joinView(cus_id);	
	}
    //회원정보수정
	public void joinUpdate(MemberVO vo) throws Exception {
		joinDAO.joinUpdate(vo);			
	}
	//패스워드체크
	public int joinPwCheck(String cus_id, String cus_password) {
		return joinDAO.joinPwCheck(cus_id, cus_password);	
	}
	//패스워드수정
	public void joinPwUpdate(MemberVO vo) {
		joinDAO.joinPwUpdate(vo);		
	}
	//회원탈퇴
	public void joinWithdraw(HashMap<String, String> map) {
		joinDAO.joinWithdraw(map);
		
	}

}
