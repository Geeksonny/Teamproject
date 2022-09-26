package com.itwillbs.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.domain.CommonDTO;
import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.CouponDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.OrderListDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PointDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;
import com.itwillbs.service.CommonService;
import com.itwillbs.service.CompService;
import com.itwillbs.service.MemberService;

@Controller
public class AdminController {

	@Inject
	private MemberService memberService;
	@Inject
	private CompService compService;
	@Inject
	private CommonService commonService;

	// 관리자 페이지
	@RequestMapping(value = "/adminpage", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest req, HttpServletResponse res,
							@ModelAttribute MemberDTO memberDTO,
							@ModelAttribute CompDTO compDTO) throws Exception {
		try {
			ModelAndView mv = new ModelAndView();
			// 일반 회원 수
			CommonDTO commonDTO =  new CommonDTO();
			commonDTO.setTableNm("USER_INFO"); 	// 기준 컬럼
			int userCount = commonService.getCount(commonDTO);
			mv.addObject("userCount", userCount);
			mv.setViewName("admin/adminpage");
			// 업체 수
			commonDTO.setTableNm("COMPANY_INFO"); 	// 기준 컬럼
			int compCount = commonService.getCount(commonDTO);
			mv.addObject("compCount", compCount);
			// 총 회원 수
			int totalMember = userCount+compCount;
			mv.addObject("totalMember",totalMember);
			return mv;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	// 회원 리스트
	@RequestMapping(value = "/admin/user", method = RequestMethod.GET)
	public String userList(HttpServletRequest request, Model model, HttpSession session) {
		// 한 화면에 보여줄 글개수
		int pageSize=20;
		// 현페이지 번호
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// 현페이지 번호를 정수형으로 변경
		int currentPage=Integer.parseInt(pageNum);
		// PageDTO 객체생성
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);

		List<MemberDTO> userList=memberService.getUserList(pageDTO);

		// pageBlock  startPage endPage count pageCount
		int count=memberService.getUserCount();
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count / pageSize +(count % pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		model.addAttribute("userList", userList);
		model.addAttribute("pageDTO", pageDTO);

		return "admin/userList";
	}

	// 업체 리스트
	@RequestMapping(value = "/admin/comp", method = RequestMethod.GET)
	public String compList(HttpServletRequest request, Model model, HttpSession session) {
		// 한 화면에 보여줄 글개수
		int pageSize=20;
		// 현페이지 번호
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// 현페이지 번호를 정수형으로 변경
		int currentPage=Integer.parseInt(pageNum);
		// PageDTO 객체생성
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);

		List<CompDTO> compList=compService.getCompList(pageDTO);

		// pageBlock  startPage endPage count pageCount
		int count=compService.getCompCount();
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count / pageSize +(count % pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		model.addAttribute("compList", compList);
		model.addAttribute("pageDTO", pageDTO);

		return "admin/compList";
	}

	// 주문 리스트
	@RequestMapping(value = "/admin/order", method = RequestMethod.GET)
	public String orderList(HttpServletRequest request, Model model, HttpSession session) {
		// 한 화면에 보여줄 글개수
		int pageSize=20;
		// 현페이지 번호
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// 현페이지 번호를 정수형으로 변경
		int currentPage=Integer.parseInt(pageNum);
		// PageDTO 객체생성
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);

		List<OrderListDTO> orderList=memberService.getOrderList(pageDTO);

		// pageBlock  startPage endPage count pageCount
		int count=memberService.getOrderCount();
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count / pageSize +(count % pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		model.addAttribute("orderList", orderList);
		model.addAttribute("pageDTO", pageDTO);

		return "admin/orderList";
	}

	// 상품 리스트
	@RequestMapping(value = "/admin/product", method = RequestMethod.GET)
	public String productList(HttpServletRequest request, Model model, HttpSession session) {
		// 한 화면에 보여줄 글개수
		int pageSize=10;
		// 현페이지 번호
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		// 현페이지 번호를 정수형으로 변경
		int currentPage=Integer.parseInt(pageNum);
		// PageDTO 객체생성
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);

		List<ProdDTO> productList=memberService.getProductList(pageDTO);

		// pageBlock  startPage endPage count pageCount
		int count=memberService.getProductCount();
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count / pageSize +(count % pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		model.addAttribute("productList", productList);
		model.addAttribute("pageDTO", pageDTO);

		return "admin/productList";
	}

	// 쿠폰 페이지
	@RequestMapping(value = "/admin/coupon", method = RequestMethod.GET)
	public String coupon() {
		return "admin/coupon";
	}

	// 회원 삭제 기능
	@RequestMapping(value = "/admin/delete")
	public ResponseEntity<String> compProdDeleteAjax(HttpServletRequest request) {
		String[] ajaxMsg = request.getParameterValues("valueArr");
		// 삭제되는 데이터 만큼 for 문을 돌려 compService.deleteProd 호출
		for(int i=0; i<ajaxMsg.length; i++) {
			memberService.deleteUser(ajaxMsg[i]);
		}

		ResponseEntity<String> entity=new ResponseEntity<String>("1" ,HttpStatus.OK);
		return entity;
	}


	// 쿠폰번호 중복검사
		@RequestMapping(value = "/admin/couponCheck", method = RequestMethod.POST)
		public ResponseEntity<String> couponCheck(HttpServletRequest request) {
			String prodLCode = request.getParameter("prodLCode");
			ProdDTO prodDTO = compService.getProd(prodLCode);
			String result = "";
			if (prodDTO != null) { // 상품코드 중복
				result = "iddup";
			} else { // 상품코드 사용가능
				result = "idok";
			}

			ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
			return entity;
		}
	// 쿠폰 등록
		@RequestMapping(value = "/admin/couponInsert", method = RequestMethod.POST)
		public String couponInsert(CouponDTO couponDTO) {
			// 메서드 호출
			compService.insertCoupon(couponDTO);

			// 주소변경 이동
			return "redirect:/admin/coupon";
		}


}
