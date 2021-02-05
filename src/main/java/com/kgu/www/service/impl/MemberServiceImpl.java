package com.kgu.www.service.impl;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kgu.www.service.MemberService;
import com.kgu.www.service.dao.MemberDAO;
import com.kgu.www.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memberDAO;
	
	//로그인체크(아이디와 비밀번호가 일치하는지)
	@Override
	public boolean loginChk(MemberVO vo, HttpSession session) {
		return memberDAO.loginChk(vo);
	}
	
	//로그인체크 성공후 해당계정이 인증이 되었는지 확인
	public boolean verifyChk(String userId) {
		return memberDAO.verifyChk(userId);
	}

	//해당ID의 회원정보 불러오기
	@Override
	public MemberVO viewMember(String userId) {
		return memberDAO.viewMember(userId);
	}

	//로그아웃
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	//회원가입(db INSERT)
	@Override
	public void insertUser(MemberVO vo) {
		memberDAO.insertUser(vo);
		
	}

	//회원정보수정(db UPDATE)
	@Override
	public void updateUser(MemberVO vo) {
		memberDAO.updateUser(vo);
	}

	//회원탈퇴(db DELETE)
	@Override
	public void deleteUser(String userId) {
		memberDAO.deleteUser(userId);
		
	}

	//비밀번호 수정(db UPDATE)
	@Override
	public void updatePw(String userId, String newPw) {
		memberDAO.updatePw(userId, newPw);
		
	}

	//아이디중복체크
	@Override
	public int idChk(String userId) {
		return memberDAO.idChk(userId);
	}

	//이메일중복체크
	@Override
	public int emailChk(String email) {
		return memberDAO.emailChk(email);
	}
	
	//닉네임중복체크
	@Override
	public int nickChk(String nickname) {
		return memberDAO.nickChk(nickname);
	}

	//userId의 비밀번호 return
	@Override
	public String pwChk(String userId) {
		return memberDAO.pwChk(userId);
	}

	@Override
	public String findId(String email) {
		return memberDAO.findId(email);
	}

	@Override
	public String makePw() {
		Random rand = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 8; i++) {
			int index = rand.nextInt(3);
			switch(index) {
				case 0:
					sb.append((char)(rand.nextInt(26)+97));
					break;
				case 1:
					sb.append((char)(rand.nextInt(26)+65));
					break;
				case 2:
					sb.append(rand.nextInt(10));
					break;
				}
		}	
		return sb.toString();
	}


	
}
