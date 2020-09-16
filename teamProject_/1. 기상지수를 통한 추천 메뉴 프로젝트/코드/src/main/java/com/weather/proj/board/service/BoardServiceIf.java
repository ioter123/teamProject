package com.weather.proj.board.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.weather.proj.board.vo.BoardVO;

public interface BoardServiceIf {
	public void boradWrite(BoardVO vo) throws Exception;   //글쓰기
	public BoardVO boradRead(int brd_no) throws Exception; //글읽기
	public void boardUpdate(BoardVO vo) throws Exception;  //글수정
	public void boardDelete(int brd_no) throws Exception;  //글삭제
    
	public List<BoardVO> boardList(int start, int end,     //목록(페이징, 검색기능)
			String search_option, String keyword) throws Exception;
	
	public void AddViewcnt(int brd_no,                     //조회수 증가처리
			HttpSession session) throws Exception;
	
	public int countRecord(String search_option,           //레코드 갯수 계산
			String keyword) throws Exception;
	
	public List<String> getFileList(int brd_no);           //첨부파일 목록	
	public void fileSave(String fileName);                 //첨부파일저장
	public void fileDelete(String saveName);               //첨부파일삭제
	public void fileUpdate(String fileName, int brd_no);   //첨부파일수정	
}
