package com.weather.proj.admin.service;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weather.proj.admin.dao.MemberManageDAO;
import com.weather.proj.admin.util.PageUtil;
import com.weather.proj.member.vo.MemberVO;

@Service
public class MemberManageService {
	
	@Autowired
	MemberManageDAO dao;
	
	// 회원리스트
	public List<MemberVO> memberManage(MemberVO vo) {
		List<MemberVO> list=dao.memberList(vo);
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy년 MM월 dd일 HH시");
		for(MemberVO vo1 : list) {
			String cus_data=format.format(vo1.getCus_date());
			vo1.setCus_date2(cus_data);
		}
		return list;
	}
	
	// 회원리스트 검색
	public List<MemberVO> memberManageProc(MemberVO vo) {
		List<MemberVO> list=null;
		
		if(vo.getCategory().equals("both")) {
			list=dao.memberListProc4(vo);
		}else if(vo.getCategory().equals("cus_email")) {
			list=dao.memberListProc3(vo);
		}else if(vo.getCategory().equals("cus_id")) {
			list=dao.memberListProc2(vo);
		}else if(vo.getCategory().equals("cus_name")) {
			list=dao.memberListProc(vo);
		}
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy�뀈 MM�썡 dd�씪 HH�떆");
		for(MemberVO vo1 : list) {
			String cus_data=format.format(vo1.getCus_date());
			vo1.setCus_date2(cus_data);
		}
		return list;
	}
	
	// 회원리스트 페이지 처리
	public PageUtil getPageInfo(int nowPage) {
		int totalCount=dao.memCnt();
		PageUtil pInfo = new PageUtil(nowPage,totalCount);
		return pInfo;	
	}
	public PageUtil getPageInfo2(int nowPage,MemberVO vo) {
		int totalCount=dao.memCntProc(vo);
		PageUtil pInfo = new PageUtil(nowPage,totalCount);
		return pInfo;	
	}
	public PageUtil getPageInfo3(int nowPage,MemberVO vo) {
		int totalCount=dao.memCntProc2(vo);
		PageUtil pInfo = new PageUtil(nowPage,totalCount);
		return pInfo;	
	}
	public PageUtil getPageInfo4(int nowPage,MemberVO vo) {
		int totalCount=dao.memCntProc3(vo);
		PageUtil pInfo = new PageUtil(nowPage,totalCount);
		return pInfo;	
	}
	public PageUtil getPageInfo5(int nowPage,MemberVO vo) {
		int totalCount=dao.memCntProc4(vo);
		PageUtil pInfo = new PageUtil(nowPage,totalCount);
		return pInfo;	
	}
	
	// 회원정보 상세보기
	public MemberVO manageDetail(MemberVO vo) {
		MemberVO vo1=dao.manageDetail(vo);
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy년 MM월 dd일 HH시");
		String cus_data=format.format(vo1.getCus_date());
		vo1.setCus_date2(cus_data);
		return vo1;
	}
	
	// 회원정보 수정 처리
	public void manageUpdate(MemberVO vo) {
		vo.setCus_email(vo.getCus_email1()+"@"+vo.getCus_email2());
		vo.setCus_phone(vo.getCus_phone1()+vo.getCus_phone2()+vo.getCus_phone3()+"");
		dao.manageUpdate(vo);
	}
}

