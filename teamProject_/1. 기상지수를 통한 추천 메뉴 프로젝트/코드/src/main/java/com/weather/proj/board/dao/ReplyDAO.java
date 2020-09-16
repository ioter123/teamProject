package com.weather.proj.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.weather.proj.board.vo.ReplyVO;

@Repository  //dao bean으로 등록
public class ReplyDAO implements ReplyDAOIf{
	@Inject
	SqlSession sqlSession;
	
	//목록(페이징)
	@Override
	public List<ReplyVO> replyList(int rep_orino, int start, int end, HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("rep_orino", rep_orino);
		return sqlSession.selectList("reply.replyList", map);
	}
	//레코드 갯수 계산
	@Override
	public int countRecord(int rep_orino) throws Exception {
		return sqlSession.selectOne("reply.countRecord", rep_orino);
	}
	//댓글쓰기
	@Override
	public void replyInsert(ReplyVO vo) throws Exception {
		sqlSession.insert("reply.replyInsert", vo);
	}
	//댓글수정
	@Override
	public void replyUpdate(ReplyVO vo) throws Exception {
		sqlSession.update("reply.replyUpdate", vo);
	}
	//댓글삭제
	@Override
	public void replyDelete(int rep_no) throws Exception {
		sqlSession.delete("reply.replyDelete", rep_no);

	}

}
