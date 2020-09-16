package com.weather.proj.join.dao;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.weather.proj.member.vo.MemberVO;

@Repository  //dao瑜�  bean�쑝濡� �벑濡앺븯�뒗 annotation
public class JoinDAO {
	@Inject
	SqlSession sqlSession;
	
	// 연동회원가입
	public void joinInsert2(MemberVO vo) throws Exception {
		sqlSession.insert("join.joinInsert2", vo);
	}
	
	// 회원가입
	public void joinInsert(MemberVO vo) throws Exception {
		sqlSession.insert("join.joinInsert", vo);
	}
	// 인증 키 저장
	public void createAuthKey(MemberVO vo) throws Exception {
		 sqlSession.update("join.createAuthKey", vo);
	}
	// 메일 체크
	public void mailCheck(HashMap<String, String> map) {
		 sqlSession.update("join.mailCheck", map);	
	}
	
	// 아이디중복 체크
	public int joinIdCheck(String cus_id) {
		return sqlSession.selectOne("join.joinIdCheck", cus_id);	
	}
    // 회원 정보 조회
	public MemberVO joinView(String cus_id) {
		return sqlSession.selectOne("join.joinView", cus_id);	
	}
    // 회원 정보 수정
	public void joinUpdate(MemberVO vo) {
		sqlSession.update("join.joinUpdate", vo);
	}
	// 비밀번호 확인
	public int joinPwCheck(String cus_id, String cus_password) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cus_id", cus_id);
		map.put("cus_password", cus_password);
				
		return sqlSession.selectOne("join.joinPwCheck", map);	
	}
    // 비밀번호 변경
	public void joinPwUpdate(MemberVO vo) {
		sqlSession.update("join.joinPwUpdate", vo);
	}
	// 회원 탈퇴
	public void joinWithdraw(HashMap<String, String> map) {
		sqlSession.update("join.joinWithdraw", map);
		
	}

	
}
