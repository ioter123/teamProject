package com.weather.proj.board.vo;

import java.util.Date;

	public class BoardVO {
		private int brd_no;              /* 게시물번호 */
		private String brd_title;        /* 제목 */
		private String brd_content;      /* 내용(CLOB) */
		private String brd_writer;       /* 작성자ID */
		private Date brd_regdate;        /* 등록일자 */
		private Date brd_updatedate;     /* 수정일자 */
		private int brd_viewcnt;         /* 조회수 */
	    private char brd_isshow;         /* 노출여부 */
		//------------------------------------------------------------//
		private String cus_name;         // 작성자 이름(customer테이블 조인) 
		private int reply_cnt;           // 댓글 갯수
		private int file_cnt;            // 파일 갯수
		private String show;             // 화면표시여부
		
		private String[] files;          //첨부파일 이름 배열
		private long[]   len;            //첨부파일사이즈 배열(int가 아닌 long으로)
		private int    oriNo;            //게시물번호
		private String path;             //첨부파일 경로
		private String oriName;          //첨부파일 원래이름
		private String saveName;         //첨부파일 저장이름
		private long fileSize;           //첨부파일 사이즈	
		
		//--- Getter & Setter-----------------------------------------//		
		public int getBrd_no() {
			return brd_no;
		}
		public void setBrd_no(int brd_no) {
			this.brd_no = brd_no;
		}
		public String getBrd_title() {
			return brd_title;
		}
		public void setBrd_title(String brd_title) {
			this.brd_title = brd_title;
		}
		public String getBrd_content() {
			return brd_content;
		}
		public void setBrd_content(String brd_content) {
			this.brd_content = brd_content;
		}
		public String getBrd_writer() {
			return brd_writer;
		}
		public void setBrd_writer(String brd_writer) {
			this.brd_writer = brd_writer;
		}
		public Date getBrd_regdate() {
			return brd_regdate;
		}
		public void setBrd_regdate(Date brd_regdate) {
			this.brd_regdate = brd_regdate;
		}
		public Date getBrd_updatedate() {
			return brd_updatedate;
		}
		public void setBrd_updatedate(Date brd_updatedate) {
			this.brd_updatedate = brd_updatedate;
		}
		public int getBrd_viewcnt() {
			return brd_viewcnt;
		}
		public void setBrd_viewcnt(int brd_viewcnt) {
			this.brd_viewcnt = brd_viewcnt;
		}
		public char getBrd_isshow() {
			return brd_isshow;
		}
		public void setBrd_isshow(char brd_isshow) {
			this.brd_isshow = brd_isshow;
		}
		public String getCus_name() {
			return cus_name;
		}
		public void setCus_name(String cus_name) {
			this.cus_name = cus_name;
		}
		public int getReply_cnt() {
			return reply_cnt;
		}
		public void setReply_cnt(int reply_cnt) {
			this.reply_cnt = reply_cnt;
		}
		public int getFile_cnt() {
			return file_cnt;
		}
		public void setFile_cnt(int file_cnt) {
			this.file_cnt = file_cnt;
		}
		public String getShow() {
			return show;
		}
		public void setShow(String show) {
			this.show = show;
		}
		public String[] getFiles() {
			return files;
		}
		public void setFiles(String[] files) {
			this.files = files;
		}
		public long[] getLen() {
			return len;
		}
		public void setLen(long[] len) {
			this.len = len;
		}
		public int getOriNo() {
			return oriNo;
		}
		public void setOriNo(int oriNo) {
			this.oriNo = oriNo;
		}
		public String getPath() {
			return path;
		}
		public void setPath(String path) {
			this.path = path;
		}
		public String getOriName() {
			return oriName;
		}
		public void setOriName(String oriName) {
			this.oriName = oriName;
		}
		public String getSaveName() {
			return saveName;
		}
		public void setSaveName(String saveName) {
			this.saveName = saveName;
		}
		public long getFileSize() {
			return fileSize;
		}
		public void setFileSize(long fileSize) {
			this.fileSize = fileSize;
		}
			
}
