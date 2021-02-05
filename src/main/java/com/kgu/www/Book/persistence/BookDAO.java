package com.kgu.www.Book.persistence;

import java.util.List;

import com.kgu.www.Book.paging.PurPaging;
import com.kgu.www.Book.paging.Search;
import com.kgu.www.Book.paging.SupPaging;
import com.kgu.www.Book.paging.UserPurchase;
import com.kgu.www.Book.vo.BookVO;
import com.kgu.www.Book.vo.PurchaseVO;



public interface BookDAO {
	void bookInsertForm(BookVO bvo) throws Exception; // 책 등록
	
	BookVO getBookInfo(BookVO bvo) throws Exception; //책 상세보기
	
	BookVO getBookInfoN(int boon_num) throws Exception; //책 번호로 정보 가져오기
	
	void updateBook(BookVO bvo) throws Exception; //책 수정
	
	void updateInventory(BookVO bvo) throws Exception; //책 구매 후 재고 수정
	
	void deleteBook(String book_name) throws Exception; //책 삭제
	
	List<BookVO> bookAll() throws Exception;//책 전체 목록
	
	List<BookVO> supPaging(SupPaging supPaging) throws Exception; //페이징처리
	
	int countBook(SupPaging supPaging) throws Exception; //책 목록 총 갯수
	
	List<BookVO> searchBook(Search search) throws Exception; //책 검색 처리
	
	int countSearchedBook(Search search) throws Exception; //검색 된 책 페이징 처리
	
	void purchaseInsertForm(PurchaseVO pvo) throws Exception; //구매 등록
	
	List<PurchaseVO> purPaging(PurPaging purPaging) throws Exception; //판매한 책 목록 페이징 처리
	
	int countPurchase(PurPaging purPaging) throws Exception; //판매 총 갯수
	
	List<PurchaseVO> userPurchase(UserPurchase userPurchase) throws Exception; //구매한 책 목록 페이징 처리
	
	int countSearchedPurchase(UserPurchase userPurchase) throws Exception; //유저가 구매한 책 목록
	
	int bookChk(String book_name) throws Exception; //책 이름 중복 확인
}
