package com.kgu.www.Book;

import java.io.File;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kgu.www.Book.paging.PageMaker;
import com.kgu.www.Book.paging.PurPaging;
import com.kgu.www.Book.paging.Search;
import com.kgu.www.Book.paging.SupPaging;
import com.kgu.www.Book.paging.UserPurchase;
import com.kgu.www.Book.service.BookService;
import com.kgu.www.Book.vo.BookVO;
import com.kgu.www.Book.vo.PurchaseVO;

@Controller
@RequestMapping("/book")
public class BookController {
	
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	private final BookService bookService;
	private String savepoint ="C:\\Users\\pc\\Desktop\\KGUniversity\\src\\main\\webapp\\resources\\img";
	
	@Inject
	public BookController(BookService bookService) {
		this.bookService = bookService;
	} //컨트롤러 클래스 선언부에 book경로를 추가해서 공통의 경로를 book으로 인식하게 만듬
	
	//등록페이지 이동
	@RequestMapping(value = "/bookInsertForm.do", method = RequestMethod.GET)
	public String bookInsertFormGet() {
		logger.info("등록 페이지 이동");
		return "/book/bookInsertForm";
	}
	
	//등록 처리
	@RequestMapping(value = "/bookInsertForm.do", method = RequestMethod.POST)
	public String bookInsertFormPOST(@RequestParam(value = "book_file", required = false) MultipartFile book_file, @RequestParam HashMap<String,String> hashMap, RedirectAttributes rda)
			throws Exception {
		logger.info("등록...");
		String book_picture = "";
		if(!book_file.isEmpty()) {
			book_picture = book_file.getOriginalFilename();
			File save = new File(savepoint,book_file.getOriginalFilename());
			book_file.transferTo(save);
		}
		String book_name = (String) hashMap.get("book_name");
		String book_writer = (String) hashMap.get("book_writer");
		int book_price = (int) Integer.parseInt(hashMap.get("book_price"));
		String book_info = (String) hashMap.get("book_info");
		String book_mokcha = (String) hashMap.get("book_mokcha");
		int book_inventory = (int) Integer.parseInt(hashMap.get("book_inventory"));
		BookVO bvo = new BookVO();
		bvo.InsertVO(book_picture, book_name, book_writer, book_price, book_info, book_mokcha, book_inventory);
		bookService.bookInsertForm(bvo);
		rda.addFlashAttribute("msg", "입력완료"); //입력 완료
		return "redirect:/book/bookAll.do";
	}
	
	//목록 페이지 이동
	@RequestMapping(value = "/bookAll.do", method = RequestMethod.GET)
	public String SupPaging(Model model, SupPaging supPaging) throws Exception {
		logger.info("목록 페이지..");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setSupPaging(supPaging);
		pageMaker.setTotalCount(bookService.countBook(supPaging));
		model.addAttribute("supPaging", bookService.supPaging(supPaging));
		model.addAttribute("pageMaker", pageMaker);
		return "/book/bookAll";
	}
	
	//상세보기
	@RequestMapping(value = "/getBookInfo.do", method = RequestMethod.GET)
	public String getBookInfo(@ModelAttribute("bvo") BookVO bvo,@ModelAttribute("supPaging") SupPaging supPaging,
				Model model) throws Exception {
		logger.info("글 상세보기...");
		model.addAttribute("bvo", bookService.getBookInfo(bvo));
		return "/book/getBookInfo";
	}
	
	//수정 페이지 이동
	@RequestMapping(value="/updateBook.do", method = RequestMethod.GET)
	public String updateBookGET(@ModelAttribute("bvo") BookVO bvo, @ModelAttribute("supPaging") SupPaging supPaging
			, Model model) throws Exception {
		logger.info("수정 처리 페이지 이동");
		model.addAttribute("bvo", bookService.getBookInfo(bvo));
		return "/book/updateBook";
	}
	
	//수정처리
	@RequestMapping(value="/updateBook.do", method = RequestMethod.POST)
	public String updateBookPOST(@RequestParam(value = "book_file", required = false) MultipartFile book_file, @RequestParam HashMap<String,String> hashMap, RedirectAttributes rda
			, @ModelAttribute("bvo") BookVO bvo,SupPaging supPaging) throws Exception {
		logger.info("수정처리..");
		String book_picture = "";
		int book_num = (int) Integer.parseInt(hashMap.get("book_num"));
		System.out.println();
		BookVO bvo2 = bookService.getBookInfoN(book_num);
		if(!book_file.getOriginalFilename().equals("")) {
			File save = new File(savepoint, book_file.getOriginalFilename());
			book_file.transferTo(save);
			book_picture = book_file.getOriginalFilename();
			File OriginFile = new File(savepoint+"\\"+bvo2.getBook_picture());
			if(OriginFile.exists())
				if(OriginFile.delete())
					System.out.println("파일 삭제 성공");
				else
					System.out.println("파일 삭제 실패");
		} else {
			book_picture = bvo2.getBook_picture();
		}
		System.out.println(book_picture);
		String book_name = (String) hashMap.get("book_name");
		System.out.println(book_name);
		String book_writer = (String) hashMap.get("book_writer");
		int book_price = (int) Integer.parseInt(hashMap.get("book_price"));
		String book_info = (String) hashMap.get("book_info");
		String book_mokcha = (String) hashMap.get("book_mokcha");
		int book_inventory = (int) Integer.parseInt(hashMap.get("book_inventory"));
		bvo = new BookVO();
		bvo.UpdateVO(book_num, book_picture, book_name, book_writer, book_price, book_info, book_mokcha, book_inventory);
		bookService.updateBook(bvo);
		rda.addAttribute("page", supPaging.getPage());
		rda.addAttribute("perPageNum", supPaging.getPerPageNum());
		return "redirect:/book/bookAll.do";
	}
	
	//삭제처리
	@RequestMapping(value="/deleteBook.do", method = RequestMethod.POST)
	public String deleteBook(@RequestParam("book_name") String book_name, RedirectAttributes rda
			, SupPaging supPaging) throws Exception {
		logger.info("삭제처리..");
		bookService.deleteBook(book_name);
		rda.addAttribute("page", supPaging.getPage());
		rda.addAttribute("perPageNum", supPaging.getPerPageNum());
		rda.addFlashAttribute("msg", "delete 성공");
		return "redirect:/book/bookAll.do";
	}
	
	//검색처리
	@RequestMapping(value = "/search.do", method = RequestMethod.GET)
	public String searchBook(@ModelAttribute("search")Search search
			, Model model) throws Exception {
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setSupPaging(search);
		pageMaker.setTotalCount(bookService.countSearchedBook(search));
		
		model.addAttribute("book", bookService.searchBook(search));
		model.addAttribute("pageMaker", pageMaker);
		
		return "book/searchBook";
		
	}
	
	//결제 처리
	@RequestMapping(value = "/kakao.do", method = RequestMethod.GET)
	public String kakao(@RequestParam HashMap<String,String> hashMap, Model model, @ModelAttribute("bvo") BookVO bvo, String user_id) {
		int book_num = bvo.getBook_num();
		String book_name = bvo.getBook_name();
		String book_picture = bvo.getBook_picture();
		int book_inventory = bvo.getBook_inventory();
		int purchase_amount = Integer.parseInt(hashMap.get("purchase_amount"));
		int book_price = bvo.getBook_price();
		model.addAttribute("user_id", user_id);
		model.addAttribute("book_num", book_num);
		model.addAttribute("book_name", book_name);
		model.addAttribute("book_picture", book_picture);
		model.addAttribute("purchase_amount", purchase_amount);
		model.addAttribute("book_inventory", book_inventory);
		model.addAttribute("book_price", book_price);
		return "/book/kakao";
	}
	
	//구입 처리
	@RequestMapping(value = "/purchase.do", method = RequestMethod.GET)
	public String purchaseInsertForm(@RequestParam HashMap<String,String> hashMap,
			@ModelAttribute("bvo") BookVO bvo,SupPaging supPaging, Model model, String user_id) throws Exception {
		String book_name = bvo.getBook_name();
		String book_picture = bvo.getBook_picture();
		int book__tamount = bvo.getBook_inventory();
		int book_amount = Integer.parseInt(hashMap.get("purchase_amount"));
		int book_inventory = book__tamount - book_amount;
		int book_num = bvo.getBook_num();
		PurchaseVO pvo = new PurchaseVO(user_id, book_picture, book_name, book_amount);
		bookService.purchaseInsertForm(pvo);
		BookVO inventory = new BookVO(book_num, book_inventory);
		bookService.updateInventory(inventory);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setSupPaging(supPaging);
		pageMaker.setTotalCount(bookService.countBook(supPaging));
		model.addAttribute("supPaging", bookService.supPaging(supPaging));
		model.addAttribute("pageMaker", pageMaker);
		logger.info("구입 처리...");
		return "/book/bookAll";
	}
	
	//전체 구매 목록
	@RequestMapping(value = "/purchaseList.do", method = RequestMethod.GET)
	public String PurchaseAll(PurPaging purPaging, Model model) throws Exception {
				PageMaker pageMaker = new PageMaker();
				pageMaker.setPurPaging(purPaging);
				pageMaker.setTotalCountP(bookService.countPurchase(purPaging));
				model.addAttribute("pageMaker", pageMaker);
				model.addAttribute("pvo", bookService.purPaging(purPaging));
		return "/book/purchaseList";
	}
	
	//유저가 구매한 책 목록
	@RequestMapping(value = "/userPurchase.do", method = RequestMethod.GET)
	public String userPurchase(String user_id, @ModelAttribute("userPurchase")UserPurchase userPurchase, PurPaging purPaging, Model model) throws Exception {
			System.out.println(user_id);
			userPurchase.setUser_id(user_id);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setPurPaging(userPurchase);
			pageMaker.setTotalCountP(bookService.countSearchedPurchase(userPurchase));
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("pvo", bookService.userPurchase(userPurchase));
		return "/book/userPurchase";
	}
	
	//책 이름 중복확인
	@ResponseBody
	@RequestMapping(value="bookChk.do", method=RequestMethod.GET)
	public int bookChk(@RequestParam("book_name") String book_name) throws Exception {
		int cnt = bookService.bookChk(book_name);
		return cnt;
	}
	
}