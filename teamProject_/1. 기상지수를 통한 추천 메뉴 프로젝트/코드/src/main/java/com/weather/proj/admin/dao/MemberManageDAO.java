package com.weather.proj.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.weather.proj.life.vo.ProductVO;
import com.weather.proj.member.vo.MemberVO;

public class MemberManageDAO extends SqlSessionDaoSupport {
	@Autowired
	SqlSessionTemplate session;
	
	// 회원 갯수 조회
	public int memCnt() {
		return session.selectOne("memManage.memCnt"); 
	}
	
	// 회원 리스트
	public List<MemberVO> memberList(MemberVO vo) {
		return (List)session.selectList("memManage.memList", vo); 
	}
	// 회원 리스트 검색
	public List<MemberVO> memberListProc(MemberVO vo) {
		return (List)session.selectList("memManage.memListProc", vo); 
	}
	
	public List<MemberVO> memberListProc2(MemberVO vo) {
		return (List)session.selectList("memManage.memListProc2", vo); 
	}
	
	public List<MemberVO> memberListProc3(MemberVO vo) {
		return (List)session.selectList("memManage.memListProc3", vo); 
	}
	
	public List<MemberVO> memberListProc4(MemberVO vo) {
		return (List)session.selectList("memManage.memListProc4", vo); 
	}
	
	// 검색 회원수
	public int memCntProc(MemberVO vo) {
		return session.selectOne("memManage.memCntProc", vo); 
	}
	
	public int memCntProc2(MemberVO vo) {
		return session.selectOne("memManage.memCntProc2", vo); 
	}
	
	public int memCntProc3(MemberVO vo) {
		return session.selectOne("memManage.memCntProc3", vo); 
	}
	
	public int memCntProc4(MemberVO vo) {
		return session.selectOne("memManage.memCntProc4", vo); 
	}
	
	// 회원 정보 조회
	public MemberVO manageDetail(MemberVO vo) {
		return (MemberVO)session.selectOne("memManage.manageDetail", vo); 
	}
	
	// 회원 정보 수정
	public void manageUpdate(MemberVO vo) {
		session.update("memManage.updateMember", vo); 
	}

}
