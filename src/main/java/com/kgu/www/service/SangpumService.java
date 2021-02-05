package com.kgu.www.service;

import java.util.ArrayList;

import com.kgu.www.vo.CommVO;
import com.kgu.www.vo.PagingVO;
import com.kgu.www.vo.SangpumVO;

public interface SangpumService {
	

	
	//게시물 목록
	 ArrayList<SangpumVO> SangpumAll();

	

	//게시물등록
	public void SangpumInsert(SangpumVO vo);
	
	//게시글 상세보기
	public SangpumVO SangpumDetail(int bno);
		
	//조회수 올리기
	public boolean plusCnt(int bno);
	
	//게시글 삭제
	public boolean SangpumDel(int bno);
	
	//게시글 개수
	public int count(PagingVO vo);
		
	//게시글 목록+페이징
	public ArrayList<SangpumVO> selectBoard(PagingVO vo);
	
	
	//댓글 등록
	public void insertComm(CommVO com);


	//댓글 조회
	public ArrayList<CommVO> CommAll(int bno);
	
	//댓글 삭제
		public boolean deleteComm(int cno);


		//해당 게시글 댓글 삭제
		public boolean deleteAllComm(int bno);
	

	
}
