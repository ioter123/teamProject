package com.weather.proj.board.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.weather.proj.board.vo.ReplyVO;


public interface ReplyServiceIf {
	public void replyInsert(ReplyVO vo) throws Exception; //댓글쓰기
	public void replyUpdate(ReplyVO vo) throws Exception; //댓글수정
	public void replyDelete(int rep_no) throws Exception; //댓글삭제
   
	//목록(페이징)
	public List<ReplyVO> replyList(int rep_orino, int start, int end, HttpSession session) 
			throws Exception;
	
	//레코드 갯수 계산
	public int countRecord(int rep_orino)
			throws Exception;
}
