package com.weather.proj.board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.weather.proj.board.service.ReplyService;
import com.weather.proj.board.util.BoardPager;
import com.weather.proj.board.vo.ReplyVO;

@RestController   
@RequestMapping("/reply/*")
public class ReplyController {
	@Inject
	ReplyService replyService;
	
    //댓글목록
	@RequestMapping("replyList.do")
	public ModelAndView replyList(int rep_orino, 
								  @RequestParam(defaultValue="1") int nowPage,
								  ModelAndView mav,
								  HttpSession session) throws Exception{
		int rec_count = replyService.countRecord(rep_orino);
		BoardPager pager = new BoardPager(rec_count, nowPage);
		int start = pager.getStartPage();
		int end = pager.getEndPage();		
		
		List<ReplyVO> list = replyService.replyList(rep_orino, start, end, session);
		mav.setViewName("board/replyList");
		mav.addObject("list", list);
		mav.addObject("pager", pager);
		mav.addObject("rep_orino", rep_orino);
				
		return mav;
	}	
	//댓글입력
	@RequestMapping("replyInsert.do")
	public void replyInsert(ReplyVO vo, HttpSession session) throws Exception{
		String rep_writer = (String)session.getAttribute("UID"); //댓글 작성자 아이디
		vo.setRep_writer(rep_writer);;   
		replyService.replyInsert(vo);
	}
	
	//댓글수정
	@ResponseBody //뷰가 아닌 데이터를 리턴
	@RequestMapping(value="replyUpdate.do", method=RequestMethod.POST)
	public ResponseEntity<String> replyUpdate(String text) throws Exception{
		//boardService.replyUpdate(fileName.substring(12)); 
		
		String strRepno = text.substring(0, text.indexOf("::"));
		int rep_no = Integer.parseInt(strRepno);
		String rep_text = text.substring(text.indexOf("::")+2);
		
		ReplyVO vo = new ReplyVO();
		vo.setRep_no(rep_no);
		vo.setRep_text(rep_text);
		
		replyService.replyUpdate(vo);
		
		return new ResponseEntity<String>("updated",HttpStatus.OK);
	}
	
	//댓글삭제
	@ResponseBody 
	@RequestMapping(value="replyDelete.do", method=RequestMethod.POST)
	public ResponseEntity<String> replyDelete(int rep_no)  throws Exception {
		replyService.replyDelete(rep_no);
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}
