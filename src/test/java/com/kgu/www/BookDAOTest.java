package com.kgu.www;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kgu.www.Book.persistence.BookDAO;
import com.kgu.www.Book.vo.BookVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BookDAOTest {
	
	private static final Logger logger = LoggerFactory.getLogger(BookDAOTest.class);
	
	@Autowired
	private BookDAO bdao;
	
	//db 입력
	/*@Test
	public void testCreate() throws Exception {
		BookVO bvo = new BookVO();
		for(int i = 1; i<=1000; i++) {
		bvo.setBook_picture(i+"번째글");
		bvo.setBook_name(i+"번째글");
		bvo.setBook_writer("글쓴이");
		bvo.setBook_price(100);
		bvo.setBook_info("1");
		bvo.setBook_mokcha("1");
		bvo.setBook_inventory(20);
		
		bdao.bookInsertForm(bvo);
		}
	}*/
	
	/*@Test
	public void purchaseInsert() throws Exception{
		PurchaseVO pvo = new PurchaseVO();
		pvo.setUser_id("asdf");
		pvo.setBook_name("대학수학");
		pvo.setBook_amount(1);
		
		bdao.purchaseInsertForm(pvo);
	}*/
	
	//페이징 처리 테스트
	/*@Test
	public void testsupPaging() throws Exception {
		SupPaging supPaging = new SupPaging();
		supPaging.setPage(11);
		supPaging.setPerPageNum(10);
		List<BookVO> list = bdao.supPaging(supPaging);
		
		for(BookVO bvo : list) {
			logger.info(bvo.getBook_name());//
		}
	}*/
	
	//URI CHECK //글 상세보기 이후 글목록으로 돌아왔을때 그페이지의 페이지목록이 보이도록
	/*@Test
	public void testURI() throws Exception {
		UriComponents uri = UriComponentsBuilder.newInstance().path("/book/getBookInfo.do")
				.path("/{module}/{page}")
				.queryParam("book_name", "1000번째글")
				.queryParam("perPageNum", 10)
				.build();
		
		logger.info("/book/getBookInfo.do?book_name=1000번째글&perPageNum=10");
		logger.info(uri.toString());
				
	}*/
	
	//검색처리 확인
	/*@Test
	public void search() throws Exception {
		Search search = new Search();
		search.setPage(1);
		search.setKeyword("아무개");
		search.setSearchType("book_writer");
		
		logger.info("===================");
		List<BookVO> bvo = bdao.searchBook(search);
		
		for(BookVO book : bvo) {
			logger.info(book.getBook_name());
		}
		
		logger.info("=====================");
		logger.info("searched book count" + bdao.countSearchedBook(search));
	}*/
	
	/*@Test
	public void getPurcahseInfo() throws Exception {
		String user_id = "user_id";
		List<PurchaseVO> list = bdao.purchaseList(user_id);
		
		for(PurchaseVO pvo : list) {
			logger.info("msg", pvo.getPurchase_num());//
		}
	}*/
	
	/*@Test //유저 구매 목록 페이징처리
	public void searchPurchase() throws Exception {
		UserPurchase up = new UserPurchase();
		String user_id = "ysm9203";
		up.setUser_id(user_id);
		
		logger.info("===================");
		List<PurchaseVO> pvo = bdao.userPurchase(up);
		
		for(PurchaseVO list : pvo) {
			logger.info(list.getBook_name());
		}
		
		logger.info("=====================");
		logger.info("searched book count" + bdao.countSearchedPurchase(up));
	}*/
	
	/*@Test //책 이름 중복확인
	public void bookChk() throws Exception { 
		BookVO bvo = new BookVO();
		String book_name = "Check";
		
		int cnt = bdao.bookChk(book_name);
		logger.info("book count : "+bdao.bookChk(book_name));
		
	}*/
}
