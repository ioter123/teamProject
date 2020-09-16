package com.weather.proj.board.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.weather.proj.board.service.BoardService;
import com.weather.proj.board.util.BoardPager;
import com.weather.proj.board.vo.BoardVO;

@Controller
@RequestMapping("/board/")  //공통 url mapping
public class BoardController {
	@Inject
	BoardService boardService;
	
	//첨부파일 위치
	@Resource(name = "uploadPath")
	String uploadPath;
		
	//게시판 목록 조회
	@RequestMapping("boardList.do")
	public ModelAndView boardList(
		 @RequestParam(defaultValue="1") int nowPage,
		 @RequestParam(defaultValue="all") String search_option,
		 @RequestParam(defaultValue="") String keyword
		) throws Exception{
		
		int rec_count = boardService.countRecord(search_option, keyword);
		BoardPager pager = new BoardPager(rec_count, nowPage);
		int start = pager.getStartPage();
		int end = pager.getEndPage();
		
		List<BoardVO> list = boardService.boardList(start, end, search_option, keyword);		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/boardList");
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("rec_count", rec_count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("pager", pager);
		
		mav.addObject("map", map);
		
		return mav;
	}
	
	//게시판 상세조회
	@RequestMapping(value="boardView.do")
	public ModelAndView boardView(@RequestParam int brd_no,
								  @RequestParam int nowPage,
								  @RequestParam String search_option,
							      @RequestParam String keyword,
							      HttpSession session) throws Exception{
		boardService.AddViewcnt(brd_no, session);
		BoardVO vo = boardService.boradRead(brd_no);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/boardView");
		mav.addObject("vo", vo);
		mav.addObject("nowPage", nowPage);
		mav.addObject("search_option", search_option);
		mav.addObject("keyword", keyword);
		return mav;
	}

	//게시판 글작성(GET)
	@RequestMapping(value="boardWrite.do", method=RequestMethod.GET)
	public void boardWrite() throws Exception{		
	}
	//게시판 글작성(POST)
	@RequestMapping(value="boardWrite.do", method=RequestMethod.POST)
	public String boardWrite(BoardVO vo, 
			                 HttpSession session) throws Exception{		

		String brd_writer = (String)session.getAttribute("UID");
		vo.setBrd_writer(brd_writer);   //작성자ID
	
		//게시판에 글쓰기 저장
		boardService.boradWrite(vo);
		
		//ModelAndView, RedirectView로 수정 예정  ~~~~~~~~~
		return "redirect:/board/boardList.do";	
	}
	
	//게시판 게시글 및 첨부파일 수정
	@RequestMapping(value="boardUpdate.do", method=RequestMethod.POST)
	public ModelAndView boardUpdate(@RequestParam int nowPage,
			  				  @RequestParam String search_option,
		                      @RequestParam String keyword,
		                      BoardVO vo,
		                      ModelAndView mav) throws Exception{
		boardService.boardUpdate(vo);

		RedirectView rv = new RedirectView("../board/boardList.do");
		rv.addStaticAttribute("nowPage", nowPage); //릴레이용
		rv.addStaticAttribute("search_option", search_option); //릴레이용
		rv.addStaticAttribute("keyword", keyword); //릴레이용
		
		mav.setView(rv);
		
		return mav;  
	}
	
	//게시판 삭제
	@RequestMapping("boardDelete.do")
	public ModelAndView boardDelete(int brd_no,
							  @RequestParam int nowPage,
							  @RequestParam String search_option,
							  @RequestParam String keyword,
							  ModelAndView mav) throws Exception {
		boardService.boardDelete(brd_no);      //삭제 처리

		RedirectView rv = new RedirectView("../board/boardList.do");
		rv.addStaticAttribute("nowPage", nowPage); //릴레이용
		rv.addStaticAttribute("search_option", search_option); //릴레이용
		rv.addStaticAttribute("keyword", keyword); //릴레이용
		
		mav.setView(rv);
		
		return mav;  		
	}
	
	//첨부파일 목록 조회: ArrayList를 리턴
	@RequestMapping("getFileList.do")
	@ResponseBody  // view가 아닌 데이터 자체를 리턴 
	public List<String> getFileList(@RequestParam int brd_no){
		
		//<!-- gson, json : ajax에서 ArrayList를 결과값으로 받을때 필요  -->
        //pom.xml에서 위위 메시지부분을 찿아 등록해야 함 ***
		return boardService.getFileList(brd_no);
	}

}
