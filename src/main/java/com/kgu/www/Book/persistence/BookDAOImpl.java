package com.kgu.www.Book.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kgu.www.Book.paging.PurPaging;
import com.kgu.www.Book.paging.Search;
import com.kgu.www.Book.paging.SupPaging;
import com.kgu.www.Book.paging.UserPurchase;
import com.kgu.www.Book.vo.BookVO;
import com.kgu.www.Book.vo.PurchaseVO;

@Repository
public class BookDAOImpl implements BookDAO {
	
	private static final String NAMESPACE = "com.kgu.www.mapper.BookMapper";
	
	private final SqlSession sqlSession;
	
	@Inject
	public BookDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//책 등록
	@Override
	public void bookInsertForm(BookVO bvo) throws Exception{
		sqlSession.insert(NAMESPACE+".bookInsertForm", bvo);
	}
	
	//책 상세보기
	@Override
	public BookVO getBookInfo(BookVO bvo) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getBookInfo", bvo);
	}
	
	//책 상세보기 book_num으로 찾기
	@Override
	public BookVO getBookInfoN(int book_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getBookInfoN", book_num);
	}
	
	//책 수정
	@Override
	public void updateBook(BookVO bvo) throws Exception {
		sqlSession.update(NAMESPACE+".updateBook", bvo);
	}
	
	//책 재고 수정
	@Override
	public void updateInventory(BookVO bvo) throws Exception{
		sqlSession.update(NAMESPACE+".updateInventory", bvo);
	}
	
	//책 삭제
	@Override
	public void deleteBook(String book_name) throws Exception {
		sqlSession.delete(NAMESPACE+".deleteBook", book_name);
	}
	
	//책 전체 목록 보기
	@Override
	public List<BookVO> bookAll() throws Exception {
		return sqlSession.selectList(NAMESPACE+".bookAll");
	}
	
	//책 전체 목록 페이징 처리
	@Override
	public List<BookVO> supPaging(SupPaging supPaging) throws Exception {
		return sqlSession.selectList(NAMESPACE+".supPaging", supPaging);
	}
	
	//페이징 처리를 위한 책 갯수
	@Override
	public int countBook(SupPaging supPaging) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".countBook", supPaging);
	}
	
	//책 검색 및 페이징 처리
	@Override
	public List<BookVO> searchBook(Search search) throws Exception {
		return sqlSession.selectList(NAMESPACE+".searchBook", search);
	}
	
	//검색한 책 목록 갯수
	@Override
	public int countSearchedBook(Search search) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".countSearchedBook", search);
	}
	
	//구입 처리
	@Override
	public void purchaseInsertForm(PurchaseVO pvo) throws Exception {
		sqlSession.insert(NAMESPACE+".purchaseInsertForm", pvo);
	}
	
	//구입한 책 전체 목록
	@Override
	public List<PurchaseVO> purPaging(PurPaging purPaging) throws Exception {
		return sqlSession.selectList(NAMESPACE+".purPaging", purPaging);
	}
	
	//구입한 책 목록 갯수
	@Override
	public int countPurchase(PurPaging purPaging) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".countPurchase", purPaging);
	}
	
	//유저가 구매한 책 목록
	@Override
	public List<PurchaseVO>	userPurchase(UserPurchase userPurchase) throws Exception {
		return sqlSession.selectList(NAMESPACE+".userPurchase", userPurchase);
	}
	
	//유저가 구매한 책 목록 갯수
	@Override
	public int countSearchedPurchase(UserPurchase userPurchase) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".countSearchedPurchase", userPurchase);
	}
	
	//책 이름 중복확인
	@Override
	public int bookChk(String book_name) {
		return sqlSession.selectOne(NAMESPACE+".bookChk", book_name);
	}

}
