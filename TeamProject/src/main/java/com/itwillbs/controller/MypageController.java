package com.itwillbs.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.AddressDTO;
import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.CommonDTO;
import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.CouponDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MypageDTO;
import com.itwillbs.domain.OrderListDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PointDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.mail.MailUtils;
import com.itwillbs.mail.TempKey;
import com.itwillbs.service.AddressService;
import com.itwillbs.service.CommonService;
import com.itwillbs.service.CompService;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MypageService;
import com.itwillbs.service.PointService;

@Controller
public class MypageController {

	@Inject
	private MemberService memberService;
	@Inject
	private PointService pointService;
	@Inject
	private AddressService addressService;
	@Inject
	private MypageService mypageService;
	@Inject
	private CommonService commonService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;


	// 留덉씠�럹�씠吏�
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		MemberDTO memberDTO = memberService.getMember(userId);
		PointDTO pointDTO = pointService.getMember(userId);
		AddressDTO addressDTO = addressService.getAddress(userId);
		
		// 쿠폰 개수
		CommonDTO commonDTO =  new CommonDTO();
		commonDTO.setTableNm("COUPON"); 		// 기준 컬럼
		commonDTO.setColumnNm("COU_USER_ID");
		commonDTO.setUserId((String)session.getAttribute("userId"));
		int couCount = commonService.getMemCount(commonDTO);
		model.addAttribute("couCount", couCount);

		// 주문
		commonDTO.setTableNm("ORDER_LIST"); 		// 기준 컬럼
		commonDTO.setColumnNm("ORD_L_USER");
		commonDTO.setUserId((String)session.getAttribute("userId"));
		int ordCount = commonService.getMemCount(commonDTO);
		model.addAttribute("ordCount", ordCount);

		// 주문
		commonDTO.setTableNm("SHOPPING_BASKET"); 		// 기준 컬럼
		commonDTO.setColumnNm("SB_USER");
		commonDTO.setUserId((String)session.getAttribute("userId"));
		int sbCount = commonService.getMemCount(commonDTO);
		System.out.println(sbCount);
		model.addAttribute("sbCount", sbCount);
		
		MypageDTO mypageDTO =new MypageDTO();
		mypageDTO.setUserId((String)session.getAttribute("userId"));
		MypageDTO mypageDTO2 = mypageService.mypageselect(mypageDTO);

		model.addAttribute("mypageDTO2",mypageDTO2);

		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("pointDTO", pointDTO);
		model.addAttribute("addressDTO", addressDTO);
		return "mypage/mypage";
	}

	// 留덉씠�럹�씠吏� - �쉶�썝�젙蹂댁닔�젙
	@RequestMapping(value = "/mypage/modify", method = RequestMethod.GET)
	public String modify(HttpSession session, Model model) {
		// �꽭�뀡媛� 媛��졇�삤湲�
		String userId=(String)session.getAttribute("userId");
		// id�뿉 ���븳 �젙蹂대�� �뵒鍮꾩뿉 媛��졇�삤湲�
		MemberDTO memberDTO = memberService.getMember(userId);
		// 媛��졇�삩 �젙蹂대�� �떞�븘 info.jsp �씠�룞
		model.addAttribute("memberDTO", memberDTO);

		// 二쇱냼蹂�寃쎌뾾�씠 �씠�룞
		// WEB-INF/views/member/info.jsp �씠�룞
		return "mypage/userModify";
	}
	@RequestMapping(value = "/mypage/modifyPro", method = RequestMethod.POST)
	public String modifyPro(MemberDTO memberDTO, HttpSession session) {
		// 硫붿꽌�뱶 �샇異�
		MemberDTO memberDTO2=memberService.userCheck(memberDTO);
		if(memberDTO2!=null && bcryptPasswordEncoder.matches(memberDTO.getUserPass(), memberDTO2.getUserPass())) {
			// �븘�씠�뵒 鍮꾨�踰덊샇 �씪移섑븯硫� �닔�젙
			memberService.modUser(memberDTO);
			return "redirect:/mypage/modify";
		}else {
			//�븘�씠�뵒 鍮꾨�踰덊샇 ��由�
			return "mypage/msg";
		}
	}

	// 留덉씠�럹�씠吏� - 鍮꾨�踰덊샇 蹂�寃� �럹�씠吏�
	@RequestMapping(value = "/mypage/passMod", method = RequestMethod.GET)
	public String passModify() {
		return "mypage/passModify";
	}


	// 鍮꾨�踰덊샇 蹂�寃�
	@RequestMapping(value="/mypage/passModPro" , method=RequestMethod.POST)
	public String passMod(HttpSession session, HttpServletRequest request, MemberDTO memberDTO) throws Exception{
		String userPass=request.getParameter("newPass");
		memberDTO.setUserPass(bcryptPasswordEncoder.encode(userPass));
		String userId =(String)session.getAttribute("userId");
		memberDTO.setUserId(userId);
		memberService.passMod(memberDTO);
		session.invalidate();
//		("msg", "�젙蹂� �닔�젙�씠 �셿猷뚮릺�뿀�뒿�땲�떎. �떎�떆 濡쒓렇�씤�빐二쇱꽭�슂.");

		return "redirect:/member/login";
	}


	// 留덉씠�럹�씠吏� - �쉶�썝�뿰寃� �젙蹂�
	@RequestMapping(value = "/mypage/connection", method = RequestMethod.GET)
	public String connection() {
		return "mypage/userConnection";
	}

	// 留덉씠�럹�씠吏� - 二쇰Ц �젙蹂�
	@RequestMapping(value = "/mypage/order", method = RequestMethod.GET)
	public String order(HttpServletRequest request, Model model, HttpSession session,
			@ModelAttribute OrderListDTO orderListDTO) {
		// �븳�솕硫댁뿉 蹂댁뿬以� 湲�媛쒖닔
				int pageSize = 10;
				// �쁽�럹�씠吏� 踰덊샇
				String pageNum = request.getParameter("pageNum");
				String userId =(String)session.getAttribute("userId");

				if (pageNum == null) {
					pageNum = "1";
				}
				String startDate=request.getParameter("startDate");
				String endDate=request.getParameter("endDate");
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				if(startDate ==null && endDate ==null) {
					startDate=simpleDateFormat.format(new Date().getYear());
					endDate=simpleDateFormat.format(new Date());
				}
				// �쁽�럹�씠吏� 踰덊샇瑜� �젙�닔�삎�쑝濡� 蹂�寃�
				int currentPage = Integer.parseInt(pageNum);
				// PageDTO 媛앹껜�깮�꽦
				PageDTO pageDTO = new PageDTO();
				pageDTO.setPageSize(pageSize);
				pageDTO.setPageNum(pageNum);
				pageDTO.setCurrentPage(currentPage);
				pageDTO.setUserId(userId);
				pageDTO.setStartDate(startDate);
				pageDTO.setEndDate(endDate);
				List<OrderListDTO> ordList = mypageService.getOrdList(pageDTO); // 二쇰Ц 臾쇨굔 由ъ뒪�듃 媛뽮퀬�삤湲�
				int count = mypageService.getMyOrdListCount(pageDTO); // �뾽泥� �쟾泥� 臾쇨굔 由ъ뒪�듃 媛��닔
				// �럹�씠吏�
				int pageBlock = 10;
				int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
				int endPage = startPage + pageBlock - 1;
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				if (endPage > pageCount) {
					endPage = pageCount;
				}

				pageDTO.setCount(count);
				pageDTO.setPageBlock(pageBlock);
				pageDTO.setStartPage(startPage);
				pageDTO.setEndPage(endPage);
				pageDTO.setPageCount(pageCount);
				// �뜲�씠�꽣 �떞�븘�꽌 list.jsp �씠�룞
//				System.out.println(ordList.toString());

				model.addAttribute("ordList", ordList);
				model.addAttribute("pageDTO", pageDTO);


		return "mypage/orderList";
	}

	// 留덉씠�럹�씠吏� - �룷�씤�듃
	@RequestMapping(value = "/mypage/point", method = RequestMethod.GET)
	public String point(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		String userId=(String)session.getAttribute("userId");
		// �븳�솕硫댁뿉 蹂댁뿬以� 湲�媛쒖닔
		int pageSize=10;
		//�쁽�럹�씠吏� 踰덊샇
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		String startDate=request.getParameter("startDate");
		String endDate=request.getParameter("endDate");
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		if(startDate ==null && endDate ==null) {
			startDate=simpleDateFormat.format(new Date().getYear());
			endDate=simpleDateFormat.format(new Date());
		}
		//�쁽�럹�씠吏� 踰덊샇瑜� �젙�닔�삎�쑝濡� 蹂�寃�
		int currentPage=Integer.parseInt(pageNum);
		// PageDTO 媛앹껜�깮�꽦
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setUserId(userId);
		pageDTO.setStartDate(startDate);
		pageDTO.setEndDate(endDate);
		List<PointDTO> pointList=pointService.getPointCheckList(pageDTO);
		// pageBlock  startPage endPage count pageCount
		int count=pointService.getPointCount(userId);
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

		model.addAttribute("pointList", pointList);
		model.addAttribute("pageDTO", pageDTO);
		return "mypage/userPoint";
	}
	@RequestMapping(value = "/mypage/boardList", method = RequestMethod.GET)
	public String boardList(HttpServletRequest request, Model model, HttpSession session, BoardDTO boardDTO) {
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
		boardDTO.setPageSize(pageSize);
		boardDTO.setPageNum(pageNum);
		boardDTO.setCurrentPage(currentPage);
		boardDTO.setUserNicknm(request.getParameter("userNicknm"));
		List<BoardDTO> boardList=mypageService.getBoardList(boardDTO);
		System.out.println(boardDTO);
		// pageBlock  startPage endPage count pageCount
		int count=mypageService.getBoardCount();
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

		return "mypage/boardList";
	}

	@RequestMapping(value = "/mypage/likeList", method = RequestMethod.GET)
	public String likeList(HttpServletRequest request, Model model, HttpSession session, BoardDTO boardDTO) {
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
		boardDTO.setPageSize(pageSize);
		boardDTO.setPageNum(pageNum);
		boardDTO.setCurrentPage(currentPage);
		boardDTO.setUserNicknm(request.getParameter("userNicknm"));
		List<BoardDTO> boardList2=mypageService.getBoardLikeList(boardDTO);
		System.out.println(boardDTO);
		// pageBlock  startPage endPage count pageCount
		int count=mypageService.getBoardCount();
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
		model.addAttribute("boardList2", boardList2);
		model.addAttribute("boardDTO", boardDTO);

		return "mypage/likeList";
	}

	@RequestMapping(value = "/mypage/prodLikeList", method = RequestMethod.GET)
	public String prodLikeList(HttpServletRequest request, Model model, HttpSession session, ProdDTO prodDTO) {
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
		prodDTO.setPageSize(pageSize);
		prodDTO.setPageNum(pageNum);
		prodDTO.setCurrentPage(currentPage);
		prodDTO.setProdLCode(request.getParameter("prodlCode"));
		List<ProdDTO> prodList=mypageService.getPordLikeList(prodDTO);
		System.out.println(prodDTO);
		// pageBlock  startPage endPage count pageCount
		int count=mypageService.getBoardCount();
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
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
		model.addAttribute("prodList", prodList);
		model.addAttribute("prodDTO", prodDTO);

		return "mypage/prodLikeList";
	}

	// 쿠폰 페이지

	@RequestMapping(value = "/mypage/coupon", method = RequestMethod.GET)
	public String ordList(HttpServletRequest request, Model model, HttpSession session,
			@ModelAttribute CouponDTO couponDTO) {
		String couUserId = (String) session.getAttribute("userId");
		couponDTO.setCouUserId(couUserId);

		// 한화면에 보여줄 글개수
				int pageSize = 6;
				// 현페이지 번호
				String pageNum = request.getParameter("pageNum");

				if (pageNum == null) {
					pageNum = "1";
				}
				// 현페이지 번호를 정수형으로 변경
				int currentPage = Integer.parseInt(pageNum);
				// PageDTO 객체생성
//				PageDTO pageDTO = new PageDTO();
				couponDTO.setPageSize(pageSize);
				couponDTO.setPageNum(pageNum);
				couponDTO.setCurrentPage(currentPage);
				couponDTO.setUserId(couUserId);
																															// 컬럼
				List<CouponDTO> couponList = mypageService.getMyCouponList(couponDTO); // 물건 리스트 갖고오기

				int count = mypageService.getMyCouponListCount(couponDTO); // 업체 전체 물건 리스트 갯수
				// 페이징
				int pageBlock = 6;
				int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
				int endPage = startPage + pageBlock - 1;
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				if (endPage > pageCount) {
					endPage = pageCount;
				}

				couponDTO.setCount(count);
				couponDTO.setPageBlock(pageBlock);
				couponDTO.setStartPage(startPage);
				couponDTO.setEndPage(endPage);
				couponDTO.setPageCount(pageCount);

				// 데이터 담아서 list.jsp 이동
				model.addAttribute("couponDTO", couponDTO);

		model.addAttribute("couponList", couponList);

		// 주소변경없이 이동
		// WEB-INF/views/board/list.jsp 이동
		return "mypage/coupon";
	}


	// 쿠폰 등록
			@RequestMapping(value = "/mypage/couponInsert", method = RequestMethod.POST)
			public String couponInsert(CouponDTO couponDTO,HttpSession session) {
				String couUserId = (String) session.getAttribute("userId");
				couponDTO.setCouUserId(couUserId);
				// 메서드 호출
				mypageService.insertMyCoupon(couponDTO);

				// 주소변경 이동
				return "redirect:/mypage/coupon";
			}
			//
		
		// 주문취소
		@RequestMapping(value="/mypage/orderRefund" , method=RequestMethod.POST)
		public String orderRefund(HttpSession session, HttpServletRequest request, OrderListDTO orderListDTO) throws Exception{
			int ordNum = Integer.parseInt(request.getParameter("ordNum"));
			OrderListDTO orderListDTO2=mypageService.numCheck(ordNum);
			if(orderListDTO2!=null) {
				orderListDTO.setOrdPurchasestatus("N");
				orderListDTO.setOrdRefund("11");
				mypageService.updateOrderStatus(orderListDTO);
				return "redirect:/mypage/order";	
			}else {
				// "틀림" 뒤로이동
				return "member/msg";
			}	
				
		}
		// 주문확정
		@RequestMapping(value="/mypage/orderFin" , method=RequestMethod.POST)
		public String orderFin(HttpSession session, HttpServletRequest request, OrderListDTO orderListDTO) throws Exception{
			int ordNum = Integer.parseInt(request.getParameter("ordNum"));
			OrderListDTO orderListDTO2=mypageService.numCheck(ordNum);
			if(orderListDTO2!=null) {
				orderListDTO.setOrdRefund("13");
				mypageService.updateOrderFin(orderListDTO);
				return "redirect:/mypage/order";	
			}else {
				// "틀림" 뒤로이동
				return "member/msg";
			}	
				
		}
}
