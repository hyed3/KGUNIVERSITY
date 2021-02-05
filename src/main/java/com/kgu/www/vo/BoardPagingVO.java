package com.kgu.www.vo;

public class BoardPagingVO {
	private int totalCnt;
	private int pageNum;
	private int perPageCnt;
	private int displayPageNum;
	private int pageBlock;
	private int startPage;
	private int endPage;
	private int lastPage;
	private boolean prev;
	private boolean next;
	private String searchType;
	private String searchKeyword;
	
	public BoardPagingVO() {}
	public BoardPagingVO(int perPageCnt, int displayPageNum) {
		this.perPageCnt = perPageCnt;
		this.displayPageNum = displayPageNum;
	}
	
	public void calcPaging() {
		pageBlock = (int)Math.ceil(pageNum/(double)displayPageNum);
		startPage = (pageBlock-1) * displayPageNum + 1;
		endPage = pageBlock * displayPageNum;
		lastPage = (int)Math.ceil(totalCnt/(double)perPageCnt);
		if(lastPage < 1)
			lastPage = 1;
		if(endPage > lastPage)
			endPage = lastPage;
		int lastPageBlock = (int)Math.ceil(lastPage/(double)displayPageNum);
		
		prev = pageBlock > 1 ? true : false;
		next = pageBlock < lastPageBlock ? true : false;
	}
	
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		if(this.pageNum <= 0)
			this.pageNum = 1;
		else
			this.pageNum = pageNum;
		
		calcPaging();
	}
	public int getPerPageCnt() {
		return perPageCnt;
	}
	public void setPerPageCnt(int perPageCnt) {
		this.perPageCnt = perPageCnt;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getLastPage() {
		return lastPage;
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
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
}
