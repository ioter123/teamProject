package com.weather.proj.notice.service;

public class NoticePager {
	
//	private int page;  //현재 페이지 번호
//	private int perPageNum;//한 페이지당 보여지는 게시글 갯수
//	
//	public int getPageStart() {   ////현재 페이지의 게시글 시작 번호 = (현재 페이지 번호 - 1) * 페이지당 보여줄 게시글 갯수
//													//getPerPageNum = (this.page - 1) * perPageNum
//		return (this.page-1)*perPageNum;
//		
//	}
//	public NoticePager() {  //기본생성자
//		this.page = 1;
//		this.perPageNum = 10;
//	}
//	
//	public int getPage() {
//		return page;
//	}
//	
//	public void setPage(int page) {
//		if(page <= 0) {   //페이지번호가 없을때 
//			this.page = 1;  //1로 초기화
//		}else {
//			this.page = page;  
//		}
//	}
//	
//	public int getPerPageNum() {
//		return perPageNum;
//	}
//	
//	public void setPerPageNum(int pageCount) { 
//		int cnt = this.perPageNum;  //한 페이지 게시글 갯수 ->cnt
//		if(pageCount != cnt) {  
//			this.perPageNum = cnt;
//		}else {
//			this.perPageNum = pageCount;
//		}
//	}
	
	
	
	//--------------------------------------------------------------------------------
	
	//페이지당 게기물 수
	public static final int PAGE_SCALE = 5;
	//화면당 페이지 수
	public static final int BLOCK_SCALE = 5;
	private int curPage; //현재 페이지
	private int prevPage; //이전 페이지
	private int nextPage; //다음 페이지
	private int totalPage; //전체 페이지 갯수
	private int totalBlock; //전체 페이지 블록 갯수
	private int curBlock; //현재 페이지 블록
	private int prevBlock; //이전 페이지 블록
	private int nextBlock; //다음 페이지 블록
	private int pageBegin;  //#{start}
	private int pageEnd; //#{end}
	private int blockBegin; //현재 페이지 블록의 시작번호
	private int blockEnd; //현재 페이지 블록의 끝번호
	
	//NoticePager(레코드 갯수, 현재 페이지 번호)
	public NoticePager(int count, int curPage) {
		curBlock = 1;//현재 페이지 블록 번호
		this.curPage = curPage; //현재 페이지 설정
		setTotalPage(count);// 전체 페이지 갯수 계신
		setPageRange();
		setTotalBlock(); //전체 페이지 블록 갯수 계산
		setBlockRange(); //페이지 블록의 시작, 끝 번호 계산
	}

	private void setBlockRange() {
		//현재 페이지가 몇번째 페이지 블록에 속하는지 계산
		curBlock = (int)Math.ceil((curPage-1) / BLOCK_SCALE)+1;
		System.out.println("curBlock"+curBlock);
		//현재 페이지 블록의 시작, 끝 번호 계산
		blockBegin = (curBlock-1)*BLOCK_SCALE+1;
		//페이지 블록의 끝번호
		blockEnd = blockBegin+BLOCK_SCALE-1;
		//마지막 블록이 범위를 초과하지 않도록 계산
		if(blockEnd>totalPage) blockEnd = totalPage;
		//이전을 눌렀을때 이동할 페이지 번호
		prevPage = (curPage == 1) ? 1 : (curBlock-1)*BLOCK_SCALE;
		//다음을 눌렀을때 이동할 페이지 번호
		nextPage = curBlock > totalBlock ? (curBlock*BLOCK_SCALE) : (curBlock*BLOCK_SCALE)+1;
		//System.out.println("------++"+(curBlock*BLOCK_SCALE)+1);
		//마지막 페이지가 범위를 초과하지 않도록 처리
		if(nextPage >= totalPage) nextPage = totalPage;
	}

	private void setTotalBlock() {//페이지 블록의 갯수 계산(총 50페이지 일때 -> 5개 블록)
		//전체 페이지 갯수 /10
//		99/10 = 9.9 -> 10개
		totalBlock = (int)Math.ceil(totalPage / BLOCK_SCALE);
		//Math.ceil = >소수점 이하를 올림한다.
	}

	private void setPageRange() {
		//시작번호  = (현재페이지 -1)* 페이지당 게시물 수 +1;
		pageBegin = (curPage-1)*PAGE_SCALE+1;
		//끝번호 = 시작번호+페이지당 게시물수 -1;
		pageEnd = pageBegin+PAGE_SCALE-1;
	}

	private void setTotalPage(int count) {
		//Math.ceil(실수)올림 처리
		totalPage = (int)Math.ceil(count*1.0 / PAGE_SCALE);
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}

	public int getCurBlock() {
		return curBlock;
	}

	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}

	public int getPrevBlock() {
		return prevBlock;
	}

	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}

	public int getNextBlock() {
		return nextBlock;
	}

	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}

	public int getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public int getBlockBegin() {
		return blockBegin;
	}

	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}

	public int getBlockEnd() {
		return blockEnd;
	}

	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}

	public static int getPageScale() {
		return PAGE_SCALE;
	}

	public static int getBlockScale() {
		return BLOCK_SCALE;
	}

	public int getTotalPage() {
		return totalPage;
	}
//	
	
	
}
