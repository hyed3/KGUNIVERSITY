package com.kgu.www.vo;

public class BoardCommentVO {
	private int contentNum;
	private int commentSeq;
	private String userID;
	private String userNickname;
	private String boardComment;
	private String regDate;
	private String commentPW;
	
	public BoardCommentVO() {}
	public BoardCommentVO(int contentNum, String userID, String userNickname, String boardComment, String regDate, String commentPW) {
		this.contentNum = contentNum;
		this.userID = userID;
		this.userNickname = userNickname;
		this.boardComment = boardComment;
		this.regDate = regDate;
		this.commentPW = commentPW;
	}
	public BoardCommentVO(int commentSeq, String boardComment, String commentPW) {
		this.commentSeq = commentSeq;
		this.boardComment = boardComment;
		this.commentPW = commentPW;
	}
	
	
	public int getContentNum() {
		return contentNum;
	}
	public void setContentNum(int contentNum) {
		this.contentNum = contentNum;
	}
	
	//댓글번호
	//자유게시판 댓글번호 getter/setter
	public int getFBC_seq() {
		return commentSeq;
	}
	public void setFBC_seq(int commentSeq) {
		this.commentSeq = commentSeq;
	}
	//공지사항 댓글번호 getter/setter
	public int getNTC_seq() {
		return commentSeq;
	}
	public void setNTC_seq(int commentSeq) {
		this.commentSeq = commentSeq;
	}
	//질문게시판 댓글번호 getter/setter
	public int getIBC_seq() {
		return commentSeq;
	}
	public void setIBC_seq(int commentSeq) {
		this.commentSeq = commentSeq;
	}
	//동아리게시판 댓글번호 getter/setter
	public int getCBC_seq() {
		return commentSeq;
	}
	public void setCBC_seq(int commentSeq) {
		this.commentSeq = commentSeq;
	}
	//댓글번호-end
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getBoardComment() {
		return boardComment;
	}
	public void setBoardComment(String boardComment) {
		this.boardComment = boardComment;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getCommentPW() {
		return commentPW;
	}
	public void setCommentPW(String commentPW) {
		this.commentPW = commentPW;
	}
}
