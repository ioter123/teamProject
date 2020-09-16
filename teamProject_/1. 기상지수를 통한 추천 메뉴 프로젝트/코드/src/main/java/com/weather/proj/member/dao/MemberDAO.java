package com.weather.proj.member.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.weather.proj.member.vo.MemberVO;


public class MemberDAO extends SqlSessionDaoSupport{
	@Autowired
	SqlSessionTemplate session;
	
	public MemberVO loginProc(MemberVO vo) {
		MemberVO result = 
		(MemberVO)session.selectOne("member.loginProc",vo);
		return result;
	}
	
	public MemberVO loginProc2(MemberVO vo) {
		MemberVO result = 
		(MemberVO)session.selectOne("member.loginProc2",vo);
		return result;
	}
	
	public int getMemberCNT() {
		System.out.println("MemberDAOŬ������  getMemberCNT()");
		System.out.println("session ="+session);
		return session.selectOne("login.getMemberCNT");
	}

	public List<MemberVO> searchId(MemberVO vo) {
		return (List)session.selectList("member.searchId",vo);

	}
	
	public MemberVO searchPassword(MemberVO vo) {
		return(MemberVO)session.selectOne("member.searchPw",vo);
	}
	
	

	public void setPw(MemberVO vo) {
		session.update("member.setpw",vo);
	
		
	}

	public int check(MemberVO vo) {
		
		return session.selectOne("member.check",vo);
		
	}


	
	
}







