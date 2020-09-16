package com.weather.proj.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.weather.proj.board.dao.BoardDAO;
import com.weather.proj.board.vo.BoardVO;

@Service
public class BoardService implements BoardServiceIf {

	@Resource(name = "uploadPath")
	String uploadPath;
	
	@Inject
	BoardDAO boardDao;
	
	//게시판 조회
	@Override
	public List<BoardVO> boardList(int start, int end, String search_option, String keyword) throws Exception {
		List<BoardVO> list = boardDao.boardList(start, end, search_option, keyword);	
		return list;
	}

	//게시판 작성(글작성+첨부파일)
	@Transactional
	@Override
	public void boradWrite(BoardVO vo) throws Exception {
		//1.board 테이블에 레코드 추가 (게시물 번호 생성)
		boardDao.boradWrite(vo);		
			
		//2.board_fileattach 테이블에 레코드 추가 (게시물 번호 이용)
		//첨부파일이 없으면 리턴
		if(vo.getFiles() == null) return;
        
		ArrayList fileList = fList(vo);
		for(int i=0; i<fileList.size(); i++) {    //첨부파일이 있는 경우
			vo.setOriNo(vo.getBrd_no());			
			//업로드된 파일의 정보가 map으로 묶여 왔으니 풀자 => 다시 vo로 set
			HashMap map = (HashMap)fileList.get(i);
			vo.setPath((String)map.get("path"));
			vo.setOriName((String)map.get("oriName"));
			vo.setSaveName((String)map.get("saveName"));
			vo.setFileSize((Long)map.get("fileSize"));
		    
			boardDao.fileSave(vo);
		}	
	}
	//게시판 수정(글수정+첨부파일)
	@Transactional
	@Override
	public void boardUpdate(BoardVO vo) throws Exception {
		//1.board테이블 수정
		boardDao.boardUpdate(vo);

		//2.board_fileattach 테이블 수정: 첨부파일 삭제후 재등록
		
		//이전에 등록된 파일 삭제
		vo.setOriNo(vo.getBrd_no());
		boardDao.fileDelByOrino(vo.getOriNo());
       
		//수정될 첨부파일이 없으면 리턴
		if(vo.getFiles() == null) return;
        
		ArrayList fileList = fList(vo);
		for(int i=0; i<fileList.size(); i++) {    //첨부파일이 있는 경우
			vo.setOriNo(vo.getBrd_no());			
			//업로드된 파일의 정보가 map으로 묶여 왔으니 풀자 => 다시 vo로 set
			HashMap map = (HashMap)fileList.get(i);
			vo.setPath((String)map.get("path"));
			vo.setOriName((String)map.get("oriName"));
			vo.setSaveName((String)map.get("saveName"));
			vo.setFileSize((Long)map.get("fileSize"));
		    
			boardDao.fileSave(vo);
		}		
	}
	
	//게시판 읽기
	@Override
	public BoardVO boradRead(int brd_no) throws Exception {
		return boardDao.boradRead(brd_no);
	}

	//게시판 삭제
	@Transactional
	@Override
	public void boardDelete(int brd_no) throws Exception {
		boardDao.boardDelete(brd_no); 		
	}

	//뷰카운트 증가처리
	@Override
	public void AddViewcnt(int brd_no, HttpSession session) throws Exception {

		long update_time=0;
		if(session.getAttribute("update_time_"+brd_no)!=null) {
			//최근에 조회수를 올린 시간
			update_time = (Long)session.getAttribute("update_time_"+brd_no);
		}
		long current_time=System.currentTimeMillis();
		//일정 시간이 경과한 후 조회수 증가 처리
		if(current_time - update_time > 6000*1000) {
			//조회수 증가 처리
			boardDao.AddViewcnt(brd_no);
			//조회수를 올린 시간 저장
			session.setAttribute("update_time_"+brd_no, current_time);
		}		
	}

	//게시판 게시물수 계산
	@Override
	public int countRecord(String search_option, String keyword) throws Exception {
		return boardDao.countRecord(search_option, keyword);
	}
	
	//첨부파일 목록
	@Override
	public List<String> getFileList(int brd_no) {

		List<BoardVO> fileList = boardDao.getFileList(brd_no);
		
		List<String> list = new ArrayList<String>();
		for(int i=0; i<fileList.size(); i++) {        //첨부파일이 있는 경우
			BoardVO file = fileList.get(i);
			String nameAndSize = file.getPath().substring(uploadPath.length())+
					             file.getSaveName()+"^"+file.getFileSize();
			
			list.add(nameAndSize);
		}
		
		return list;
	}

	//사용안함
	@Override
	public void fileSave(String fileName) {
		// TODO Auto-generated method stub	
	}
	
	//첨부파일저장(saveName으로)
	@Override  
	public void fileDelete(String saveName) {
		boardDao.fileDelete(saveName);
	}
	//사용안함
	@Override
	public void fileUpdate(String fileName, int brd_no) {
		// TODO Auto-generated method stub		
	}
	
	//첨부파일용 리스트 생성
	public ArrayList fList(BoardVO vo){
		ArrayList fileList = new ArrayList();
		for(int i=0; i<vo.getFiles().length; i++) { //첨부파일의 갯수만큼 작업
			//업로드된 파일의 정보를 map으로 묶자                             ***2
			Map map = new HashMap();
			String fullName = vo.getFiles()[i];						
			map.put("path", uploadPath+fullName.substring(0,12));
			map.put("oriName", fullName.substring(fullName.lastIndexOf("_")+1));
			map.put("saveName", fullName.substring(12));
			map.put("fileSize", vo.getLen()[i]);
			
			fileList.add(map);			
		}
		
		return fileList;
	}

}
