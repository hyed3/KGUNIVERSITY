package com.kgu.www;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kgu.www.Book.service.BookService;
import com.kgu.www.service.BoardService;
import com.kgu.www.service.MemberService;
import com.kgu.www.service.SangpumService;

///**
// * Handles requests for the application home page.
// */
@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	BookService bookService;
	
	@Autowired
	SangpumService sangpumService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws Exception {
		model.addAttribute("book", bookService.bookAll());
		model.addAttribute("free", boardService.freeHome());
		model.addAttribute("notice", boardService.noticeHome());
		model.addAttribute("info", boardService.infoHome());
		model.addAttribute("club", boardService.clubHome());
		model.addAttribute("sangpum", sangpumService.SangpumAll());
		return "main";
	}
	
}
