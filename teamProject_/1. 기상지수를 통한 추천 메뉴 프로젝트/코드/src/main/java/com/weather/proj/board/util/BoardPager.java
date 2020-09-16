package com.weather.proj.board.util;

public class BoardPager {
	public static final int PAGE_SCALE = 10;   // 페이지당 게시물수
	public static final int BLOCK_SCALE = 3;  // 화면당 블럭수
	
	private int nowPage;     //현재페이지 
	private int prevPage;    //이전페이지 
	private int nextPage;    //다음페이지 
	private int totalPage;   //전체페이지 
	private int nowBlock;    //현재블럭
	private int prevBlock;   //이전블럭
	private int nextBlock;   //다음블럭
	private int totalBlock;  //전체블럭 

	private int startPage;   //시작페이지
	private int endPage;     //끝페이지
	private int startBlock;  //시작블럭
	private int endBlock;    //끝블럭
	
	//생성자BoardPager(레코드 갯수, 현재페이지 번호)
	public BoardPager(int rec_count, int nowPage) {
		nowBlock = 1;
		this.nowPage = nowPage;
		
		setTotalPage(rec_count);  //전체페이지갯수 계산
		setPageRange();           //between 시작 and 끝
		
		setTotalBlock();          //전체페이지 블럭수
		setBlockRange();          //페이지 블록의 시작, 끝 번호 계산
	}
	
	public void setTotalPage(int rec_count) {
		totalPage = (int)Math.ceil(rec_count*1.0/PAGE_SCALE);
	}
	
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
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

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
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

	public int getTotalBlock() {
		return totalBlock;
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

	public int getStartBlock() {
		return startBlock;
	}

	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}

	public int getEndBlock() {
		return endBlock;
	}

	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
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

	public void setPageRange() {
		startPage = (nowPage-1)*PAGE_SCALE + 1;
		endPage = startPage + PAGE_SCALE - 1;
	}
	
	public void setTotalBlock() {
		totalBlock = (int)Math.ceil(totalPage / BLOCK_SCALE);
	}
	
	public void setTotalBlock(int totalBlock) {
		totalBlock = (int)Math.ceil(totalPage / BLOCK_SCALE);
	}
	
	public void setBlockRange() {
		nowBlock = (int)Math.ceil((nowPage-1)/BLOCK_SCALE)+1;
		startBlock = (nowBlock-1)*BLOCK_SCALE + 1;
		endBlock = startBlock + BLOCK_SCALE - 1;
		if(endBlock > totalPage)
			endBlock = totalPage;
		
		prevPage = (nowBlock==1)?1:(nowBlock-1)*BLOCK_SCALE;
		nextPage = (nowBlock>totalBlock)?(nowBlock*BLOCK_SCALE):(nowBlock*BLOCK_SCALE)+1;
	
		if(nextPage >= totalPage)
			nextPage = totalPage;
	}
}
