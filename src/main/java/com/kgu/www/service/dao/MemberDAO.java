package com.kgu.www.service.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kgu.www.vo.MemberVO;

@Repository
public class MemberDAO {
	@Inject
	SqlSession sqlSession;
	
	//로그인체크(입력한 id,pw를 가진 회원있는지 조회)
		public boolean loginChk(MemberVO vo) {
			System.out.println("DAO들어옴");
			System.out.println(vo);
			String name  = sqlSession.selectOne("member.loginChk", vo);
			System.out.println(name);
			return (name==null)? false : true ;
		}

		//해당ID의 회원정보 불러오기
		public MemberVO viewMember(String userId) {
			return sqlSession.selectOne("member.viewMember", userId);
		}

		/*public void logout(HttpSession session) {}*/
		
		//회원가입(db INSERT)
		public void insertUser(MemberVO vo) {
			sqlSession.insert("member.insertMember", vo);
		}
		
		//회원정보수정(db UPDATE)
		public void updateUser(MemberVO vo) {
			sqlSession.update("member.updateMember", vo);
		}
		
		//회원탈퇴(db DELETE)
		public void deleteUser(String userId) {
			sqlSession.delete("member.deleteMember", userId);
		}

		//비밀번호 수정(db UPDATE)
		public void updatePw(String userId, String newPw) {
			MemberVO vo = new MemberVO();
			vo.setUserId(userId);
			vo.setUserPw(newPw);
			sqlSession.update("member.updatePw",vo);
		}

		//아이디중복체크
		public int idChk(String userId) {
			return sqlSession.selectOne("member.idChk", userId);
		}

		//이메일중복체크
		public int emailChk(String email) {
			return sqlSession.selectOne("member.emailChk", email);
		}
		
		//닉네임중복체크
		public int nickChk(String nickname) {
			return sqlSession.selectOne("member.nickChk", nickname);
		}

		//userId의 비밀번호 return
		public String pwChk(String userId) {
			return sqlSession.selectOne("member.pwChk", userId);
		}

		//이메일 인증
		public void verification(String userId) {
			sqlSession.update("member.verification",userId);
		}

		//로그인체크후 계정의 인증여부 체크
		public boolean verifyChk(String userId) {
			int result = sqlSession.selectOne("member.verifyChk", userId);
			if(result==1) return true;
			else return false;
		}

		public String findId(String email) {
			return sqlSession.selectOne("member.findId",email);
		}

		
}