package com.weather.proj.notice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.weather.proj.notice.VO.NoticeVO;
import com.weather.proj.notice.controller.NoticeUploadController;
import com.weather.proj.notice.dao.NoticeDAO;
import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;

@Service
public class NoticeService {
	@Autowired
	NoticeDAO noticeDAO;
	
	NoticeUploadController noticeUploadController;
	//공지사항 전체목록보기
    public List<NoticeVO> noticeList(int start, int end, String searchOption, String keyword) throws Exception {
        return noticeDAO.noticeList(start, end, searchOption, keyword);
    }
    //중요공지사항 전체목록보기
    public List<NoticeVO> noticeList2() throws Exception {
        return noticeDAO.noticeList2();
    }
    //게시글 레코드 갯수 
    public int countArticle(String searchOption, String keyword) throws Exception{
    	return noticeDAO.countArticle(searchOption, keyword);
    }
    
    
    //공지사항게시글 상세보기
    public NoticeVO read(int no) throws Exception{
    	NoticeVO vo =noticeDAO.read(no);
    	return vo;
    }

    //게시글 조회수 증가
	public void increaseViewCnt(int no, HttpSession session) throws Exception{
		long update_time =0;
		//세션에 저장된 조회시간 검색
		//최초로 조회할 경우에 세션에 저장된 값이 없기 때문에 if문은 실행x
		if(session.getAttribute("update_time"+no) != null) {
			//세션에서 읽어오기
			update_time = (Long)session.getAttribute("update_time"+no);
			System.out.println(update_time);
		}
		//시스템의 현재시간을 current_time에 저장
		long current_time = System.currentTimeMillis();
		//일정시간 경과후 조회수 증가 처리 24*60*60*1000(24시간)
		//시스템현재시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
		if(current_time - update_time > 5*1000) { //5초경과
			noticeDAO.increaseViewCnt(no);
			//세션에 시간을 저장 : "update_time"+no는 다른변수와 중복되지 않게 명한다.
			session.setAttribute("update_time"+no, current_time);
		}
		
		
	}
	
	
	//게시글 작성
	@Transactional  //트랜잭션 처리 메서드로 설정
	public void create(NoticeVO vo) throws Exception{
		String writer = vo.getWriter();
		String title = vo.getTitle();
		String body = vo.getBody();
		String isCheck = vo.getIsCheck();
//		String file_fullname = vo.get
		//String writer = vo.getWriter();
		//태그문자 처리
		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
		
		//공백문자 처리
		title = title.replace(" ", "&nbsp;&nbsp;");
		
		//줄바꿈 문자처리
		body = body.replace("\n", "<br>");
		
		vo.setTitle(title);
		vo.setBody(body);
		vo.setWriter(writer);
		//vo.setWriter(writer);
		//noticeDAO.create(vo);
		
		//게시물의 첨부파일정보 등록
		String[] files = vo.getFiles(); //첨부파일 배열
		//System.out.println("--------files---service  files.length="+files.length);
		if(files == null) {
			noticeDAO.create(vo);
			return; } //첨부파일이 없으면 메서드 종료
		//첨부파일들의 정보를 fileattach2테이블에 insert
		vo.setFileCnt(files.length);
        noticeDAO.create(vo);
        
     
		for(String fullname : files) {  //첨부파일 갯수만큼
			noticeDAO.addAttach(fullname); 
			//갯수알기 위한 번호얻기
			//noticeDAO.getNo(fullname);
		}

	}

	//공지사항 수정
	public void update(NoticeVO vo) throws Exception{
		int no = vo.getNo();
		String title = vo.getTitle();
		String body = vo.getBody();
		String isCheck = vo.getIsCheck();
		//태그문자 처리
		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
				
		//공백문자 처리
		title = title.replace(" ", "&nbsp;&nbsp;");
				
		//줄바꿈 문자처리
		body = body.replace("\n", "<br>");
		/*body = body.replace("<br>", "");*/
		
		vo.setTitle(title);
		vo.setBody(body);
		
		//noticeDAO.update(vo);
		
		//게시물의 첨부파일정보 등록
				String[] files = vo.getFiles(); //첨부파일 배열
				System.out.println("--------files---service"+files);
				if(files == null) {
					noticeDAO.update(vo);
					return; 
					} //첨부파일이 없으면 메서드 종료
				//첨부파일들의 정보를 fileattach2테이블에 insert
				vo.setFileCnt(files.length);
		        noticeDAO.update(vo);
				for(String filename : files) {  //첨부파일 갯수만큼
					noticeDAO.updateAttach(filename, no);
				}
		
		
	}


	public NoticeVO updateViewRead(int no) throws Exception{
		NoticeVO vo= noticeDAO.updateViewRead(no);
		String body = vo.getBody().replace("<br>", "\n");   //줄바꿈 태그 변환		
		vo.setBody(body);
		return vo;
	}
	

	
	//게시글 삭제
	public void delete(int no) throws Exception{
		noticeDAO.delete(no);
	}
	
	
	
	//게시글 수정
		@Transactional
		public void updateFile(NoticeVO vo) throws Exception{
			noticeDAO.update(vo);
			//첨부파일 정보 등록
			String[] files = vo.getFiles(); //첨부파일 배열
			//첨부파일이 없으면 종료
			if(files == null) return;
			
			//첨부파일들의 정보를 fileattach2에 insert
			for(String name : files) {
				noticeDAO.updateAttach(name, vo.getNo());
			}
		}
	
	
		//게시글의 첨부파일 목록
	public ArrayList getAttach(int no) throws Exception{
		ArrayList list = noticeDAO.getAttach(no);
		//String[] files = vo.getFiles(); //첨부파일 배열
		return list;
	}
	

	
	//첨부파일 삭제 처리
		public void deleteAttach(String fullname) throws Exception{
			noticeDAO.deleteAttach(fullname);
		}
		
}
	


	
	
	

	

