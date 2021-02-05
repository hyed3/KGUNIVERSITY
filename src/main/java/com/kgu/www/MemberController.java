package com.kgu.www;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kgu.www.service.MemberService;
import com.kgu.www.vo.MemberVO;

@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	private com.kgu.www.service.UserMailSendService mailSender;
	
	//로그인페이지로이동
	@RequestMapping("login.do")
	public String login() {
		return "member/login";
	}
	
	//로그인체크 후 결과에 따라 페이지이동 및 메세지전송
	  @RequestMapping("loginChk.do")
	   public ModelAndView loginChk(MemberVO vo, HttpSession session) {
	      boolean result = memberService.loginChk(vo, session);
	      ModelAndView mav = new ModelAndView();
	      if(result==true) {   //로그인체크성공(아이디와 비밀번호일치)
	         if(memberService.verifyChk(vo.getUserId())) {   //인증완료된 계정
	            String userId = vo.getUserId();
	            vo = memberService.viewMember(userId);
	            String nickname = vo.getNickname();
	            System.out.println("nickname");
	            session.setAttribute("userId", userId);
	            session.setAttribute("nickname", nickname);
	            mav.setViewName("redirect:mypage.do?userId="+vo.getUserId());
	            mav.addObject("msg", "success");
	         }else {   //인증 미완료인 계정
	            mav.setViewName("member/login");
	            mav.addObject("msg", "verify failure");
	         }
	         
	      }else {   //로그인실패
	         mav.setViewName("member/login");
	         mav.addObject("msg","failure");
	      }
	      return mav;   
	   }  
	
	//로그아웃
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session) {
		System.out.println("로그아웃들어옴");
		memberService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		mav.addObject("msg","logout");
		return mav;
	}
	
	//회원가입 페이지로 이동
	@RequestMapping("join.do")
	public String join() {
		return "member/join";
	}
	
	//회원가입(db INSERT)
	@RequestMapping(value="insertUser.do", method=RequestMethod.POST )
	public String insertUser(@ModelAttribute MemberVO vo, HttpServletRequest request) {
		memberService.insertUser(vo);
		mailSender.mailSend(vo.getUserId(),vo.getEmail(),request);
		return "member/login";
	}
	
	//AJAX사용-아이디중복체크
	@ResponseBody
	@RequestMapping(value="idChk.do", method=RequestMethod.GET)
	public int idChk(@RequestParam("userId") String userId) {
		System.out.println("아이디중복체크들어옴");
		int cnt = memberService.idChk(userId);
		return cnt;
	}
	
	//AJAX사용-현재비밀번호와 입력비밀번호가 일치하는지 확인
	@ResponseBody
	@RequestMapping(value="pwChk.do", method=RequestMethod.POST)
	public boolean pwChk(@RequestParam("userId") String userId, @RequestParam("inputPw") String inputPw) {
		boolean result = false;
		System.out.println("비밀번호확인들어옴");
		String userPw = memberService.pwChk(userId);
		if(userPw.equals(inputPw)) result=true;
		System.out.println(result);
		return result;
	}
	
	//AJAX사용-이메일중복체크
	@ResponseBody
	@RequestMapping(value="emailChk.do", method=RequestMethod.GET)
	public int emailChk(@RequestParam("email") String email) {
		System.out.println("이메일중복체크들어옴");
		int cnt = memberService.emailChk(email);
		return cnt;
	}
	
	//AJAX사용-닉네임중복체크
	@ResponseBody
	@RequestMapping(value="nickChk.do", method=RequestMethod.GET)
	public int nickChk(@RequestParam("nickname") String nickname) {
		System.out.println("닉네임중복체크들어옴");
		int cnt = memberService.nickChk(nickname);
		return cnt;
	}
	
	//회원정보수정 페이지로 이동
	@RequestMapping("update.do")
	public String update(String userId, Model model) {
		model.addAttribute("vo",memberService.viewMember(userId));
		return "member/updateUser";
	}
	
	//회원정보수정(db UPDATE)
	@RequestMapping("updateUser.do")
	public String updateUser(@ModelAttribute MemberVO vo) {
		memberService.updateUser(vo);
		return "redirect:mypage.do?userId="+vo.getUserId();
	}
	
	//마이페이지 페이지로 이동
	@RequestMapping("mypage.do")
	public String mypage(String userId, Model model) {
		model.addAttribute("vo",memberService.viewMember(userId));
		return "member/mypage";
	}
	
	//비밀번호수정 페이지로 이동
	@RequestMapping("pw.do")
	public String pw() {
		return "member/updatePw";
	}
	
	//비밀번호수정(db UPDATE)
	@RequestMapping(value="updatePw.do", method =RequestMethod.POST)
	public String updatePw(@ModelAttribute MemberVO vo) {
		memberService.updatePw(vo.getUserId(), vo.getUserPw());
		return "redirect:mypage.do?userId="+vo.getUserId();
	}
	
	//회원탈퇴 페이지로 이동
	@RequestMapping("delete.do")
	public String delete() {
		return "member/delete";
	}
	
	//회원탈퇴(db DELETE)
	@RequestMapping(value= "deleteUser.do", method =RequestMethod.POST)
	public String deleteUser(HttpSession session, String userId) {
		memberService.deleteUser(userId);
		memberService.logout(session);
		return "member/login";
	}
	
	//이메일인증 선공
	@RequestMapping("verify.do")
	public String verify(String userId) {
		System.out.println("verify.do 들어옴");
		mailSender.verification(userId);
		return "member/verify";
	}
	
	//아이디찾기 페이지이동
	@RequestMapping("find1.do")
	public String find1() {
		return "member/findId";
	}
	
	//비밀번호찾기 페이지이동
	@RequestMapping("find2.do")
	public String find2() {
		return "member/findPw";
	}
	
	//아이디찾기
	@ResponseBody
	@RequestMapping("findId.do")
	public String findId(@RequestParam("email") String email) {
		String result = memberService.findId(email);
		return result;
	}
		
	//비밀번호찾기
	@ResponseBody
	@RequestMapping("findPw.do")
	public int findPw(@RequestParam("userId") String userId, @RequestParam("email") String email) {
		int result;
		String findId = memberService.findId(email);
		if(findId == null) {	//입력한 이메일주소로 회원정보를 찾지못했을때
			result = -1;
		}else {
			if(findId.equals(userId)) {	//이메일,아이디 입력 모두 성공일때
				String newPw = memberService.makePw();	//임시비밀번호생성
				memberService.updatePw(userId, newPw);	//비밀번호변경
				mailSender.pwMailSend(userId, email, newPw); //임시비밀번호 전송
				System.out.println("임시 비밀번호 전송");
				result = 1;
			}else {	//입력한 이메일로 가입한 회원정보는 있으나, 아이디가 틀렸을 때
				result = 0;
			}
		}
		return result;	
	}
}
