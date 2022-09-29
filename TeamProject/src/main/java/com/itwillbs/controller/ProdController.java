package com.itwillbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.domain.ProdDTO;
import com.itwillbs.service.ProdService;

@Controller
public class ProdController {

	//객체생성 부모인터페이스 = 자식클래스
	@Inject
	private ProdService prodService;

	// 상품페이지
	@RequestMapping(value = "/product/shop", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest req, HttpServletResponse res, HttpSession session, @ModelAttribute ProdDTO prodDTO) throws Exception {
		try {
			ModelAndView mv = new ModelAndView();
			// ---------------- 페이징 처리 시작
			int pageSize = 9;
			String pageNum = prodDTO.getPageNum();
			if(pageNum == null) {
				pageNum = "1";
			}
			int currentPage=Integer.parseInt(pageNum);

			prodDTO.setCurrentPage(currentPage);
			String userId = (String)session.getAttribute("userId");
			prodDTO.setCurrentPage(currentPage);
			prodDTO.setPageSize(9);

			List<ProdDTO> prodList = prodService.selectProdList(prodDTO);
			int count = prodService.selectProdListCnt(prodDTO);
			int pageBlock = 3;
			int startPage = (currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count / pageSize +(count % pageSize==0?0:1);
			if(endPage > pageCount){
				endPage = pageCount;
			}

			prodDTO.setCount(count);
			prodDTO.setPageBlock(pageBlock);
			prodDTO.setStartPage(startPage);
			prodDTO.setEndPage(endPage);
			prodDTO.setPageCount(pageCount);
			// ---------------- 페이징 처리 끝

			// 데이터 담기
			mv.addObject("prodList", prodList);
			mv.addObject("prodDTO", prodDTO);
			mv.setViewName("product/shop");

			return mv;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	// 상품페이지 Ajax
	@RequestMapping(value = "/product/shopAjax", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> listAjax(HttpServletRequest req, HttpServletResponse res, @ModelAttribute ProdDTO prodDTO) {
		Map<String, Object> map = new HashMap<>();
		String category = req.getParameter("category");
		String srhText = req.getParameter("srhText");
		String pageNum = req.getParameter("pageNum");
		String gridColumn = req.getParameter("gridColumn");

		prodDTO.setPageNum(pageNum);
		prodDTO.setCategory(category);
		prodDTO.setSrhText(srhText);
		prodDTO.setGridColumn(gridColumn);




		// ---------------- 페이징 처리(Ajax) 시작
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage=Integer.parseInt(pageNum);

		prodDTO.setCurrentPage(currentPage);
		prodDTO.setPageSize(9);

		int pageSize = 9;

		List<ProdDTO> prodReply = prodService.getProdNumName(prodDTO);
		List<ProdDTO> prodList = prodService.selectProdList(prodDTO);

		int count = prodService.selectProdListCnt(prodDTO);
		int pageBlock = 3;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count / pageSize +(count % pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}

		prodDTO.setCurrentPage(currentPage);
		prodDTO.setPageSize(pageSize);
		prodDTO.setCount(count);
		prodDTO.setPageBlock(pageBlock);
		prodDTO.setStartPage(startPage);
		prodDTO.setEndPage(endPage);
		prodDTO.setPageCount(pageCount);


		// ---------------- 페이징 처리(Ajax) 끝

		map.put("prodReply", prodReply);
		map.put("prodList", prodList);
		map.put("prodDTO", prodDTO);

		return map;
	}

	// 상세화면
	@RequestMapping(value = "/product/details", method = RequestMethod.GET)
	public ModelAndView details(HttpServletRequest req, HttpServletResponse res,HttpSession session, @ModelAttribute ProdDTO prodDTO) throws Exception {
		try {
			ModelAndView mv = new ModelAndView();
			
			String userId = (String)session.getAttribute("userId");
			prodDTO.setUserId(userId);
			ProdDTO details = prodService.selectProdDetail(prodDTO);
			

			// ---------------- 페이징 처리 시작
			int pageSize = 3;
			String pageNum = prodDTO.getPageNum();
			if(pageNum == null) {
				pageNum = "1";
			}
			int currentPage=Integer.parseInt(pageNum);

			prodDTO.setCurrentPage(currentPage);
			prodDTO.setPageSize(pageSize);

			List<ProdDTO> prodReply = prodService.getProdNumName(prodDTO);
			int count = prodService.selectReplyListCnt(prodDTO);
			int pageBlock = 3;
			int startPage = (currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount=count / pageSize +(count % pageSize==0?0:1);
			if(endPage > pageCount){
				endPage = pageCount;
			}
			prodDTO.setCount(count);
			prodDTO.setPageBlock(pageBlock);
			prodDTO.setStartPage(startPage);
			prodDTO.setEndPage(endPage);
			prodDTO.setPageCount(pageCount);
			// ---------------- 페이징 처리 끝

			if(prodReply.size() > 0) {
				prodDTO.setAvgRating(prodReply.get(0).getAvgRating());
				prodDTO.setCountRating(prodReply.get(0).getCountRating());
				details.setRating(prodReply.get(0).getAvgRating());
			}else {
				prodDTO.setAvgRating(0);
				prodDTO.setCountRating(0);
				details.setRating(0);
			}

			// 추천꺼 LIST
			List<ProdDTO> prodRelatedList= prodService.selectProdRelatedList(details);

			mv.addObject("details", details);
			mv.addObject("prodReply", prodReply);
			mv.addObject("prodRelatedList", prodRelatedList);
			mv.addObject("prodDTO", prodDTO);
			mv.setViewName("product/details");

			return mv;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	// 리뷰 Ajax
	@RequestMapping(value = "/product/detailsAjax", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> detailsAjax(HttpServletRequest req, HttpServletResponse res, @ModelAttribute ProdDTO prodDTO) {
		Map<String, Object> map = new HashMap<>();
		String pageNum = req.getParameter("pageNum");

		// ---------------- 페이징 처리(Ajax) 시작
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage=Integer.parseInt(pageNum);
		int prodLNum = Integer.parseInt(req.getParameter("prodLNum"));

		prodDTO.setCurrentPage(currentPage);
		prodDTO.setPageSize(3);
		prodDTO.setProdLNum(prodLNum);

		int pageSize = 3;
		int count = prodService.selectReplyListCnt(prodDTO);
		int pageBlock = 3;
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count / pageSize +(count % pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}

		prodDTO.setCurrentPage(currentPage);
		prodDTO.setPageSize(pageSize);
		prodDTO.setCount(count);
		prodDTO.setPageBlock(pageBlock);
		prodDTO.setStartPage(startPage);
		prodDTO.setEndPage(endPage);
		prodDTO.setPageCount(pageCount);
		// ---------------- 페이징 처리(Ajax) 끝

		// 삭제 ?
		List<ProdDTO> prodList = prodService.selectReplyList(prodDTO);
		map.put("prodList", prodList);
		// 삭제 ?

		map.put("prodDTO", prodDTO);

		return map;
	}


	/* 리뷰 로그인 체크 -> 리뷰 등록 팝업창 띄어주기 */
	@RequestMapping(value = "/product/replyEnroll", method = RequestMethod.GET)
	public ModelAndView replyEnrollWindow(HttpServletRequest req, HttpServletResponse res,HttpSession session, @ModelAttribute ProdDTO prodDTO) throws Exception {
		try {
			ModelAndView mv = new ModelAndView();
			String userId = (String)session.getAttribute("userId");

			if(!"".equals(userId) && userId !=null) {
				mv.addObject("prodDTO", prodDTO);
				mv.setViewName("product/replyEnroll");
			}else {
				mv.setViewName("product/msg");
			}

			return mv;

		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	/* 리뷰 여부 체크 (댓글 등록 전 회원이 이전에 등록한 댓글이 있는지 확인하는 기능) */
	@RequestMapping(value = "/product/check", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> replyCheck(HttpServletRequest req, HttpServletResponse res, ProdDTO prodDTO) {
		Map<String, Object> map = new HashMap<>();
		int check = prodService.checkReply(prodDTO);
		// 존재o : F  /  존재x : S
		if(check > 0) {
			map.put("code", "F"); // 리뷰 존재O
		}else {
			map.put("code", "S"); // 리뷰 존재x
		}
		map.put("prodDTO", prodDTO);
		return map;
	}

	/* 리뷰 등록 */
	@RequestMapping(value = "/product/enroll", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> enrollReply(HttpServletRequest req, HttpServletResponse res, ProdDTO prodDTO) {
		Map<String, Object> map = new HashMap<>();

		int check = prodService.checkReply(prodDTO);
		// 댓글 등록 전 회원이 이전에 등록한 댓글이 있는지 확인하는 기능
		if(check > 0) {
			map.put("check", "F"); // 이미 리뷰 쓴 경우
		}else {
			prodService.enrollReply(prodDTO); //insert
			List<ProdDTO> prodReply = prodService.getProdNumName(prodDTO);
			map.put("prodReply", prodReply);
			map.put("code", "S");
		}
		map.put("prodDTO", prodDTO);
		return map;
	}

	/* 리뷰 수정 */
	@RequestMapping(value = "/product/updateReply", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> updateReply(HttpServletRequest req, HttpServletResponse res, ProdDTO prodDTO) {
		Map<String, Object> map = new HashMap<>();

		int check = prodService.checkReply(prodDTO);
		// 댓글 등록 전 회원이 이전에 등록한 댓글이 있는지 확인하는 기능
		if(check > 0) {
			prodService.updateReply(prodDTO); //update
			map.put("check", "S"); // 이미 리뷰 쓴 경우
		}else {
			map.put("code", "F");
		}
		map.put("prodDTO", prodDTO);
		return map;
	}

	/* 리뷰 수정 팝업창(팝업창 뷰를 반환해주는 url 매핑 메서드) */
	@RequestMapping(value = "/product/replyUpdate", method = RequestMethod.GET)
	public ModelAndView replyUpdateWindow(HttpServletRequest req, HttpServletResponse res,HttpSession session, @ModelAttribute ProdDTO prodDTO) throws Exception {
		try {
			ModelAndView mv = new ModelAndView();
			String userId = (String)session.getAttribute("userId");

			if(!"".equals(userId) && userId !=null) {
				mv.addObject("prodDTO", prodDTO);
				mv.setViewName("product/replyUpdate");
			}else {
				mv.setViewName("product/msg");
			}
			return mv;

		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	/* 댓글 삭제 */
	@RequestMapping(value = "/product/deleteReply", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteReply(HttpServletRequest req, HttpServletResponse res, ProdDTO prodDTO) {
		Map<String, Object> map = new HashMap<>();
		int check = prodService.checkReply(prodDTO);
		// 댓글 등록 전 회원이 이전에 등록한 댓글이 있는지 확인하는 기능
		if(check > 0) {
			map.put("check", "F"); // 이미 리뷰 쓴 경우
			prodService.deleteReply(prodDTO); //delete
		}else {
			map.put("code", "S");
		}
		map.put("prodDTO", prodDTO);
		return map;
	}

	// 메인화면
	@RequestMapping(value = "/main/main", method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest req, HttpServletResponse res, HttpSession session, @ModelAttribute ProdDTO prodDTO) throws Exception {
		try {
			ModelAndView mv = new ModelAndView();
			String userId = (String)session.getAttribute("userId");
			prodDTO.setUserId(userId);
			List<ProdDTO> newProdList = prodService.selectProdNewList(prodDTO);
			List<ProdDTO> bsProdList = prodService.selectProdBsList(prodDTO);
			// 데이터 담기
			mv.addObject("newProdList", newProdList);
			mv.addObject("bsProdList", bsProdList);
			mv.addObject("prodDTO", prodDTO);
			mv.setViewName("main/main");

			return mv;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}


}
