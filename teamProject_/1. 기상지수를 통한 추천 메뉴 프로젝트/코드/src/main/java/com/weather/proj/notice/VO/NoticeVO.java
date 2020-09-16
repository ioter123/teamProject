package com.weather.proj.notice.VO;

import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;
//공지사항
public class NoticeVO {

	private int no;  //번호
	private String writer; //작성자
	private String title; //제목
	private String body; //내용
	private Date regdate; //글등록일
	private Date update_date; //글 수정일
	private int hit; //조회수
	private String isshow;
	private String isCheck;
	

	
	private String[] files;  //첨부파일
	private String filename;
	private int fileCnt;    //파일 수
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getIsshow() {
		return isshow;
	}
	public void setIsshow(String isshow) {
		this.isshow = isshow;
	}

	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
		setFileCnt(files.length);
	}
	
	public int getFileCnt() {
		return fileCnt;
	}
	public void setFileCnt(int fileCnt) {
		this.fileCnt = fileCnt;
	}
	
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	
	public String getIsCheck() {
		return isCheck;
	}
	public void setIsCheck(String isCheck) {
		this.isCheck = isCheck;
	}
	@Override
	public String toString() {
		return "NoticeVO [no=" + no + ", writer=" + writer + ", title=" + title + ", body=" + body + ", regdate="
				+ regdate + ", update_date=" + update_date + ", hit=" + hit + ", isshow=" + isshow + ", isCheck="
				+ isCheck + ", files=" + Arrays.toString(files) + ", filename=" + filename + ", fileCnt=" + fileCnt
				+ "]";
	}
	
	
	
	
	
	
	
}
