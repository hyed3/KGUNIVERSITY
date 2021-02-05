package com.kgu.www.service;

import javax.servlet.http.HttpSession;

import com.kgu.www.vo.MemberVO;

public interface MemberService {
	public boolean loginChk(MemberVO vo, HttpSession session);
	
	public MemberVO viewMember(String userId);
	
	public void logout(HttpSession session);

	public void insertUser(MemberVO vo);

	public void updateUser(MemberVO vo);
	
	public void deleteUser(String userId);

	public void updatePw(String userId, String newPw);

	public int idChk(String userId);
	
	public int emailChk(String email);

	public int nickChk(String nickname);

	public String pwChk(String userId);

	public boolean verifyChk(String userId);

	public String findId(String email);
	
	public String makePw();

	
}
