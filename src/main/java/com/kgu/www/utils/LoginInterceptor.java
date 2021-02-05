package com.kgu.www.utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// session 객체를 가져옴
		HttpSession session = request.getSession();
		// login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
		Object obj = session.getAttribute("userId");
		System.out.println("인터셉터 들어옴");
		if (obj == null) {	// 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('로그인 후 사용할 수 있습니다.'); history.go(-1);</script>");
			out.flush();
			/*response.sendRedirect("/www/member/login.do");*/
			return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
		}
		return true;
	}
	
	
}
