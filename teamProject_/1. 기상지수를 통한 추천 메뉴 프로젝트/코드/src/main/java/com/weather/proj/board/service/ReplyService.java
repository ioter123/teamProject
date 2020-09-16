package com.weather.proj.board.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.weather.proj.board.dao.ReplyDAO;
import com.weather.proj.board.vo.ReplyVO;

@Service
public class ReplyService implements ReplyServiceIf {
	@Inject
	ReplyDAO replyDao;
	
	//목록(페이징)
	@Override
	public List<ReplyVO> replyList(int rep_orino, int start, int end, HttpSession session) throws Exception {
		return replyDao.replyList(rep_orino, start, end, session) ;
	}
	//레코드 갯수 계산
	@Override
	public int countRecord(int rep_orino) throws Exception {
		return replyDao.countRecord(rep_orino);
	}
	//댓글쓰기
	@Override
	public void replyInsert(ReplyVO vo) throws Exception {
		replyDao.replyInsert(vo);
	}
	//댓글수정
	@Override
	public void replyUpdate(ReplyVO vo) throws Exception {
		replyDao.replyUpdate(vo);

	}
	//댓글삭제
	@Override
	public void replyDelete(int rep_no) throws Exception {
		replyDao.replyDelete(rep_no);

	}
}
