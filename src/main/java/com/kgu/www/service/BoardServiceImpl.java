package com.kgu.www.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kgu.www.service.dao.BoardDAO;
import com.kgu.www.vo.BoardCommentVO;
import com.kgu.www.vo.BoardPagingVO;
import com.kgu.www.vo.ClubBoardVO;
import com.kgu.www.vo.FreeBoardVO;
import com.kgu.www.vo.InfoBoardVO;
import com.kgu.www.vo.NoticeVO;

@Service("BoardService")
@Transactional
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO kguBoardDAO;
	
	//***** 자유게시판 *****
	@Override
	public ArrayList<FreeBoardVO> FreeboardALL(BoardPagingVO pagingVO) {
		return kguBoardDAO.FreeboardALL(pagingVO);
	}
	
	@Override
	public FreeBoardVO getFreeboardContent(int contentNum) {
		return kguBoardDAO.getFreeboardContent(contentNum);
	}

	@Override
	public void updateFreeboardHit(int contentNum) {
		kguBoardDAO.updateFreeboardHit(contentNum);
		
	}
	
	@Override
	public void insertFreeboardContent(FreeBoardVO freeBoardVO) {
		kguBoardDAO.insertFreeboardContent(freeBoardVO);
	}

	@Override
	public void updateFreeboardContent(FreeBoardVO freeBoardVO) {
		kguBoardDAO.updateFreeboardContent(freeBoardVO);
	}
	
	@Override
	public void deleteFreeboardContent(int contentNum) {
		kguBoardDAO.deleteFreeboardContent(contentNum);
	}
	
	@Override
	public ArrayList<BoardCommentVO> getFreeboardComment(int contentNum) {
		return kguBoardDAO.getFreeboardComment(contentNum);
	}
	
	@Override
	public void insertFreeboardComment(BoardCommentVO boardCommentVO) {
		kguBoardDAO.insertFreeboardComment(boardCommentVO);
	}
	
	@Override
	public void updateFreeboardComment(BoardCommentVO boardCommentVO) {
		kguBoardDAO.updateFreeboardComment(boardCommentVO);
	}
	
	@Override
	public void deleteFreeboardOneComment(int commentNum) {
		kguBoardDAO.deleteFreeboardOneComment(commentNum);
	}
	
	@Override
	public void deleteFreeboardComment(int contentNum) {
		kguBoardDAO.deleteFreeboardComment(contentNum);
	}
	
	@Override
	public void plusFreeboardcommentCnt(int contentNum) {
		kguBoardDAO.plusFreeboardcommentCnt(contentNum);
	}
	
	@Override
	public void minusFreeboardCommentCnt(int contentNum) {
		kguBoardDAO.minusFreeboardCommentCnt(contentNum);
	}
	//***** 자유게시판-end *****
	
	
	//***** 공지사항 *****
	@Override
	public ArrayList<NoticeVO> noticeAll(BoardPagingVO pagingVO) {
		return kguBoardDAO.noticeAll(pagingVO);
	}
	
	@Override
	public NoticeVO getNoticeContent(int contentNum) {
		return kguBoardDAO.getNoticeContent(contentNum);
	}
	
	@Override
	public void updateNoticeHit(int contentNum) {
		kguBoardDAO.updateNoticeHit(contentNum);
	}
	
	@Override
	public void insertNoticeContent(NoticeVO noticeVO) {
		kguBoardDAO.insertNoticeContent(noticeVO);
	}
	
	@Override
	public void updateNoticeContent(NoticeVO noticeVO) {
		kguBoardDAO.updateNoticeContent(noticeVO);
	}
	
	@Override
	public void deleteNoticeContent(int contentNum) {
		kguBoardDAO.deleteNoticeContent(contentNum);
	}
	
	@Override
	public ArrayList<BoardCommentVO> getNoticeComment(int contentNum) {
		return kguBoardDAO.getNoticeComment(contentNum);
	}
	
	@Override
	public void insertNoticeComment(BoardCommentVO boardCommentVO) {
		kguBoardDAO.insertNoticeComment(boardCommentVO);
	}
	
	@Override
	public void updateNoticeComment(BoardCommentVO boardCommentVO) {
		kguBoardDAO.updateNoticeComment(boardCommentVO);
	}
	
	@Override
	public void deleteNoticeOneComment(int commentNum) {
		kguBoardDAO.deleteNoticeOneComment(commentNum);
	}
	
	@Override
	public void deleteNoticeComment(int contentNum) {
		kguBoardDAO.deleteNoticeComment(contentNum);
	}
	
	@Override
	public void plusNoticeCommentCnt(int contentNum) {
		kguBoardDAO.plusNoticeCommentCnt(contentNum);
	}
	
	@Override
	public void minusNoticeCommentCnt(int contentNum) {
		kguBoardDAO.minusNoticeCommentCnt(contentNum);
	}
	//***** 공지사항-end *****
	
	
	//***** 정보게시판-end *****
	
	@Override
	public ArrayList<InfoBoardVO> infoBoardAll(BoardPagingVO pagingVO) {
		return kguBoardDAO.infoBoardAll(pagingVO);
	}

	@Override
	public InfoBoardVO getInfoboardContent(int contentNum) {
		return kguBoardDAO.getInfoboardContent(contentNum);
	}

	@Override
	public void updateInfoboardHit(int contentNum) {
		kguBoardDAO.updateInfoboardHit(contentNum);
	}
	
	@Override
	public void insertInfoboardContent(InfoBoardVO infoBoardVO) {
		kguBoardDAO.insertInfoboardContent(infoBoardVO);
	}
	
	@Override
	public void updateInfoboardContent(InfoBoardVO infoBoardVO) {
		kguBoardDAO.updateInfoboardContent(infoBoardVO);
	}
	
	@Override
	public void deleteInfoboardContent(int contentNum) {
		kguBoardDAO.deleteInfoboardContent(contentNum);
	}
	
	@Override
	public ArrayList<BoardCommentVO> getInfoboardComment(int contentNum) {
		return kguBoardDAO.getInfoboardComment(contentNum);
	}
	
	@Override
	public void insertInfoboardComment(BoardCommentVO boardCommentVO) {
		kguBoardDAO.insertInfoboardComment(boardCommentVO);
	}
	@Override
	public void updateinfoboardComment(BoardCommentVO boardCommentVO) {
		kguBoardDAO.updateinfoboardComment(boardCommentVO);
	}
	
	@Override
	public void deleteInfoboardOneComment(int commentNum) {
		kguBoardDAO.deleteInfoboardOneComment(commentNum);
	}	
	
	@Override
	public void deleteInfoboardComment(int contentNum) {
		kguBoardDAO.deleteInfoboardComment(contentNum);
	}

	@Override
	public void plusInfoboardcommentCnt(int contentNum) {
		kguBoardDAO.plusInfoboardcommentCnt(contentNum);
	}

	@Override
	public void minusInfoboardCommentCnt(int contentNum) {
		kguBoardDAO.minusInfoboardCommentCnt(contentNum);
	}
	
	//***** 정보게시판-end *****
	
	
	//***** 동아리게시판 *****
	
	@Override
	public ArrayList<ClubBoardVO> clubboardAll(BoardPagingVO pagingVO) {
		return kguBoardDAO.clubboardAll(pagingVO);
	}

	@Override
	public ClubBoardVO getClubboardContent(int contentNum) {
		return kguBoardDAO.getClubboardContent(contentNum);
	}
	
	@Override
	public void updateClubboardHit(int contentNum) {
		kguBoardDAO.updateClubboardHit(contentNum);
	}	
	
	@Override
	public void insertClubboardContent(ClubBoardVO clubBoardVO) {
		kguBoardDAO.insertClubboardContent(clubBoardVO);
	}
	
	@Override
	public void updateClubboardContent(ClubBoardVO clubBoardVO) {
		kguBoardDAO.updateClubboardContent(clubBoardVO);
	}
	
	@Override
	public void deleteClubboardContent(int contentNum) {
		kguBoardDAO.deleteClubboardContent(contentNum);
	}
	
	@Override
	public ArrayList<BoardCommentVO> getClubboardComment(int contentNum) {
		return kguBoardDAO.getClubboardComment(contentNum);
	}
	
	@Override
	public void insertClubboardComment(BoardCommentVO boardCommentVO) {
		kguBoardDAO.insertClubboardComment(boardCommentVO);
	}
	
	@Override
	public void updateClubboardComment(BoardCommentVO boardCommentVO) {
		kguBoardDAO.updateClubboardComment(boardCommentVO);
	}
	
	@Override
	public void deleteClubboardOneComment(int commentNum) {
		kguBoardDAO.deleteClubboardOneComment(commentNum);
	}
	
	@Override
	public void deleteClubboardComment(int contentNum) {
		kguBoardDAO.deleteClubboardComment(contentNum);
	}

	@Override
	public void plusClubboardcommentCnt(int contentNum) {
		kguBoardDAO.plusClubboardcommentCnt(contentNum);
	}

	@Override
	public void minusClubboardCommentCnt(int contentNum) {
		kguBoardDAO.minusClubboardCommentCnt(contentNum);
	}
	
	//***** 동아리게시판-end *****
	
	
	//***** 홈페이지 *****

	@Override
	public ArrayList<FreeBoardVO> freeHome() {
		return kguBoardDAO.freeHome();
	}
	
	@Override
	public ArrayList<NoticeVO> noticeHome() {
		return kguBoardDAO.noticeHome();
	}
	
	@Override
	public ArrayList<InfoBoardVO> infoHome() {
		return kguBoardDAO.infoHome();
	}
	
	@Override
	public ArrayList<ClubBoardVO> clubHome() {
		return kguBoardDAO.clubHome();
	}
	
	//***** 홈페이지-end *****
	
}
