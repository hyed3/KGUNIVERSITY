package com.kgu.www.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kgu.www.service.dao.MemberDAO;

@Service
public class UserMailSendService {
	@Autowired
	private JavaMailSender mailSender;
	/*@Autowired
	private SqlSessionTemplate sqlSession;*/
	@Autowired
	MemberDAO memberDAO;
	
	public void mailSend(String userId,String email, HttpServletRequest request) {
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 KG_University입니다.</h2><br><br>"
					+"<h3>"+userId+"님 회원가입을 완료하시려면 "+"<br><br><br>"
					+"<a href='http://localhost:8081"+request.getContextPath()+"/member/verify.do?userId="+userId+"'>인증하기</a>버튼을 눌러주세요</h3>";
		try {
			mail.setSubject("[KG_University] KG_University 인증메일","UTF-8");
			mail.setText(htmlStr, "UTF-8", "html");
			mail.addRecipient(RecipientType.TO,new InternetAddress(email));
			mailSender.send(mail);
			System.out.println("이메일 전송 성공");
		}catch(MessagingException e) {
			System.out.println("이메일 전송 에러");
			e.printStackTrace();
		}
	}
	
	//임시비밀번호발급 메일전송
	public void pwMailSend(String userId,String email,String newPw) {
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 KG_University입니다.</h2><br><br>"
					+"<h3>"+userId+"님 임시비밀번호는" + newPw +"입니다. "+"<br><br><br>"
					+ "<a href='http://localhost:8081/www/member/login.do'>로그인</a>";
		try {
			mail.setSubject("[KG_University] KG_University 임시비밀번호발급메일","UTF-8");
			mail.setText(htmlStr, "UTF-8", "html");
			mail.addRecipient(RecipientType.TO,new InternetAddress(email));
			mailSender.send(mail);
			System.out.println("이메일 전송 성공");
		}catch(MessagingException e) {
			System.out.println("이메일 전송 에러");
			e.printStackTrace();
		}
	}
	
	public void verification(String userId) {
		System.out.println("usermailService들어옴");
		memberDAO.verification(userId);
	}
	
}
