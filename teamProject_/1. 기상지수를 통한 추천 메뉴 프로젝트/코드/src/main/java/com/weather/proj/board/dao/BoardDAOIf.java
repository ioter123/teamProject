package com.weather.proj.board.dao;

import java.util.List;

import com.weather.proj.board.vo.BoardVO;


public interface BoardDAOIf {
	public void boradWrite(BoardVO vo) throws Exception;   //글쓰기
	public BoardVO boradRead(int brd_no) throws Exception; //글읽기
	public void boardUpdate(BoardVO vo) throws Exception;  //글수정
	public void boardDelete(int brd_no) throws Exception;  //글삭제
    
	public List<BoardVO> boardList(int start, int end,     //목록(페이징, 검색기능)
			String search_option, String keyword) throws Exception;
	
	public void AddViewcnt(int brd_no) throws Exception;   //조회수 증가처리
	
	public int countRecord(String search_option,           //게시판 게시물수 계산(검색옵션 있는 경우 검색 후 게시물수)
			String keyword) throws Exception;
	
	public List<BoardVO> getFileList(int brd_no);          //첨부파일 목록조회
	public void fileSave(BoardVO vo);                      //첨부파일저장
	public void fileDelete(String saveName);               //첨부파일삭제(by savename)
	public void fileDelByOrino(int oriNo);                 //첨부파일삭제(by oriNo)
	public void fileUpdate(BoardVO vo);                    //첨부파일수정
}
