package com.itwillbs.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.LikeDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MypageDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ReplyDTO;
import com.itwillbs.domain.SearchDTO;
import com.itwillbs.domain.ViewDTO;
import com.itwillbs.service.BoardService;
import com.itwillbs.service.LikeService;
import com.itwillbs.service.LikeServiceImpl;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MypageService;
import com.itwillbs.service.ReplyService;

@Controller
public class BoardController {

	//객체생성 부모인터페이스 = 자식클래스
	@Inject
	private BoardService boardService;
	@Inject
	private ReplyService replyService;
	@Inject
	private LikeService likeService;

	@Inject
	private MypageService mypageService;

	//업로드 경로 servlet-context.mxl upload폴더 경로 이름
	@Resource(name = "uploadPath")
	private String uploadPath;



	//	가상주소 시작점 http://localhost:8080/myweb2/board/write

	//	가상주소 시작점 http://localhost:8080/myweb2/board/list
    //	가상주소 시작점 http://localhost:8080/myweb2/board/list?pageNum=2
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, Model model,  @ModelAttribute BoardDTO boardDTO, HttpSession session) {
		// 한화면에 보여줄 글개수
		int pageSize=10;
		//현페이지 번호
		String pageNum=boardDTO.getPageNum();
		if(pageNum==null) {
			pageNum="1";
		}
		//현페이지 번호를 정수형으로 변경
		int currentPage=Integer.parseInt(pageNum);

		boardDTO.setPageSize(pageSize);
		boardDTO.setPageNum(pageNum);
		boardDTO.setCurrentPage(currentPage);
		List<BoardDTO> boardList=boardService.getBoardList(boardDTO);
		// pageBlock  startPage endPage count pageCount
		int count = boardService.getBoardCount(boardDTO);
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count / pageSize +(count % pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}

		boardDTO.setCount(count);
		boardDTO.setPageBlock(pageBlock);
		boardDTO.setStartPage(startPage);
		boardDTO.setEndPage(endPage);
		boardDTO.setPageCount(pageCount);
		model.addAttribute("boardList", boardList);
		model.addAttribute("boardDTO", boardDTO);
		System.out.println("세션"+session.hashCode());
		// 주소변경없이 이동
		// WEB-INF/views/board/list.jsp 이동
		return "/board/list";
	}

	@RequestMapping(value = "/board/fwrite", method = RequestMethod.GET)
	public String finsert() {
		// 주소변경없이 이동
		// WEB-INF/views/board/fwriteForm.jsp 이동
		return "/board/fwriteForm";
	}
	//가상주소 시작점 http://localhost:8080/myweb2/board/fwritePro
	@RequestMapping(value = "/board/fwritePro", method = RequestMethod.POST)
	public String fwritePro(HttpServletRequest request,HttpSession session, MultipartFile file) throws Exception {

		//파일 이름  => 랜덤문자_파일이름
		UUID uuid=UUID.randomUUID();
		String filename=uuid.toString()+"_"+file.getOriginalFilename();

		//업로드파일 file.getBytes() => upload/랜덤문자_파일이름 복사
		File uploadFile=new File(uploadPath,filename);

		FileCopyUtils.copy(file.getBytes(), uploadFile);

		String notice = request.getParameter("boardNotice");

		BoardDTO boardDTO=new BoardDTO();
		boardDTO.setUserNicknm(request.getParameter("userNicknm"));
		boardDTO.setBoardPass(request.getParameter("boardPass"));
		boardDTO.setBoardSubject(request.getParameter("boardSubject"));
		boardDTO.setBoardContent(request.getParameter("boardContent"));
		boardDTO.setBoardFile(filename);

		MypageDTO mypageDTO =new MypageDTO();
		mypageDTO.setUserId((String)session.getAttribute("userId"));


		boardService.insertBoard(boardDTO);



		mypageService.boardCount(mypageDTO);


		// 주소변경하면서 이동 /board/list 이동
		return "redirect:/board/list";
	}
//	가상주소 시작점 http://localhost:8080/myweb2/board/content?num=2
	@RequestMapping(value = "/board/content", method = RequestMethod.GET)
	public String content(HttpServletRequest request, HttpSession session, Model model) {
		//파라미터 가져오기
		int boardNum=Integer.parseInt(request.getParameter("boardNum"));
		// 디비에서 조회
		BoardDTO boardDTO=boardService.getBoard(boardNum);

		// model에 데이터 저장
		model.addAttribute("boardDTO", boardDTO);

		//댓글란
		int pageSize=10;
		//현페이지 번호
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		//현페이지 번호를 정수형으로 변경
		int currentPage=Integer.parseInt(pageNum);
		// PageDTO 객체생성
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setBoardNum(boardNum);
		List<ReplyDTO> replyList=replyService.getReplyList(pageDTO);

		//pageBlock  startPage endPage count pageCount
//		int count=replyService.getReplyCount();
//		int pageBlock=10;
//		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
//		int endPage=startPage+pageBlock-1;
//		int pageCount=count / pageSize +(count % pageSize==0?0:1);
//		if(endPage > pageCount){
//			endPage = pageCount;
//		}
//
//		pageDTO.setCount(count);
//		pageDTO.setPageBlock(pageBlock);
//		pageDTO.setStartPage(startPage);
//		pageDTO.setEndPage(endPage);
//		pageDTO.setPageCount(pageCount);

		ViewDTO viewDTO=new ViewDTO();
		viewDTO.setBoardNum(boardNum);
		viewDTO.setUserId((String)session.getAttribute("userId"));

		ViewDTO viewDTO2=boardService.viewcheck(viewDTO);

		if(viewDTO2 == null) {
			boardService.viewinsert(viewDTO);
			boardService.viewup(boardNum);
		}




		model.addAttribute("replyList", replyList);
		model.addAttribute("pageDTO", pageDTO);
		// 주소변경없이 이동
		// WEB-INF/views/board/content.jsp 이동
		return "/board/content";
	}



	//	가상주소 시작점 http://localhost:8080/myweb2/board/update?num=2
	@RequestMapping(value = "/board/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request, Model model) {
		//파라미터 가져오기
		int boardNum=Integer.parseInt(request.getParameter("boardNum"));
		// 디비에서 조회
		BoardDTO boardDTO=boardService.getBoard(boardNum);

		// model에 데이터 저장
		model.addAttribute("boardDTO", boardDTO);

		// 주소변경없이 이동
		// WEB-INF/views/board/updateForm.jsp 이동
		return "/board/updateForm";

	}

	//가상주소 시작점 http://localhost:8080/myweb2/board/updatePro
	@RequestMapping(value = "/board/updatePro", method = RequestMethod.POST)
	public String updatePro(HttpServletRequest request,MultipartFile file) throws Exception {
		String filename = "";
		if(file.isEmpty()) {
			filename=request.getParameter("oldfile");
		}else {
			UUID uuid=UUID.randomUUID();
			filename=uuid.toString()+"_"+file.getOriginalFilename();

			//업로드파일 file.getBytes() => upload/랜덤문자_파일이름 복사
			File uploadFile=new File(uploadPath,filename);

			FileCopyUtils.copy(file.getBytes(), uploadFile);
		}

				BoardDTO boardDTO=new BoardDTO();
				boardDTO.setBoardNum(Integer.parseInt(request.getParameter("boardNum")));
				boardDTO.setUserNicknm(request.getParameter("userNicknm"));
				boardDTO.setBoardPass(request.getParameter("boardPass"));
				boardDTO.setBoardSubject(request.getParameter("boardSubject"));
				boardDTO.setBoardContent(request.getParameter("boardContent"));
				boardDTO.setBoardFile(filename);

				MemberDTO memberDTO=new MemberDTO();
				memberDTO.setUserId(request.getParameter("userId"));
				memberDTO.setUserPass(request.getParameter("userPass"));


				//num pass 일치 확인
				BoardDTO boardPass=boardService.PassCheck(boardDTO);
				BoardDTO boardDTO2=boardService.numCheck(boardDTO);
		if(boardDTO2 != null) {
			if(boardPass != null) {
				boardService.updateBoard(boardDTO);
				boardService.updateFile(boardDTO);
			}else {
				//num pass 틀림
				// "틀림" 뒤로이동
				// 주소변경없이 이동
				// WEB-INF/views/board/msg.jsp 이동
				return "board/msg";
			}
			// 주소변경하면서 이동 /board/list 이동
			return "redirect:/board/list";
		}else {

			return "board/msg3";
		}
	}
	@RequestMapping(value = "/board/delete", method = RequestMethod.GET)
	public String delete(HttpServletRequest request, Model model) {
		//파라미터 가져오기
		int boardNum=Integer.parseInt(request.getParameter("boardNum"));

		// model에 데이터 저장
		model.addAttribute("boardNum", boardNum);

		// 주소변경없이 이동
		// WEB-INF/views/board/deleteForm.jsp 이동
		return "/board/deleteForm";
	}


	//가상주소 시작점 http://localhost:8080/myweb2/board/deletePro
	@RequestMapping(value = "/board/deletePro", method = RequestMethod.POST)
	public String deletePro(HttpServletRequest request, HttpSession session) {
		//num pass 일치 확인
		BoardDTO boardDTO=new BoardDTO();
		boardDTO.setBoardNum(Integer.parseInt(request.getParameter("boardNum")));
		boardDTO.setUserNicknm(request.getParameter("userNicknm"));
		boardDTO.setBoardPass(request.getParameter("boardPass"));
		MemberDTO memberDTO=new MemberDTO();
		memberDTO.setUserId(request.getParameter("userId"));
		memberDTO.setUserPass(request.getParameter("userPass"));
		//num pass 일치 확인
		BoardDTO boardDTO2=boardService.numCheck(boardDTO);
		MypageDTO mypageDTO =new MypageDTO();
		mypageDTO.setUserId((String)session.getAttribute("userId"));

		if(boardDTO2 != null) {

				mypageService.boardsub(mypageDTO);
				boardService.deleteBoard(boardDTO);

			return "redirect:/board/list";
		}else {

			return "board/msg3";
		}


	}

	@RequestMapping(value = "/board/shopAjax", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> listAjax(HttpServletRequest req, HttpServletResponse res, @ModelAttribute BoardDTO boardDTO) {
		Map<String, Object> map = new HashMap<>();
		String category = req.getParameter("category");
		String srhText = req.getParameter("srhText");
		String pageNum = req.getParameter("pageNum");

		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage=Integer.parseInt(pageNum);

		boardDTO.setCurrentPage(currentPage);
		boardDTO.setPageSize(9);
		// ---------------- 페이징 처리(Ajax) 시작
		int pageSize = 9;
		int count = boardService.getBoardCount(boardDTO);
		int pageBlock = 3;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count / pageSize +(count % pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}

		boardDTO.setCurrentPage(currentPage);
		boardDTO.setPageSize(9);
		boardDTO.setCount(count);
		boardDTO.setPageBlock(pageBlock);
		boardDTO.setStartPage(startPage);
		boardDTO.setEndPage(endPage);
		boardDTO.setPageCount(pageCount);

		boardDTO.setCategory(category);
		boardDTO.setSrhText(srhText);

		// ---------------- 페이징 처리(Ajax) 끝

		List<BoardDTO> boardList = boardService.getBoardList(boardDTO);

		map.put("boardList", boardList);
		map.put("boardDTO", boardDTO);

		return map;
	}






//	@RequestMapping(value = "/board/viewPro", method = RequestMethod.GET)
//	public String viewPro(HttpServletRequest request) {
//		//num pass 일치 확인
//		int boardNum=Integer.parseInt(request.getParameter("boardNum"));
//
//		ViewDTO viewDTO=new ViewDTO();
//		viewDTO.setBoardNum(Integer.parseInt(request.getParameter("boardNum")));
//		viewDTO.setUserId(request.getParameter("userId"));
//
//		ViewDTO viewDTO2=boardService.viewcheck(viewDTO);
//
//		if(viewDTO2 == null) {
//			boardService.viewinsert(viewDTO);
//			boardService.viewup(boardNum);
//		}
//
//
//		return "redirect:/board/content";
//
//
//	}
//



}