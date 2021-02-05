package com.kgu.www.Book.paging;

public class SupPaging {
	private int page;	//현재 페이지 번호
	private int perPageNum; //페이지 당 출력되는 게시글의 횟수
	
	public SupPaging() { //기본 생성자는 10개 기본 셋팅
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public void setPage(int page) {
		if (page <=0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum<=0 || perPageNum>100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	public int getPageStart() {
		return (this.page-1)*perPageNum;
	}
}
