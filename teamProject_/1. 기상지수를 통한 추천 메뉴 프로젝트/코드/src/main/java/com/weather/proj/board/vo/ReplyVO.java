package com.weather.proj.board.vo;

import java.util.Date;

public class ReplyVO {
	private int rep_no;          /* 댓글번호 */
	private int rep_orino;       /* 게시물번호 */
	private String rep_text;     /* 댓글내용 */
	private String rep_writer;   /* 작성자ID */
	private Date rep_regdate;    /* 등록일자 */
	private Date rep_updatedate; /* 수정일자 */
	private char rep_isshow;     /* 노출여부 */
	//------------------------------------------------------------//
	private String cus_name;     /* 댓글작성자 이름(customer테이블)*/
	private String secret_reply; /* 비밀댓글 여부 */
	private String brd_writer;   /* board테이블의 id */
	
	//--- Getter & Setter-----------------------------------------//		

	public int getRep_no() {
		return rep_no;
	}
	public void setRep_no(int rep_no) {
		this.rep_no = rep_no;
	}
	public int getRep_orino() {
		return rep_orino;
	}
	public void setRep_orino(int rep_orino) {
		this.rep_orino = rep_orino;
	}
	public String getRep_text() {
		return rep_text;
	}
	public void setRep_text(String rep_text) {
		this.rep_text = rep_text;
	}
	public String getRep_writer() {
		return rep_writer;
	}
	public void setRep_writer(String rep_writer) {
		this.rep_writer = rep_writer;
	}
	public Date getRep_regdate() {
		return rep_regdate;
	}
	public void setRep_regdate(Date rep_regdate) {
		this.rep_regdate = rep_regdate;
	}
	public Date getRep_updatedate() {
		return rep_updatedate;
	}
	public void setRep_updatedate(Date rep_updatedate) {
		this.rep_updatedate = rep_updatedate;
	}
	public char getRep_isshow() {
		return rep_isshow;
	}
	public void setRep_isshow(char rep_isshow) {
		this.rep_isshow = rep_isshow;
	}
	public String getCus_name() {
		return cus_name;
	}
	public void setCus_name(String cus_name) {
		this.cus_name = cus_name;
	}
	public String getSecret_reply() {
		return secret_reply;
	}
	public void setSecret_reply(String secret_reply) {
		this.secret_reply = secret_reply;
	}
	public String getBrd_writer() {
		return brd_writer;
	}
	public void setBrd_writer(String brd_writer) {
		this.brd_writer = brd_writer;
	}
		
}
