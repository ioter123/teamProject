package com.weather.proj.notice.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;


import com.weather.proj.notice.VO.NoticeVO;
import com.weather.proj.notice.service.NoticePager;
import com.weather.proj.notice.service.NoticeService;

/*컨트롤러를 만드는 방법
 * 1. 컨트롤러는 반드시 base-package="기본경로" 하위에 만들어야만 한다
 * 2. @Controller 선언한다
 */
@Controller/*
@RequestMapping("/notice/*")*/
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	 
	//공지사항 전체목록보기
	@RequestMapping("noticeList.do")                  //파라미터값을 변수에 넣ㄴ느다.
	public ModelAndView noticeList(@RequestParam(defaultValue = "noti_title") String searchOption,
												@RequestParam(defaultValue = "") String keyword,
												@RequestParam(defaultValue = "1") int curPage,
												HttpSession session) throws Exception{
													//curPage(현재 페이지)-> 기본으로 1초기화
		//레코드의 갯수 계산
		int count = noticeService.countArticle(searchOption, keyword);
			
			
		//페이지 나누기 관련 처리
		NoticePager noticePager = new NoticePager(count, curPage);
		int start = noticePager.getPageBegin();  //첫페이지
		int end = noticePager.getPageEnd();
		    
		//관리자 확인
		String LEVEL =(String)session.getAttribute("LEVEL");
	    //관리자 이름(작성자)
	    String UNAME = (String)session.getAttribute("UNAME");
	    
	   
	    	
	    List<NoticeVO> noticeList = noticeService.noticeList(start, end, searchOption, keyword);  //NoticeService에서 선언한 noticeList
	    List<NoticeVO> noticeList2 = noticeService.noticeList2();
	    
	    if(noticeList.isEmpty()) {
		   	ModelAndView mav = new ModelAndView();
			mav.setViewName("notice/noticeList");
			mav.addObject("LEVEL", LEVEL);
			mav.addObject("UNAME", UNAME);
			mav.addObject("noticeList2", noticeList2);
			mav.addObject("noticeList", noticeList);
			return mav;
	    }
		    	
	    //데이터를 맵에저장
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("noticeList",noticeList);
	    map.put("noticeList2",noticeList2);
	    map.put("count", count); //레코드의 갯수
	    map.put("searchOption", searchOption); //검색옵션
	    map.put("keyword", keyword); //검색키워드
	    map.put("noticePager", noticePager);
	    
	    ModelAndView mav = new ModelAndView();
		
		mav.addObject("map", map); //맵에 저장된 데이터를 mav에 저장
		mav.setViewName("notice/noticeList");
	    return mav;   
	}
	    
	    //공지사항 게시글 상세내용 조회
	    
    @RequestMapping(value="noticeDetail.do", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int no, HttpSession session) throws Exception{
    	System.out.println("게시글 상세보기 파라미터 번호+=="+no);
    	//조회수 증가처리
    	noticeService.increaseViewCnt(no, session);
    	ArrayList list = noticeService.getAttach(no);
    	
    	//관리자 확인
    	 String LEVEL =(String)session.getAttribute("LEVEL");
    	//데이터+뷰를 같이 전달하는 객체
    	ModelAndView mav = new ModelAndView();
    	//뷰 이름
    	mav.setViewName("notice/noticeDetail");
    	//뷰에 전달할 데이터
    	mav.addObject("LEVEL", LEVEL);
    	mav.addObject("service", noticeService.read(no));
    	System.out.println("------------------------------------");
    	/*System.out.println("");*/
    	mav.addObject("LIST",list);//첨부파일정보 
    	
    	//mav.addObject("service", noticeService.getAttach(no));
    	
    	return mav;
    	
    }
	    
    //공지사항 게시글 작성
    //관리자만 허용해야함
    @RequestMapping(value = "noticeWrite.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeWrite() {
    	return "notice/noticeWrite";  //write.jsp로 이동
    }
	    
	    
    //게시글 작성처리
    @RequestMapping(value = "noticeInsert.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String noticeInsert(@ModelAttribute NoticeVO vo) throws Exception{
    	System.out.println("게시글 먼저 작성하는 noticeInsert양");
    	
    	if(vo.getIsCheck() == null || vo.getIsCheck().length() == 0){
			vo.setIsCheck("off");				
			
		}
    	System.out.println("title == ="+vo.getTitle());
    	System.out.println("ischeck == "+vo.getIsCheck());  //on으로 들어옴
    	noticeService.create(vo);
    	
    	
    	//return "notice/noticeWrite";
    	return "redirect:noticeList.do";
    	//return "redirect:noticeWrite.do";
    }//jsp포워딩- 파일저장을 위해
  
    
    @ResponseBody
    @RequestMapping(value = "updateView.do", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView updateView(@RequestParam int no, HttpSession session) throws Exception{
    	
    	
    	/*System.out.println("body==="+body);*/
    	NoticeVO vo = noticeService.updateViewRead(no);
    	System.out.println("View화면까지 들어옴+++no=="+no);
    	
    	
    	
    	ArrayList list = noticeService.getAttach(no);
    	ModelAndView mav = new ModelAndView();
    	//뷰에 전달할 데이터
    	mav.addObject("service", vo);
    	//뷰 이름
    	mav.setViewName("notice/noticeUpdate");
    	
    	mav.addObject("LIST",list);//첨부파일정보 
    	
    	
    	return mav;
    	//return "notice/noticeUpdate";
    }
    
    //게시글 수정
    //폼에서 입력한 내용들을 @ModelAttribute NoticeVO vo로 전달
    @RequestMapping(value = "noticeUpdate.do", method = {RequestMethod.POST})
    public String noticeUpdate(@ModelAttribute NoticeVO vo) throws Exception{ 
    	System.out.println("여기는?-noticeUpdate-controller");
    	if(vo.getIsCheck() == null || vo.getIsCheck().length() == 0){
			vo.setIsCheck("off");				
			
		}
    	System.out.println("ischeck-update확인 ===="+vo.getIsCheck());
    	System.out.println("----no=="+vo.getNo());
    	noticeService.update(vo);
    	System.out.println("여기까지오긴한다.");
    	System.out.println("no="+vo.getNo());
    	System.out.println("title = "+vo.getTitle());
    	System.out.println("body = "+vo.getBody());
    	return "redirect:noticeList.do";
    }
    
    //게시글 삭제
    @RequestMapping("noticeDelete.do")
    public String noticeDelete(@RequestParam int no) throws Exception{
    	noticeService.delete(no);
    	return "redirect:noticeList.do";
    }
    
    
    //게시글 첨부파일 목록 매핑
    @RequestMapping(value = "getAttach.do")
    @ResponseBody  //view가 아닌 data를 리턴
    //@PathVariable("no") int no
    public ArrayList getAttach(@PathVariable("no") int no) throws Exception{
    	System.out.println("controller -----gtAttach");
    	
    	return noticeService.getAttach(no);
    }
	    


	    
}
