package com.kgu.www.service.impl;

import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kgu.www.service.SangpumService;
import com.kgu.www.service.dao.SangpumDAO;
import com.kgu.www.vo.CommVO;
import com.kgu.www.vo.PagingVO;
import com.kgu.www.vo.SangpumVO;

@Service("SangpumService")
public class SangpumServiceImpl implements SangpumService {

	@Autowired
	private SangpumDAO sangpumDAO;
	
	
	@Override
	@Transactional
	public ArrayList<SangpumVO> SangpumAll() {
		// TODO Auto-generated method stub
		return sangpumDAO.SangpumAll();
	}



	@Override
	public void SangpumInsert(SangpumVO vo) {
		sangpumDAO.SangpumInsert(vo);
		
	}
	
	@Override
	public SangpumVO SangpumDetail(int bno) {
		return sangpumDAO.SangpumDetail(bno);
	}
	
	@Override
	public boolean plusCnt(int bno) {
		return sangpumDAO.plusCnt(bno);
	}
	
	@Override
	public boolean SangpumDel(int bno) {
		return sangpumDAO.SangpumDel(bno);
	}
	
	@Override
	public int count(PagingVO vo) {
		return sangpumDAO.count(vo);
	}



	@Override
	public ArrayList<SangpumVO> selectBoard(PagingVO vo) {
		// TODO Auto-generated method stub
		return sangpumDAO.selectBoard(vo);
	}




	
	@Override
	public void insertComm(CommVO com) {
		sangpumDAO.insertComm(com);
		
	}



	@Override
	public ArrayList<CommVO> CommAll(int bno) {
		// TODO Auto-generated method stub
		return sangpumDAO.CommAll(bno);
	}



	@Override
	public boolean deleteComm(int cno) {
		// TODO Auto-generated method stub
		return sangpumDAO.deleteComm(cno);
	}



	@Override
	public boolean deleteAllComm(int bno) {
		// TODO Auto-generated method stub
		return sangpumDAO.deleteAllComm(bno);
	}



	

}
