package com.weather.proj.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.weather.proj.board.vo.BoardVO;


@Repository  //dao를  bean으로 등록하는 annotation
public class BoardDAO implements BoardDAOIf {
	@Inject
	SqlSession sqlSession;
	
	//게시물 목록조회
	@Override   
	public List<BoardVO> boardList(int start, int end, String search_option, String keyword) throws Exception {		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);	
		List<BoardVO> list = sqlSession.selectList("board.boardList", map);	
		return list;
	}
	
	
	//게시판 등록
	@Override
	public void boradWrite(BoardVO vo) throws Exception {
		sqlSession.insert("board.boardInsert", vo);
	}
    //게시판 조회
	@Override
	public BoardVO boradRead(int brd_no) throws Exception {
		return sqlSession.selectOne("board.boradRead", brd_no);
	}
    //게시판 수정
	@Override
	public void boardUpdate(BoardVO vo) throws Exception {
		sqlSession.update("board.boardUpdate", vo);
	}

	//게시판 삭제
	@Override
	public void boardDelete(int brd_no) throws Exception {
		sqlSession.delete("board.boardDelete", brd_no); 
	}

	//조회수 증가처리
	@Override
	public void AddViewcnt(int brd_no) throws Exception {
		sqlSession.update("board.addViewcnt", brd_no);

	}

	//게시판 게시물수 계산(검색옵션 있는 경우 검색 후 게시물수)
	@Override
	public int countRecord(String search_option, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return sqlSession.selectOne("board.countRecord", map);
	}

	//첨부파일 목록조회
	@Override
	public List<BoardVO> getFileList(int brd_no) {
		return sqlSession.selectList("board.fileList", brd_no); 
	}
	
	//첨부파일 저장
	@Override
	public void fileSave(BoardVO vo) {
		sqlSession.insert("board.fileSave", vo); 
	}
    
	//첨부파일 수정 사용안함: 첨부파일 삭제후 첨부파일 저장으로 처리
	@Override
	public void fileUpdate(BoardVO vo) {
		//sqlSession.insert("board.fileDelete", vo); 
	}
	
	//첨부파일 삭제(by saveName)
	@Override
	public void fileDelete(String saveName) {
		sqlSession.delete("board.fileDelete", saveName); 
	}
	//첨부파일 삭제(by oriNo)
	@Override
	public void fileDelByOrino(int oriNo) {
		sqlSession.delete("board.fileDelByOrino", oriNo); 		
	}
	
}
