package com.kgu.www.service;

import java.util.ArrayList;

import com.kgu.www.vo.BoardCommentVO;
import com.kgu.www.vo.BoardPagingVO;
import com.kgu.www.vo.ClubBoardVO;
import com.kgu.www.vo.FreeBoardVO;
import com.kgu.www.vo.InfoBoardVO;
import com.kgu.www.vo.NoticeVO;

public interface BoardService {
	
	//자유게시판
	ArrayList<FreeBoardVO> FreeboardALL(BoardPagingVO pagingVO);	//전체글목록
	FreeBoardVO getFreeboardContent(int contentNum);				//글정보
	void updateFreeboardHit(int contentNum);						//글조회수증가
	void insertFreeboardContent(FreeBoardVO freeBoardVO);			//글등록
	void updateFreeboardContent(FreeBoardVO freeBoardVO);			//글수정
	void deleteFreeboardContent(int contentNum);					//글삭제
	ArrayList<BoardCommentVO> getFreeboardComment(int contentNum);	//댓글목록
	void insertFreeboardComment(BoardCommentVO boardCommentVO);		//댓글등록
	void updateFreeboardComment(BoardCommentVO boardCommentVO);		//댓글수정
	void deleteFreeboardOneComment(int commentNum);					//댓글삭제
	void deleteFreeboardComment(int contentNum);					//특정글 댓글 전체삭제
	void plusFreeboardcommentCnt(int contentNum);					//댓글수증가
	void minusFreeboardCommentCnt(int contentNum);					//댓글수감소
	//자유게시판-end
	
	//공지사항
	ArrayList<NoticeVO> noticeAll(BoardPagingVO pagingVO);			//전체글목록
	NoticeVO getNoticeContent(int contentNum);						//글정보
	void updateNoticeHit(int contentNum);							//글조회수증가
	void insertNoticeContent(NoticeVO noticeVO);					//글등록
	void updateNoticeContent(NoticeVO noticeVO);					//글수정
	void deleteNoticeContent(int contentNum);						//글삭제
	ArrayList<BoardCommentVO> getNoticeComment(int contentNum);		//댓글목록
	void insertNoticeComment(BoardCommentVO boardCommentVO);		//댓글등록
	void updateNoticeComment(BoardCommentVO boardCommentVO);		//댓글수정
	void deleteNoticeOneComment(int commentNum);					//댓글삭제
	void deleteNoticeComment(int contentNum);						//특정글 댓글 전체삭제
	void plusNoticeCommentCnt(int contentNum);						//댓글수증가
	void minusNoticeCommentCnt(int contentNum);						//댓글수감소
	//공지사항-end
	
	//정보게시판
	ArrayList<InfoBoardVO> infoBoardAll(BoardPagingVO pagingVO);	//전체글목록
	InfoBoardVO getInfoboardContent(int contentNum);				//글정보
	void updateInfoboardHit(int contentNum);						//글조회수증가
	void insertInfoboardContent(InfoBoardVO infoBoardVO);			//글등록
	void updateInfoboardContent(InfoBoardVO infoBoardVO);			//글수정
	void deleteInfoboardContent(int contentNum);					//글삭제
	ArrayList<BoardCommentVO> getInfoboardComment(int contentNum);	//댓글목록
	void insertInfoboardComment(BoardCommentVO boardCommentVO);		//댓글등록
	void updateinfoboardComment(BoardCommentVO boardCommentVO);		//댓글수정
	void deleteInfoboardOneComment(int commentNum);					//댓글삭제
	void deleteInfoboardComment(int contentNum);					//특정글 댓글 전체삭제
	void plusInfoboardcommentCnt(int contentNum);					//댓글수증가
	void minusInfoboardCommentCnt(int contentNum);					//댓글수감소
	//정보게시판-end
	
	//동아리게시판
	ArrayList<ClubBoardVO> clubboardAll(BoardPagingVO pagingVO);	//전체글목록
	ClubBoardVO getClubboardContent(int contentNum);				//글정보
	void updateClubboardHit(int contentNum);						//글조회수증가
	void insertClubboardContent(ClubBoardVO clubBoardVO);			//글등록
	void updateClubboardContent(ClubBoardVO clubBoardVO);			//글수정
	void deleteClubboardContent(int contentNum);					//글삭제
	ArrayList<BoardCommentVO> getClubboardComment(int contentNum);	//댓글목록
	void insertClubboardComment(BoardCommentVO boardCommentVO);		//댓글등록
	void updateClubboardComment(BoardCommentVO boardCommentVO);		//댓글수정
	void deleteClubboardOneComment(int commentNum);					//댓글삭제
	void deleteClubboardComment(int contentNum);					//특정글 댓글 전체삭제
	void plusClubboardcommentCnt(int contentNum);					//댓글수증가
	void minusClubboardCommentCnt(int contentNum);					//댓글수감소
	//동아리게시판-end
	
	//홈페이지
	ArrayList<FreeBoardVO> freeHome();								//자유게시판
	ArrayList<NoticeVO> noticeHome();								//공지사항
	ArrayList<InfoBoardVO> infoHome();								//정보게시판
	ArrayList<ClubBoardVO> clubHome();								//동아리
	//홈페이지 - end
}
