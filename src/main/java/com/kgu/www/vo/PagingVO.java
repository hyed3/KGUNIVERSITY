package com.kgu.www.vo;

public class PagingVO {
	//현재페이지,시작페이지,끝페이지,게시글 총 개수,페이지당 글 개수,마지막페이지,쿼리에 쓸 start,end
	private int nowPage,startPage,endPage,total,cntPerPage,lastPage,start,end;
	private int cntPage=10;
	
	private String Keyword;
	private String searchType;
	

	public PagingVO() {
		
	}
	
	public PagingVO(int total,int nowPage,int cntPerPage,String Keyword,String searchType) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		setKeyword(Keyword);
		setSearchType(searchType);

		calcLastPage(getTotal(),getCntPerPage());
		calcStartEndPage(getNowPage(),cntPage);
		calcStartEnd(getNowPage(),getCntPerPage());
	}
	
	
	//제일 마지막 페이지 계산
	public void calcLastPage(int total,int cntPerPage) {
		setLastPage((int)Math.ceil((double)total/(double)cntPerPage));
		
	}
	
	//시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage,int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage/(double)cntPage))*cntPage);
		if(getLastPage()<getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage+1);
		if (getStartPage()<1) {
			setStartPage(1);
		}
	}

	//DB 쿼리에서 사용할 start, end 값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage*cntPerPage);
		setStart(getEnd()-cntPerPage+1);
	}

	
	public String getKeyword() {
		return Keyword;
	}

	public void setKeyword(String Keyword) {
		this.Keyword = Keyword;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCntPage() {
		return cntPage;
	}

	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	
	@Override
	public String toString() {
		return searchType+"    "+Keyword;
	}
	
}