package com.weather.proj.notice.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weather.proj.notice.VO.NoticeVO;

/* myBatis를 이용하기위해서는
 * SqlSessionDaoSupport클래스를 상송받아야 한다
 * 이 클래스가 커넥션풀을 이용해서 커넥션받고, 스테이트먼트를 만들어서 관리
 */

public class NoticeDAO extends SqlSessionDaoSupport{
	@Autowired
	SqlSessionTemplate session;
	
	//private static final String NAMESPACE = "notice";
	//공지사항 전체목록보기
	public List<NoticeVO> noticeList(int start, int end, String searchOption, String keyword) throws Exception{		
		//검색옵션, 키워드 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		return session.selectList("notice.noticeList", map);
	}
	//중요 공지사항 전체목록보기
	public List<NoticeVO> noticeList2() throws Exception{		
		return session.selectList("notice.noticeList2");
	}
	
	//게시글 레코드 갯수
	public int countArticle(String searchOption, String keyword) throws Exception{
		//검색옵션, 키워드 맵에 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return session.selectOne("notice.countArticle", map);
	}
	
	

	//공지사항 게시글 상세보기
	public NoticeVO read(int no) throws Exception{
		return session.selectOne("notice.noticeDetail", no);
	
	}
	
	//게시글 조회수 증가
	public void increaseViewCnt(int no) throws Exception{
		session.update("notice.increaseViewCnt", no);
	}

	
	//게시물 작성
	public void create(NoticeVO vo) throws Exception{
		session.insert("notice.insert", vo);
	}
	


	//게시글 수정
	public void update(NoticeVO vo) throws Exception{
		session.update("notice.updateArticle", vo);
	}

	public NoticeVO updateViewRead(int no) throws Exception{
		return session.selectOne("notice.updateViewRead", no);
	}
	
	//게시글 삭제
	public void delete(int no) throws Exception{
		session.delete("notice.deleteArticle", no);
	}

	
	//-------------------------------------------------------------------------------
	
	//첨부파일추가
	public void addAttach(String fullname) throws Exception{
		session.insert("notice.addAttach", fullname);
	
	}
	
	//첨부파일 목록
	public ArrayList getAttach(int no) throws Exception{
		return (ArrayList)session.selectList("notice.getAttach", no);
		
	}
	
	//첨부파일 수정처리
	public void updateAttach(String filename, int no) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("filename", filename);
		map.put("no", no);
		session.insert("notice.updateAttach", map);
	}
	
	
	/*//첨부파일정보 조회
	public ArrayList  getFileDetail(int oriNo) {
		return (ArrayList)session.selectList("fileBoard.fileDetail", oriNo);
	}
	*/
	

	/*//게시글 첨부파일 삭제처리
	public void deleteFile(String fullname) throws Exception{
		session.delete("notice.deleteAttach", fullname);
	}*/
	 // 게시글 첨부파일 삭제
    public void deleteAttach(String fullname) throws Exception {
        session.delete("notice.deleteAttach", fullname);
    }
    

    
  /*  // 게시글 번호 조회
   
    public int getNo(String fullname) throws Exception {
        return session.selectOne("notice.getNo", fullname);}
    
    // 특정 게시글의 첨부파일 갯수 갱신
    public void updateAttachCnt(int no) throws Exception {
    	System.out.println("파일 갯수 - dao no--"+no);
        session.update("notice.updateAttachCnt", no);
    }
  */
	
/*	//파일 테이블 넣기 테스트
	public void insertFile(String filename) throws Exception{
		System.out.println("파일 테이블 넣기 dao----");
		session.insert("notice.insertFile", filename);
	}
*/
	
	
	

	
}
