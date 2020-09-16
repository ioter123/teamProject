package com.weather.proj.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.weather.proj.admin.service.MemberManageService;
import com.weather.proj.admin.util.PageUtil;
import com.weather.proj.member.vo.MemberVO;

@Controller
public class MemberManageController {
	
	@Autowired
	MemberManageService mms;
	
	// 회원리스트
	@RequestMapping("memberManage")
	public ModelAndView memberManage(@RequestParam("nowPage") int nowPage,ModelAndView mv, MemberVO vo) {
		PageUtil PINFO=mms.getPageInfo(nowPage);
		int lineCount=PINFO.getLineCount();
		vo.setStartNo((nowPage-1)*lineCount+1);
		vo.setEndNo((nowPage)*lineCount);
		List<MemberVO> list=mms.memberManage(vo);
		mv.addObject("list", list);
		mv.addObject("PINFO", PINFO);
		mv.setViewName("admin/memberManage");
		return mv;
	}
	
	// 회원리스트 검색
	@RequestMapping("memberManageProc")
	public ModelAndView memberManageProc(@RequestParam("nowPage") int nowPage,ModelAndView mv, MemberVO vo) {
		PageUtil PINFO=null;
		mv.addObject("category", vo.getCategory());
		mv.addObject("word", vo.getWord());
		vo.setWord("%"+vo.getWord()+"%");
		if(vo.getCategory().equals("both")) {
			PINFO=mms.getPageInfo5(nowPage, vo);
		}else if(vo.getCategory().equals("cus_email")) {
			PINFO=mms.getPageInfo4(nowPage, vo);
		}else if(vo.getCategory().equals("cus_id")) {
			PINFO=mms.getPageInfo3(nowPage, vo);
		}else if(vo.getCategory().equals("cus_name")) {
			PINFO=mms.getPageInfo2(nowPage, vo);
		}
		int lineCount=PINFO.getLineCount();
		vo.setStartNo((nowPage-1)*lineCount+1);
		vo.setEndNo((nowPage)*lineCount);
		List<MemberVO> list=mms.memberManageProc(vo);
		PINFO.setNowPage(nowPage);
		mv.addObject("list", list);
		mv.addObject("PINFO", PINFO);
		mv.setViewName("admin/memberManage");
		return mv;
	}
	
	// 회원 정보 상세보기
	@RequestMapping("memberManageDetail")
	public ModelAndView memberManageDetail(@RequestParam("cus_no") int cus_no,@RequestParam("nowPage") int nowPage,
																	ModelAndView mv, MemberVO vo) {
		vo.setCus_no(cus_no);
		MemberVO vo1=mms.manageDetail(vo);
		mv.addObject("vo1", vo1);
		mv.addObject("nowPage", nowPage);
		mv.setViewName("admin/memberManageDetail");
		return mv;
	}
	
	// 회원 정보 수정 처리
	@RequestMapping("memberManageUpdateProc")
	public ModelAndView memberManageUpdateProc(@RequestParam("nowPage") int nowPage,ModelAndView mv, MemberVO vo) {
		mms.manageUpdate(vo);
		mv.addObject("cus_no",vo.getCus_no());
		mv.addObject("vo", vo);
		mv.addObject("nowPage", nowPage);
		RedirectView rv = new RedirectView("memberManageDetail.do");
		mv.setView(rv);
		return mv;
	}
}
