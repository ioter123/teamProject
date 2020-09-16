package com.weather.proj.admin.util;

public class PageUtil {
	private	int	nowPage;
	private	int	totalCount;
	
	private	int	lineCount;	
	private	int	pageGroup;		
							
	private	int	totalPage;	
	private	int	startPage;		
	private	int	endPage;	
	
	public PageUtil(int nowPage, int totalCount) {		
		this(nowPage, totalCount, 10, 5);
	}
	
	public PageUtil(int nowPage, int totalCount, int lineCount, int pageGroup) {
		this.nowPage = nowPage;
		this.totalCount = totalCount;
		this.lineCount = lineCount;
		this.pageGroup = pageGroup;

		calcTotalPage();
		calcStartPage();
		calcEndPage();
	}
	
	private	void calcTotalPage() {

		totalPage = (totalCount % lineCount == 0) ? (totalCount / lineCount) : (totalCount / lineCount + 1);
	}
	

	private	void calcStartPage() {
		startPage = nowPage - (pageGroup / 2);  
		if(startPage <= 0) {
			startPage = 1;
		}
		
	}

	private	void calcEndPage() {

		endPage = startPage + (pageGroup - 1);
		if(endPage >= totalPage) { 
			endPage = totalPage;  
		}
	}

	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getLineCount() {
		return lineCount;
	}
	public void setLineCount(int lineCount) {
		this.lineCount = lineCount;
	}
	public int getPageGroup() {
		return pageGroup;
	}
	public void setPageGroup(int pageGroup) {
		this.pageGroup = pageGroup;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

}
