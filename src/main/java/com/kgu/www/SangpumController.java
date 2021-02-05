package com.kgu.www;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kgu.www.service.SangpumService;
import com.kgu.www.utils.UploadFileUtils;
import com.kgu.www.vo.CommVO;
import com.kgu.www.vo.PagingVO;
import com.kgu.www.vo.SangpumVO;

@Controller
public class SangpumController {

	@Resource(name="SangpumService")
	private SangpumService sangpumService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	//게시물 목록
	@RequestMapping(value="/slist")
	public String SangpumList(Model model) {
		ArrayList<SangpumVO> slist=sangpumService.SangpumAll();
		model.addAttribute("slist",slist);			
		return "sangpum/slist";
	}
	
	//글쓰기 페이지 부르기
	@RequestMapping(value="/callwrite")
	public String SangpumWrite() {
		return "sangpum/swrite";
	}
	

	
	//게시글 insert
	@RequestMapping(value="/SangpumInsert")
	public String SangpumInsert(SangpumVO vo,MultipartFile file) throws IOException, Exception {			
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
	
		if(file.getOriginalFilename() != null && file.getOriginalFilename()!="") {
			 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
			} else {
			 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
			}

			vo.setIMGNAME(File.separator +"www"+File.separator+ "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		sangpumService.SangpumInsert(vo);
		
		return "redirect:boardList";
	}
	
	//게시글 상세보기
	@RequestMapping(value="/detail")
	public String SangpumDetail(Model model,@RequestParam("bno")int bno,CommVO com,HttpServletRequest request) {
		model.addAttribute("Detail",sangpumService.SangpumDetail(bno));
		sangpumService.plusCnt(bno); //조회수 올리기
		return "sangpum/sview";
	}
	
	//댓글 목록
	@ResponseBody
	@RequestMapping(value="/commList")
	public List<CommVO> getCommList(Model model,@RequestParam("bno")int bno){
		ArrayList<CommVO> clist=sangpumService.CommAll(bno);
		model.addAttribute("Detail",sangpumService.SangpumDetail(bno));
		return clist;
		
		
	}
	
	//댓글 등록
	@ResponseBody
	@RequestMapping(value="/commInsert")
	public void postCommInsert(int bno, String ctext, String cid,CommVO com){
		com.setBno(bno);
		com.setCid(cid);
		com.setCtext(ctext);
		sangpumService.insertComm(com);	
	}
	
	
	//댓글삭제
	@ResponseBody
	@RequestMapping(value="/commDelete")
	public void commdelete(int cno) {
		System.out.println("삭제버튼");
		sangpumService.deleteComm(cno);
		
		
	}
	
	
	
	//게시글 삭제
	@RequestMapping(value="/delete")
	public String delete(@RequestParam("bno") int bno) {
		sangpumService.deleteAllComm(bno);
		sangpumService.SangpumDel(bno);
		return "redirect:boardList";
		
	}

	//게시물 목록 + 페이징 추가
	@RequestMapping(value="/boardList")
	public String ListPage(PagingVO vo,Model model,@RequestParam(value="nowPage",required=false)String nowPage,
							@RequestParam(value="cntPerPage",required=false)String cntPerPage,
							HttpServletRequest request) {
		
		String Keyword = request.getParameter("Keyword");
		String searchType= request.getParameter("searchType");
		


		//게시물 총 개수
		int total = sangpumService.count(vo);
		
		if(nowPage==null&&cntPerPage == null) {
			nowPage = "1";
			cntPerPage="10";
			} else if (nowPage == null) {
				nowPage="1";
			}else if(cntPerPage == null) {
				cntPerPage="10";
			}
		
		vo = new PagingVO(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage),Keyword,searchType);
		model.addAttribute("paging",vo);
		model.addAttribute("slist",sangpumService.selectBoard(vo));
		
//		return "slist2";
		return "sangpum/slist2";
		}
	
}
