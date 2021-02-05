package com.kgu.www.Book.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kgu.www.Book.paging.PurPaging;
import com.kgu.www.Book.paging.Search;
import com.kgu.www.Book.paging.SupPaging;
import com.kgu.www.Book.paging.UserPurchase;
import com.kgu.www.Book.persistence.BookDAO;
import com.kgu.www.Book.vo.BookVO;
import com.kgu.www.Book.vo.PurchaseVO;

@Service
public class BookServiceImpl implements BookService {
	
	private final BookDAO bookDAO;
	
	@Inject
	public BookServiceImpl(BookDAO bookDAO) {
		this.bookDAO = bookDAO;
	}
	
	//책 등록
	@Override
	public void bookInsertForm(BookVO bvo) throws Exception{
		bookDAO.bookInsertForm(bvo);
	}
	
	//책 상세보기
	@Override
	public BookVO getBookInfo(BookVO bvo) throws Exception {
		return bookDAO.getBookInfo(bvo);
	}
	
	//책 상세보기 book_num 사용
	@Override
	public BookVO getBookInfoN(int book_num) throws Exception {
		return bookDAO.getBookInfoN(book_num);
	}
	
	//책 수정
	@Override
	public void updateBook(BookVO bvo) throws Exception {
		bookDAO.updateBook(bvo);
	}
	
	//책 재고 수정
	@Override
	public void updateInventory(BookVO bvo) throws Exception{
		bookDAO.updateInventory(bvo);
	}
	
	//책 삭제
	@Override
	public void deleteBook(String book_name) throws Exception{
		bookDAO.deleteBook(book_name);
	}
	
	//등록 책 전부 보기
	@Override
	public List<BookVO> bookAll() throws Exception {
		return bookDAO.bookAll();
	}
	
	//책 전체목록 및 페이징처리
	@Override
	public List<BookVO> supPaging(SupPaging supPaging) throws Exception {
		return bookDAO.supPaging(supPaging);
	}
	
	//전체목록 총 갯수
	@Override
	public int countBook(SupPaging supPaging) throws Exception {
		return bookDAO.countBook(supPaging);
	}
	
	//검색된 책
	@Override
	public List<BookVO> searchBook(Search search) throws Exception {
		return bookDAO.searchBook(search);
	}
	
	//검색된 책 총 갯수
	@Override
	public int countSearchedBook(Search search) throws Exception {
		return bookDAO.countSearchedBook(search);
	}
	
	//구매 등록
	@Override
	public void purchaseInsertForm(PurchaseVO pvo) throws Exception {
		bookDAO.purchaseInsertForm(pvo);
	}
	
	//판매한 책 목록
	@Override
	public List<PurchaseVO> purPaging(PurPaging purPaging) throws Exception {
		return bookDAO.purPaging(purPaging);
	}
	
	//판매한 책 총 갯수
	@Override
	public int countPurchase(PurPaging purPaging) throws Exception {
		return bookDAO.countPurchase(purPaging);
	}
	
	//유저가 구매한 책 목록
	@Override
	public List<PurchaseVO> userPurchase(UserPurchase userPurchase) throws Exception {
		return bookDAO.userPurchase(userPurchase);
	}
	
	//유저가 구매한 책 목록 총 갯수
	@Override
	public int countSearchedPurchase(UserPurchase userPurchase) throws Exception {
		return bookDAO.countSearchedPurchase(userPurchase);
	}
	
	//책 이름 중복확인
	@Override
	public int bookChk(String book_name) throws Exception {
		return bookDAO.bookChk(book_name);
	}
}
