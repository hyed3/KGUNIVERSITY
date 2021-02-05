package com.kgu.www;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.kgu.www.service.BoardService;
import com.kgu.www.vo.BoardCommentVO;
import com.kgu.www.vo.BoardPagingVO;
import com.kgu.www.vo.ClubBoardVO;
import com.kgu.www.vo.FreeBoardVO;
import com.kgu.www.vo.InfoBoardVO;
import com.kgu.www.vo.NoticeVO;

@Controller
public class BoardController {
	
	@Resource(name = "BoardService")
	private BoardService boardService;
	
	private BoardPagingVO boardPagingVO = new BoardPagingVO(10, 5);
	private BoardPagingVO boardCommentPagingVO = new BoardPagingVO(10, 5);
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd hh:mm:ss");	
//	private String uploadPath = "C:\\Users\\skyra\\Desktop\\K\\스터디\\ITBANK\\자바 웹개발\\[[프로젝트4 - KG University]]\\Project4_workspace\\KG_University_ori\\src\\main\\webapp\\resources\\boardImg";
	private String uploadPath = "E:\\ITbank\\WEB_DEVELOPER\\PROJECT\\final\\workplace\\KGUniversity\\src\\main\\webapp\\resources\\boardImg";
	
	
	///////////////////////////
	
	//******* 자유게시판 *******
	//전체글목록
	@RequestMapping(value = "/FreeBoard_List.do")
	public String freeBoard_List(Model model, HttpServletRequest request) {
		System.out.println("FreeBoard_List.do");
		int pageNum = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		
		boardPagingVO.setSearchType(searchType);
		
		if(searchKeyword == null || searchKeyword.equals(""))
			boardPagingVO.setSearchKeyword("");
		else
			boardPagingVO.setSearchKeyword(searchKeyword.toLowerCase());
		
		ArrayList<FreeBoardVO> fbList = boardService.FreeboardALL(boardPagingVO);
		boardPagingVO.setTotalCnt(fbList.size());
		boardPagingVO.setPageNum(pageNum);
		
		model.addAttribute("fbList", fbList);
		model.addAttribute("boardPagingVO", boardPagingVO);
		
		return "board/FreeBoard_List";
	}
	
	//글 상세내용
	@RequestMapping(value = "/FreeBoard_Content.do")
	public String freeBoard_Content(Model model, HttpServletRequest request) {
		System.out.println("FreeBoard_Content.do");
		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		
		FreeBoardVO fbContent = boardService.getFreeboardContent(contentNum);
		ArrayList<BoardCommentVO> fbComment = boardService.getFreeboardComment(contentNum);
		
		int cPageNum;
		if(request.getParameter("cPage") == null) {
			cPageNum = 1;
			boardService.updateFreeboardHit(contentNum);
		} else {
			cPageNum = Integer.parseInt(request.getParameter("cPage"));
		}
		
		boardCommentPagingVO.setTotalCnt(fbComment.size());
		boardCommentPagingVO.setPageNum(cPageNum);
		model.addAttribute("fbContent", fbContent);
		model.addAttribute("fbComment", fbComment);
		model.addAttribute("boardCommentPagingVO", boardCommentPagingVO);
		
		return "board/FreeBoard_Content";
	}
	
	//글등록 페이지 이동
	@RequestMapping(value = "/FreeBoard_Write.do")
	public String freeBoard_Write() {
		System.out.println("FreeBoard_Write.do");
		return "board/FreeBoard_Write";
	}
	
	//글등록
	@RequestMapping(value = "/FreeBoard_Upload.do", method=RequestMethod.POST)
	public String freeBoard_Upload(MultipartFile file, HttpServletRequest request) throws IOException {
		System.out.println("FreeBoard_Upload.do");
		Date date = new Date();

		//세션확인, 닉네임도필요
		String sessionUserID = request.getParameter("sessionUserID");
		String sessionUserNickname = request.getParameter("sessionNickname");
		String contentType = request.getParameter("contentType");	//글 말머리
		String contentTitle = request.getParameter("contentTitle");	//글제목
		String content = request.getParameter("content");			//글내용
		String userID = "";
		String userNickname = "익명";
		if(sessionUserID != null && !sessionUserID.equals(""))
			userID = sessionUserID;
		if(sessionUserNickname != null && !sessionUserNickname.equals(""))
			userNickname = sessionUserNickname;
		String regDate = dateFormat.format(date);					//등록일
		String modifyDate = "";										//수정일
		String contentPW = request.getParameter("contentPW");		//글 비밀번호
		String imgName = file.getOriginalFilename();
		if(imgName != null && !imgName.equals(""))
			imgName = uploadFile(imgName, file.getBytes());
		else
			imgName = "";

		FreeBoardVO freeBoardVO = new FreeBoardVO(0, contentType, contentTitle, content, userID, userNickname, regDate, modifyDate, contentPW, imgName);
		boardService.insertFreeboardContent(freeBoardVO);

		return "redirect:/FreeBoard_List.do";
	}
	
	//글수정페이지 이동
	@RequestMapping(value = "/FreeBoard_UpdateForm.do")
	public String freeBoard_UpdateForm(Model model, HttpServletRequest request) {
		System.out.println("FreeBoard_UpdateForm.do");

		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		FreeBoardVO fbContent = boardService.getFreeboardContent(contentNum);

		model.addAttribute("fbContent", fbContent);

		return "board/FreeBoard_Update";
	}

	//글수정
	@RequestMapping(value = "/FreeBoard_Update.do", method=RequestMethod.POST)
	public String freeBoard_Update(MultipartFile file, HttpServletRequest request) throws IOException {
		System.out.println("FreeBoard_Update.do");
		Date date = new Date();
		
		int contentNum = Integer.parseInt(request.getParameter("cNum"));	//글번호
		String fNameOri = request.getParameter("fNameOri");					//기존파일이름
		String deleteCheck = request.getParameter("deleteCheck");
		String contentType = request.getParameter("contentType");			//글 말머리
		String contentTitle = request.getParameter("contentTitle");			//글제목
		String content = request.getParameter("content");					//글내용
		String userID = "";
		String userNickname = "";
		String regDate = "";												//등록일
		String modifyDate = dateFormat.format(date);						//수정일
		String contentPW = request.getParameter("contentPW");				//글 비밀번호
		String imgName = file.getOriginalFilename();
		
		if(imgName != null && !imgName.equals("")) {
			if(fNameOri != null & !fNameOri.equals("")) {
				String path = uploadPath+"\\"+fNameOri;
				File oriFile = new File(path);
				if(oriFile.exists()) {
					oriFile.delete();
				}
			}
			
			imgName = uploadFile(imgName, file.getBytes());
		} else {
			if(fNameOri != null & !fNameOri.equals("")) {
				if(deleteCheck == null || !deleteCheck.equals("1")) {
					String path = uploadPath+"\\"+fNameOri;
					File oriFile = new File(path);
					if(oriFile.exists()) {
						oriFile.delete();
					}
				} else {
					imgName = fNameOri;
				}
			}
		}
		
		FreeBoardVO freeBoardVO = new FreeBoardVO(contentNum, contentType, contentTitle, content, userID, userNickname, regDate, modifyDate, contentPW, imgName);
		boardService.updateFreeboardContent(freeBoardVO);

		return "redirect:/FreeBoard_Content.do?cNum="+contentNum;
	}

	//글삭제
	@RequestMapping(value = "/FreeBoard_Delete.do")
	public String freeBoard_Delete(HttpServletRequest request) {
		System.out.println("FreeBoard_Delete.do");
		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		String fileName = request.getParameter("fileName");
		System.out.println("파일이름 : " + fileName);
		
		if(fileName != null && !fileName.equals("")) {
			String path = uploadPath+"\\"+fileName;
			File file = new File(path);
			if(file.exists())
				file.delete();
		}
		
		boardService.deleteFreeboardComment(contentNum);
		boardService.deleteFreeboardContent(contentNum);
		
		return "redirect:/FreeBoard_List.do";
	}
	
	//댓글등록
	@RequestMapping(value = "/FreeBoard_Content_CommentUpload.do")
	public String freeBoard_Content_CommentUpload(HttpServletRequest request) {
		System.out.println("FreeBoard_Content_CommentUpload.do");
		Date date = new Date();

		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		int cPagenum = Integer.parseInt(request.getParameter("cPage"));
		//세션확인, 닉네임도필요
		String sessionUserID = request.getParameter("sessionUserID");
		String sessionUserNickname = request.getParameter("sessionNickname");
		String userID = "";
		String userNickname = "익명";
		if(sessionUserID != null && !sessionUserID.equals(""))
			userID = sessionUserID;
		if(sessionUserNickname != null && !sessionUserNickname.equals(""))
			userNickname = sessionUserNickname;
		String fbComm = request.getParameter("fbComment");
		String regDate = dateFormat.format(date);
		String fbCommPW = request.getParameter("fbCommentPW");

		BoardCommentVO boardCommentVO = new BoardCommentVO(contentNum, userID, userNickname, fbComm, regDate, fbCommPW);
		boardService.insertFreeboardComment(boardCommentVO);
		boardService.plusFreeboardcommentCnt(contentNum);

		return "redirect:/FreeBoard_Content.do?cNum="+contentNum+"&cPage="+cPagenum;
	}
	
	//댓글수정
	@RequestMapping(value = "/FreeBoard_Content_CommentUpdate.do")
	public String freeBoard_Contefnt_CommentUpdate(HttpServletRequest request) {
		System.out.println("FreeBoard_Content_CommentUpdate.do");

		int contentNum = Integer.parseInt(request.getParameter("contentNum"));
		int commentNum = Integer.parseInt(request.getParameter("commentNum"));
		String commentPW = request.getParameter("commentPW");
		String comment = request.getParameter("comment");

		BoardCommentVO boardCommentVO = new BoardCommentVO(commentNum, comment, commentPW);
		boardService.updateFreeboardComment(boardCommentVO);

		return "redirect:/FreeBoard_Content.do?cNum=" + contentNum;
	}

	//댓글삭제
	@RequestMapping(value = "/FreeBoard_Content_CommentDelete.do")
	public String freeBoard_Content_CommentDelete(HttpServletRequest request) {
		System.out.println("FreeBoard_Content_CommentDelete.do");

		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		int commentNum = Integer.parseInt(request.getParameter("commentNum"));
		if(commentNum > 0) {
			boardService.deleteFreeboardOneComment(commentNum);
			boardService.minusFreeboardCommentCnt(contentNum);
		}

		return "redirect:/FreeBoard_Content.do?cNum=" + contentNum;
	}
	//******* 자유게시판-end *******
	
	
	//******* 공지사항 *******
	//전체글목록
	@RequestMapping(value = "/Notice_List.do")
	public String notice_List(Model model, HttpServletRequest request) {
		System.out.println("Notice_List.do");
		
		
		int pageNum = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");

		boardPagingVO.setSearchType(searchType);

		if(searchKeyword == null || searchKeyword.equals(""))
			boardPagingVO.setSearchKeyword("");
		else
			boardPagingVO.setSearchKeyword(searchKeyword.toLowerCase());
		
		//
		ArrayList<NoticeVO> noticeList = boardService.noticeAll(boardPagingVO);
		boardPagingVO.setTotalCnt(noticeList.size());
		boardPagingVO.setPageNum(pageNum);
		
		//
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("boardPagingVO", boardPagingVO);

		return "board/Notice_List";
	}
	
	//글 상세내용
	@RequestMapping(value = "/Notice_Content.do")
	public String notice_Content(Model model, HttpServletRequest request) {
		System.out.println("Notice_Content.do");
		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		
		NoticeVO noticeContent = boardService.getNoticeContent(contentNum);
		ArrayList<BoardCommentVO> noticeComment = boardService.getNoticeComment(contentNum);

		int cPageNum;
		if(request.getParameter("cPage") == null) {
			cPageNum = 1;
			boardService.updateNoticeHit(contentNum);
		} else {
			cPageNum = Integer.parseInt(request.getParameter("cPage"));
		}

		boardCommentPagingVO.setTotalCnt(noticeComment.size());
		boardCommentPagingVO.setPageNum(cPageNum);
		model.addAttribute("noticeContent", noticeContent);
		model.addAttribute("noticeComment", noticeComment);
		model.addAttribute("boardCommentPagingVO", boardCommentPagingVO);

		return "board/Notice_Content";
	}
	
	//글등록 페이지 이동
	@RequestMapping(value = "/Notice_Write.do")
	public String notice_Write() {
		System.out.println("Notice_Write.do");
		return "board/Notice_Write";
	}
	
	//글등록
	@RequestMapping(value = "/Notice_Upload.do", method=RequestMethod.POST)
	public String notice_Upload(MultipartFile file, HttpServletRequest request) throws IOException {
		System.out.println("Notice_Upload.do");
		Date date = new Date();

		//세션확인, 닉네임도필요
		String sessionUserID = request.getParameter("sessionUserID");
		String sessionUserNickname = request.getParameter("sessionNickname");
		String contentType = request.getParameter("contentType");	//글 말머리
		String contentTitle = request.getParameter("contentTitle");	//글제목
		String content = request.getParameter("content");			//글내용
		String userID = "";
		String userNickname = "익명";
		if(sessionUserID != null && !sessionUserID.equals(""))
			userID = sessionUserID;
		if(sessionUserNickname != null && !sessionUserNickname.equals(""))
			userNickname = sessionUserNickname;
		String regDate = dateFormat.format(date);					//등록일
		String modifyDate = "";										//수정일
//		String contentPW = request.getParameter("contentPW");		//글 비밀번호
		String imgName = file.getOriginalFilename();
		if(imgName != null && !imgName.equals(""))
			imgName = uploadFile(imgName, file.getBytes());
		else
			imgName = "";
		
		NoticeVO noticeVO = new NoticeVO(0, contentType, contentTitle, content, userID, userNickname, regDate, modifyDate, "", imgName);
		boardService.insertNoticeContent(noticeVO);

		return "redirect:/Notice_List.do";
	}
	
	//글수정페이지 이동
	@RequestMapping(value = "/Notice_UpdateForm.do")
	public String notice_UpdateForm(Model model, HttpServletRequest request) {
		System.out.println("Notice_UpdateForm.do");

		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		NoticeVO noticeContent = boardService.getNoticeContent(contentNum);

		model.addAttribute("noticeContent", noticeContent);

		return "board/Notice_Update";
	}
	
	//글수정
	@RequestMapping(value = "/Notice_Update.do", method=RequestMethod.POST)
	public String notice_Update(MultipartFile file, HttpServletRequest request) throws IOException {
		System.out.println("Notice_Update.do");
		Date date = new Date();

		int contentNum = Integer.parseInt(request.getParameter("cNum"));	//글번호
		String fNameOri = request.getParameter("fNameOri");					//기존파일이름
		String deleteCheck = request.getParameter("deleteCheck");
		String contentType = request.getParameter("contentType");			//글 말머리
		String contentTitle = request.getParameter("contentTitle");			//글제목
		String content = request.getParameter("content");					//글내용
		String userID = "";
		String userNickname = "";
		String regDate = "";												//등록일
		String modifyDate = dateFormat.format(date);						//수정일
//		String contentPW = request.getParameter("contentPW");				//글 비밀번호
		String imgName = file.getOriginalFilename();

		if(imgName != null && !imgName.equals("")) {
			if(fNameOri != null & !fNameOri.equals("")) {
				String path = uploadPath+"\\"+fNameOri;
				File oriFile = new File(path);
				if(oriFile.exists()) {
					oriFile.delete();
				}
			}
			
			imgName = uploadFile(imgName, file.getBytes());
		} else {
			if(fNameOri != null & !fNameOri.equals("")) {
				if(deleteCheck == null || !deleteCheck.equals("1")) {
					String path = uploadPath+"\\"+fNameOri;
					File oriFile = new File(path);
					if(oriFile.exists()) {
						oriFile.delete();
					}
				} else {
					imgName = fNameOri;
				}
			}
		}
		
		NoticeVO noticeVO = new NoticeVO(contentNum, contentType, contentTitle, content, userID, userNickname, regDate, modifyDate, "", imgName);
		boardService.updateNoticeContent(noticeVO);
		
		return "redirect:/Notice_Content.do?cNum="+contentNum;
	}
	
	//글삭제
	@RequestMapping(value = "/Notice_Delete.do")
	public String notice_Delete(HttpServletRequest request) {
		System.out.println("Notice_Delete.do");
		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		String fileName = request.getParameter("fileName");
		System.out.println("파일이름 : " + fileName);

		if(fileName != null && !fileName.equals("")) {
			String path = uploadPath+"\\"+fileName;
			File file = new File(path);
			if(file.exists())
				file.delete();
		}

		boardService.deleteNoticeComment(contentNum);
		boardService.deleteNoticeContent(contentNum);

		return "redirect:/Notice_List.do";
	}
	
	//댓글등록
	@RequestMapping(value = "/Notice_Content_CommentUpload.do")
	public String notice_Content_CommentUpload(HttpServletRequest request) {
		System.out.println("Notice_Content_CommentUpload.do");
		Date date = new Date();

		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		int cPagenum = Integer.parseInt(request.getParameter("cPage"));
		//세션확인, 닉네임도필요
		String sessionUserID = request.getParameter("sessionUserID");
		String sessionUserNickname = request.getParameter("sessionNickname");
		String userID = "";
		String userNickname = "익명";
		if(sessionUserID != null && !sessionUserID.equals(""))
			userID = sessionUserID;
		if(sessionUserNickname != null && !sessionUserNickname.equals(""))
			userNickname = sessionUserNickname;
		String ntComm = request.getParameter("ntComment");
		String regDate = dateFormat.format(date);
//		String ntCommPW = request.getParameter("ntCommentPW");

		BoardCommentVO boardCommentVO = new BoardCommentVO(contentNum, userID, userNickname, ntComm, regDate, "");
		
		
		boardService.insertNoticeComment(boardCommentVO);
		boardService.plusNoticeCommentCnt(contentNum);

		return "redirect:/Notice_Content.do?cNum="+contentNum+"&cPage="+cPagenum;
	}
	
	//댓글수정
	@RequestMapping(value = "/Notice_Content_CommentUpdate.do")
	public String notice_Contefnt_CommentUpdate(HttpServletRequest request) {
		System.out.println("Notice_Content_CommentUpdate.do");

		int contentNum = Integer.parseInt(request.getParameter("contentNum"));
		int commentNum = Integer.parseInt(request.getParameter("commentNum"));
//		String commentPW = request.getParameter("commentPW");
		String comment = request.getParameter("comment");

		BoardCommentVO boardCommentVO = new BoardCommentVO(commentNum, comment, "");
		boardService.updateNoticeComment(boardCommentVO);

		return "redirect:/Notice_Content.do?cNum=" + contentNum;
	}
	
	//댓글삭제
	@RequestMapping(value = "/Notice_Content_CommentDelete.do")
	public String Notice_Content_CommentDelete(HttpServletRequest request) {
		System.out.println("Notice_Content_CommentDelete.do");

		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		int commentNum = Integer.parseInt(request.getParameter("commentNum"));
		if(commentNum > 0) {
			boardService.deleteNoticeOneComment(commentNum);
			boardService.minusNoticeCommentCnt(contentNum);
		}

		return "redirect:/Notice_Content.do?cNum=" + contentNum;
	}
	//******* 공지사항-end *******
	
	
	//******* 정보게시판 *******
	
	//전체글목록
	@RequestMapping(value = "/InfoBoard_List.do")
	public String infoBoard_List(Model model, HttpServletRequest request) {
		System.out.println("InfoBoard_List.do");
		int pageNum = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");

		boardPagingVO.setSearchType(searchType);

		if(searchKeyword == null || searchKeyword.equals(""))
			boardPagingVO.setSearchKeyword("");
		else
			boardPagingVO.setSearchKeyword(searchKeyword.toLowerCase());
		
		ArrayList<InfoBoardVO> ibList = boardService.infoBoardAll(boardPagingVO);
		boardPagingVO.setTotalCnt(ibList.size());
		boardPagingVO.setPageNum(pageNum);

		model.addAttribute("ibList", ibList);
		model.addAttribute("boardPagingVO", boardPagingVO);

		return "board/InfoBoard_List";
	}
	
	//글 상세내용
	@RequestMapping(value = "/InfoBoard_Content.do")
	public String infoBoard_Content(Model model, HttpServletRequest request) {
		System.out.println("InfoBoard_Content.do");
		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		
		InfoBoardVO ibContent = boardService.getInfoboardContent(contentNum);
		ArrayList<BoardCommentVO> ibComment = boardService.getInfoboardComment(contentNum);

		int cPageNum;
		if(request.getParameter("cPage") == null) {
			cPageNum = 1;
			boardService.updateInfoboardHit(contentNum);
		} else {
			cPageNum = Integer.parseInt(request.getParameter("cPage"));
		}

		boardCommentPagingVO.setTotalCnt(ibComment.size());
		boardCommentPagingVO.setPageNum(cPageNum);
		model.addAttribute("ibContent", ibContent);
		model.addAttribute("ibComment", ibComment);
		model.addAttribute("boardCommentPagingVO", boardCommentPagingVO);

		return "board/InfoBoard_Content";
	}
	
	//글등록 페이지 이동
	@RequestMapping(value = "/InfoBoard_Write.do")
	public String infoBoard_Write() {
		System.out.println("InfoBoard_Write.do");
		return "board/InfoBoard_Write";
	}
	
	//글등록
	@RequestMapping(value = "/InfoBoard_Upload.do", method=RequestMethod.POST)
	public String infoBoard_Upload(MultipartFile file, HttpServletRequest request) throws IOException {
		System.out.println("InfoBoard_Upload.do");
		Date date = new Date();

		//세션확인, 닉네임도필요
		String sessionUserID = request.getParameter("sessionUserID");
		String sessionUserNickname = request.getParameter("sessionNickname");
		String contentType = request.getParameter("contentType");	//글 말머리
		String contentTitle = request.getParameter("contentTitle");	//글제목
		String content = request.getParameter("content");			//글내용
		String userID = "";
		String userNickname = "익명";
		if(sessionUserID != null && !sessionUserID.equals(""))
			userID = sessionUserID;
		if(sessionUserNickname != null && !sessionUserNickname.equals(""))
			userNickname = sessionUserNickname;
		String regDate = dateFormat.format(date);					//등록일
		String modifyDate = "";										//수정일
		String contentPW = request.getParameter("contentPW");		//글 비밀번호
		String imgName = file.getOriginalFilename();
		if(imgName != null && !imgName.equals(""))
			imgName = uploadFile(imgName, file.getBytes());
		else
			imgName = "";
		
		InfoBoardVO infoBoardVO = new InfoBoardVO(0, contentType, contentTitle, content, userID, userNickname, regDate, modifyDate, contentPW, imgName);
		boardService.insertInfoboardContent(infoBoardVO);

		return "redirect:/InfoBoard_List.do";
	}
	
	//글수정페이지 이동
	@RequestMapping(value = "/InfoBoard_UpdateForm.do")
	public String infoBoard_UpdateForm(Model model, HttpServletRequest request) {
		System.out.println("InfoBoard_UpdateForm.do");

		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		
		InfoBoardVO ibContent = boardService.getInfoboardContent(contentNum);

		model.addAttribute("ibContent", ibContent);

		return "board/InfoBoard_Update";
	}
	
	//글수정
	@RequestMapping(value = "/InfoBoard_Update.do", method=RequestMethod.POST)
	public String infoBoard_Update(MultipartFile file, HttpServletRequest request) throws IOException {
		System.out.println("InfoBoard_Update.do");
		Date date = new Date();

		int contentNum = Integer.parseInt(request.getParameter("cNum"));	//글번호
		String fNameOri = request.getParameter("fNameOri");					//기존파일이름
		String deleteCheck = request.getParameter("deleteCheck");
		String contentType = request.getParameter("contentType");			//글 말머리
		String contentTitle = request.getParameter("contentTitle");			//글제목
		String content = request.getParameter("content");					//글내용
		String userID = "";
		String userNickname = "";
		String regDate = "";												//등록일
		String modifyDate = dateFormat.format(date);						//수정일
		String contentPW = request.getParameter("contentPW");				//글 비밀번호
		String imgName = file.getOriginalFilename();

		if(imgName != null && !imgName.equals("")) {
			if(fNameOri != null & !fNameOri.equals("")) {
				String path = uploadPath+"\\"+fNameOri;
				File oriFile = new File(path);
				if(oriFile.exists()) {
					oriFile.delete();
				}
			}
			
			imgName = uploadFile(imgName, file.getBytes());
		} else {
			if(fNameOri != null & !fNameOri.equals("")) {
				if(deleteCheck == null || !deleteCheck.equals("1")) {
					String path = uploadPath+"\\"+fNameOri;
					File oriFile = new File(path);
					if(oriFile.exists()) {
						oriFile.delete();
					}
				} else {
					imgName = fNameOri;
				}
			}
		}
		
		InfoBoardVO infoBoardVO = new InfoBoardVO(contentNum, contentType, contentTitle, content, userID, userNickname, regDate, modifyDate, contentPW, imgName);
		boardService.updateInfoboardContent(infoBoardVO);

		return "redirect:/InfoBoard_Content.do?cNum="+contentNum;
	}
	
	//글삭제
	@RequestMapping(value = "/InfoBoard_Delete.do")
	public String infoBoard_Delete(HttpServletRequest request) {
		System.out.println("InfoBoard_Delete.do");
		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		String fileName = request.getParameter("fileName");
		System.out.println("파일이름 : " + fileName);

		if(fileName != null && !fileName.equals("")) {
			String path = uploadPath+"\\"+fileName;
			File file = new File(path);
			if(file.exists())
				file.delete();
		}
		
		boardService.deleteInfoboardComment(contentNum);
		boardService.deleteInfoboardContent(contentNum);

		return "redirect:/InfoBoard_List.do";
	}
	
	//댓글등록
	@RequestMapping(value = "/InfoBoard_Content_CommentUpload.do")
	public String infoBoard_Content_CommentUpload(HttpServletRequest request) {
		System.out.println("InfoBoard_Content_CommentUpload.do");
		Date date = new Date();

		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		int cPagenum = Integer.parseInt(request.getParameter("cPage"));
		//세션확인, 닉네임도필요
		String sessionUserID = request.getParameter("sessionUserID");
		String sessionUserNickname = request.getParameter("sessionNickname");
		String userID = "";
		String userNickname = "익명";
		if(sessionUserID != null && !sessionUserID.equals(""))
			userID = sessionUserID;
		if(sessionUserNickname != null && !sessionUserNickname.equals(""))
			userNickname = sessionUserNickname;
		String fbComm = request.getParameter("ibComment");
		String regDate = dateFormat.format(date);
		String fbCommPW = request.getParameter("ibCommentPW");
		
		BoardCommentVO boardCommentVO = new BoardCommentVO(contentNum, userID, userNickname, fbComm, regDate, fbCommPW);
		
		boardService.insertInfoboardComment(boardCommentVO);
		boardService.plusInfoboardcommentCnt(contentNum);

		return "redirect:/InfoBoard_Content.do?cNum="+contentNum+"&cPage="+cPagenum;
	}
	
	//댓글수정
	@RequestMapping(value = "/InfoBoard_Content_CommentUpdate.do")
	public String infoBoard_Contefnt_CommentUpdate(HttpServletRequest request) {
		System.out.println("InfoBoard_Content_CommentUpdate.do");

		int contentNum = Integer.parseInt(request.getParameter("contentNum"));
		int commentNum = Integer.parseInt(request.getParameter("commentNum"));
		String commentPW = request.getParameter("commentPW");
		String comment = request.getParameter("comment");

		BoardCommentVO boardCommentVO = new BoardCommentVO(commentNum, comment, commentPW);
		boardService.updateinfoboardComment(boardCommentVO);

		return "redirect:/InfoBoard_Content.do?cNum=" + contentNum;
	}
	
	//댓글삭제
	@RequestMapping(value = "/InfoBoard_Content_CommentDelete.do")
	public String infoBoard_Content_CommentDelete(HttpServletRequest request) {
		System.out.println("InfoBoard_Content_CommentDelete.do");

		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		int commentNum = Integer.parseInt(request.getParameter("commentNum"));
		if(commentNum > 0) {
			boardService.deleteInfoboardOneComment(commentNum);
			boardService.minusInfoboardCommentCnt(contentNum);
		}

		return "redirect:/InfoBoard_Content.do?cNum=" + contentNum;
	}
	
	//******* 정보게시판-end *******
	
	
	//******* 동아리게시판 *******
	
	//전체글목록
	@RequestMapping(value = "/ClubBoard_List.do")
	public String clubBoard_List(Model model, HttpServletRequest request) {
		System.out.println("ClubBoard_List.do");
		int pageNum = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");

		boardPagingVO.setSearchType(searchType);

		if(searchKeyword == null || searchKeyword.equals(""))
			boardPagingVO.setSearchKeyword("");
		else
			boardPagingVO.setSearchKeyword(searchKeyword.toLowerCase());
		
		ArrayList<ClubBoardVO> cbList = boardService.clubboardAll(boardPagingVO);
		boardPagingVO.setTotalCnt(cbList.size());
		boardPagingVO.setPageNum(pageNum);

		model.addAttribute("cbList", cbList);
		model.addAttribute("boardPagingVO", boardPagingVO);

		return "board/ClubBoard_List";
	}
	
	//글 상세내용
	@RequestMapping(value = "/ClubBoard_Content.do")
	public String clubBoard_Content(Model model, HttpServletRequest request) {
		System.out.println("ClubBoard_Content.do");
		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		
		ClubBoardVO cbContent = boardService.getClubboardContent(contentNum);
		ArrayList<BoardCommentVO> cbComment = boardService.getClubboardComment(contentNum);

		int cPageNum;
		if(request.getParameter("cPage") == null) {
			cPageNum = 1;
			boardService.updateClubboardHit(contentNum);
		} else {
			cPageNum = Integer.parseInt(request.getParameter("cPage"));
		}

		boardCommentPagingVO.setTotalCnt(cbComment.size());
		boardCommentPagingVO.setPageNum(cPageNum);
		model.addAttribute("cbContent", cbContent);
		model.addAttribute("cbComment", cbComment);
		model.addAttribute("boardCommentPagingVO", boardCommentPagingVO);

		return "board/ClubBoard_Content";
	}
	
	//글등록 페이지 이동
	@RequestMapping(value = "/ClubBoard_Write.do")
	public String clubBoard_Write() {
		System.out.println("ClubBoard_Write.do");
		return "board/ClubBoard_Write";
	}
	
	//글등록
	@RequestMapping(value = "/ClubBoard_Upload.do", method=RequestMethod.POST)
	public String clubBoard_Upload(MultipartFile file, HttpServletRequest request) throws IOException {
		System.out.println("ClubBoard_Upload.do");
		Date date = new Date();

		//세션확인, 닉네임도필요
		String sessionUserID = request.getParameter("sessionUserID");
		String sessionUserNickname = request.getParameter("sessionNickname");
		String contentType = request.getParameter("contentType");	//글 말머리
		String contentTitle = request.getParameter("contentTitle");	//글제목
		String content = request.getParameter("content");			//글내용
		String userID = "";
		String userNickname = "익명";
		if(sessionUserID != null && !sessionUserID.equals(""))
			userID = sessionUserID;
		if(sessionUserNickname != null && !sessionUserNickname.equals(""))
			userNickname = sessionUserNickname;
		String regDate = dateFormat.format(date);					//등록일
		String modifyDate = "";										//수정일
		String contentPW = request.getParameter("contentPW");		//글 비밀번호
		String imgName = file.getOriginalFilename();
		if(imgName != null && !imgName.equals(""))
			imgName = uploadFile(imgName, file.getBytes());
		else
			imgName = "";

		ClubBoardVO clubBoardVO = new ClubBoardVO(0, contentType, contentTitle, content, userID, userNickname, regDate, modifyDate, contentPW, imgName);
		boardService.insertClubboardContent(clubBoardVO);
		
		return "redirect:/ClubBoard_List.do";
	}
	
	//글수정페이지 이동
	@RequestMapping(value = "/ClubBoard_UpdateForm.do")
	public String clubBoard_UpdateForm(Model model, HttpServletRequest request) {
		System.out.println("ClubBoard_UpdateForm.do");

		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		ClubBoardVO cbContent = boardService.getClubboardContent(contentNum);

		model.addAttribute("cbContent", cbContent);

		return "board/ClubBoard_Update";
	}
	
	//글수정
	@RequestMapping(value = "/ClubBoard_Update.do", method=RequestMethod.POST)
	public String clubBoard_Update(MultipartFile file, HttpServletRequest request) throws IOException {
		System.out.println("ClubBoard_Update.do");
		Date date = new Date();

		int contentNum = Integer.parseInt(request.getParameter("cNum"));	//글번호
		String fNameOri = request.getParameter("fNameOri");					//기존파일이름
		String deleteCheck = request.getParameter("deleteCheck");
		String contentType = request.getParameter("contentType");			//글 말머리
		String contentTitle = request.getParameter("contentTitle");			//글제목
		String content = request.getParameter("content");					//글내용
		String userID = "";
		String userNickname = "";
		String regDate = "";												//등록일
		String modifyDate = dateFormat.format(date);						//수정일
		String contentPW = request.getParameter("contentPW");				//글 비밀번호
		String imgName = file.getOriginalFilename();

		if(imgName != null && !imgName.equals("")) {
			if(fNameOri != null & !fNameOri.equals("")) {
				String path = uploadPath+"\\"+fNameOri;
				File oriFile = new File(path);
				if(oriFile.exists()) {
					oriFile.delete();
				}
			}
			
			imgName = uploadFile(imgName, file.getBytes());
		} else {
			if(fNameOri != null & !fNameOri.equals("")) {
				if(deleteCheck == null || !deleteCheck.equals("1")) {
					String path = uploadPath+"\\"+fNameOri;
					File oriFile = new File(path);
					if(oriFile.exists()) {
						oriFile.delete();
					}
				} else {
					imgName = fNameOri;
				}
			}
		}

		ClubBoardVO clubBoardVO = new ClubBoardVO(contentNum, contentType, contentTitle, content, userID, userNickname, regDate, modifyDate, contentPW, imgName);
		boardService.updateClubboardContent(clubBoardVO);

		return "redirect:/ClubBoard_Content.do?cNum="+contentNum;
	}
	
	//글삭제
	@RequestMapping(value = "/ClubBoard_Delete.do")
	public String clubBoard_Delete(HttpServletRequest request) {
		System.out.println("ClubBoard_Delete.do");
		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		String fileName = request.getParameter("fileName");
		System.out.println("파일이름 : " + fileName);

		if(fileName != null && !fileName.equals("")) {
			String path = uploadPath+"\\"+fileName;
			File file = new File(path);
			if(file.exists())
				file.delete();
		}

		boardService.deleteClubboardComment(contentNum);
		boardService.deleteClubboardContent(contentNum);

		return "redirect:/ClubBoard_List.do";
	}
	
	//댓글등록
	@RequestMapping(value = "/ClubBoard_Content_CommentUpload.do")
	public String clubBoard_Content_CommentUpload(HttpServletRequest request) {
		System.out.println("ClubBoard_Content_CommentUpload.do");
		Date date = new Date();

		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		int cPagenum = Integer.parseInt(request.getParameter("cPage"));
		//세션확인, 닉네임도필요
		String sessionUserID = request.getParameter("sessionUserID");
		String sessionUserNickname = request.getParameter("sessionNickname");
		String userID = "";
		String userNickname = "익명";
		if(sessionUserID != null && !sessionUserID.equals(""))
			userID = sessionUserID;
		if(sessionUserNickname != null && !sessionUserNickname.equals(""))
			userNickname = sessionUserNickname;
		String fbComm = request.getParameter("cbComment");
		String regDate = dateFormat.format(date);
		String fbCommPW = request.getParameter("cbCommentPW");

		BoardCommentVO boardCommentVO = new BoardCommentVO(contentNum, userID, userNickname, fbComm, regDate, fbCommPW);
		boardService.insertClubboardComment(boardCommentVO);
		boardService.plusClubboardcommentCnt(contentNum);

		return "redirect:/ClubBoard_Content.do?cNum="+contentNum+"&cPage="+cPagenum;
	}
	
	//댓글수정
	@RequestMapping(value = "/ClubBoard_Content_CommentUpdate.do")
	public String clubBoard_Contefnt_CommentUpdate(HttpServletRequest request) {
		System.out.println("ClubBoard_Content_CommentUpdate.do");

		int contentNum = Integer.parseInt(request.getParameter("contentNum"));
		int commentNum = Integer.parseInt(request.getParameter("commentNum"));
		String commentPW = request.getParameter("commentPW");
		String comment = request.getParameter("comment");

		BoardCommentVO boardCommentVO = new BoardCommentVO(commentNum, comment, commentPW);
		boardService.updateClubboardComment(boardCommentVO);

		return "redirect:/ClubBoard_Content.do?cNum=" + contentNum;
	}
	
	//댓글삭제
	@RequestMapping(value = "/ClubBoard_Content_CommentDelete.do")
	public String clubBoard_Content_CommentDelete(HttpServletRequest request) {
		System.out.println("ClubBoard_Content_CommentDelete.do");

		int contentNum = Integer.parseInt(request.getParameter("cNum"));
		int commentNum = Integer.parseInt(request.getParameter("commentNum"));
		if(commentNum > 0) {
			boardService.deleteClubboardOneComment(commentNum);
			boardService.minusFreeboardCommentCnt(contentNum);
		}

		return "redirect:/FreeBoard_Content.do?cNum=" + contentNum;
	}

	//******* 동아리게시판-end *******
	
	
	//업로드 파일명 생성
	private String uploadFile(String originalName, byte[] fileData) throws IOException {
		UUID uuid = UUID.randomUUID();
		String fileName = uuid.toString() + "_" + originalName;
		
		File target = new File(uploadPath, fileName);
		FileCopyUtils.copy(fileData, target);
		
		return fileName;
	}
}
