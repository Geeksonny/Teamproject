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
import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MypageDTO;
import com.itwillbs.domain.OrderListDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PointDTO;
import com.itwillbs.mail.MailUtils;
import com.itwillbs.mail.TempKey;
import com.itwillbs.service.AddressService;
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
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;


	// 마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		MemberDTO memberDTO = memberService.getMember(userId);
		PointDTO pointDTO = pointService.getMember(userId);
		AddressDTO addressDTO = addressService.getAddress(userId);

		MypageDTO mypageDTO =new MypageDTO();
		mypageDTO.setUserId((String)session.getAttribute("userId"));
		MypageDTO mypageDTO2 = mypageService.mypageselect(mypageDTO);

		model.addAttribute("mypageDTO2",mypageDTO2);

		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("pointDTO", pointDTO);
		model.addAttribute("addressDTO", addressDTO);
		return "mypage/mypage";
	}

	// 마이페이지 - 회원정보수정
	@RequestMapping(value = "/mypage/modify", method = RequestMethod.GET)
	public String modify(HttpSession session, Model model) {
		// 세션값 가져오기
		String userId=(String)session.getAttribute("userId");
		// id에 대한 정보를 디비에 가져오기
		MemberDTO memberDTO = memberService.getMember(userId);
		// 가져온 정보를 담아 info.jsp 이동
		model.addAttribute("memberDTO", memberDTO);

		// 주소변경없이 이동
		// WEB-INF/views/member/info.jsp 이동
		return "mypage/userModify";
	}
	@RequestMapping(value = "/mypage/modifyPro", method = RequestMethod.POST)
	public String modifyPro(MemberDTO memberDTO, HttpSession session) {
		// 메서드 호출
		MemberDTO memberDTO2=memberService.userCheck(memberDTO);
		if(memberDTO2!=null && bcryptPasswordEncoder.matches(memberDTO.getUserPass(), memberDTO2.getUserPass())) {
			// 아이디 비밀번호 일치하면 수정
			memberService.modUser(memberDTO);
			return "redirect:/mypage/modify";
		}else {
			//아이디 비밀번호 틀림
			return "mypage/msg";
		}
	}

	// 마이페이지 - 비밀번호 변경 페이지
	@RequestMapping(value = "/mypage/passMod", method = RequestMethod.GET)
	public String passModify() {
		return "mypage/passModify";
	}


	// 비밀번호 변경
	@RequestMapping(value="/mypage/passModPro" , method=RequestMethod.POST)
	public String passMod(HttpSession session, HttpServletRequest request, MemberDTO memberDTO) throws Exception{
		String userPass=request.getParameter("newPass");
		memberDTO.setUserPass(bcryptPasswordEncoder.encode(userPass));
		String userId =(String)session.getAttribute("userId");
		memberDTO.setUserId(userId);
		memberService.passMod(memberDTO);
		session.invalidate();
//		("msg", "정보 수정이 완료되었습니다. 다시 로그인해주세요.");

		return "redirect:/member/login";
	}


	// 마이페이지 - 회원연결 정보
	@RequestMapping(value = "/mypage/connection", method = RequestMethod.GET)
	public String connection() {
		return "mypage/userConnection";
	}

	// 마이페이지 - 주문 정보
//	@RequestMapping(value = "/mypage/order", method = RequestMethod.GET)
//	public String order(HttpServletRequest request, Model model, HttpSession session) throws Exception {
//	public String order(HttpServletRequest request, Model model, HttpSession session,
//			@ModelAttribute OrderListDTO orderListDTO) {
//		// 한화면에 보여줄 글개수
//				int pageSize = 10;
//				// 현페이지 번호
//				String pageNum = request.getParameter("pageNum");
//				String userId =(String)session.getAttribute("userId");
//
//				if (pageNum == null) {
//					pageNum = "1";
//				}
//
//				// 현페이지 번호를 정수형으로 변경
//				int currentPage = Integer.parseInt(pageNum);
//				// PageDTO 객체생성
//				PageDTO pageDTO = new PageDTO();
//				pageDTO.setPageSize(pageSize);
//				pageDTO.setPageNum(pageNum);
//				pageDTO.setCurrentPage(currentPage);
//				pageDTO.setUserId(userId);
//				List<OrderListDTO> ordList = mypageService.getMyOrdList(pageDTO); // 주문 물건 리스트 갖고오기
//				int count = mypageService.getMyOrdListCount(pageDTO); // 업체 전체 물건 리스트 갯수
//				// 페이징
//				int pageBlock = 10;
//				int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
//				int endPage = startPage + pageBlock - 1;
//				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
//				if (endPage > pageCount) {
//					endPage = pageCount;
//				}
//
//				pageDTO.setCount(count);
//				pageDTO.setPageBlock(pageBlock);
//				pageDTO.setStartPage(startPage);
//				pageDTO.setEndPage(endPage);
//				pageDTO.setPageCount(pageCount);
//				// 데이터 담아서 list.jsp 이동
//				model.addAttribute("ordList", ordList);
//				model.addAttribute("pageDTO", pageDTO);
//
//
//		return "mypage/orderList";
//	}

	// 마이페이지 - 포인트
	@RequestMapping(value = "/mypage/point", method = RequestMethod.GET)
	public String point(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		String userId=(String)session.getAttribute("userId");
		// 한화면에 보여줄 글개수
		int pageSize=10;
		//현페이지 번호
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
		//현페이지 번호를 정수형으로 변경
		int currentPage=Integer.parseInt(pageNum);
		// PageDTO 객체생성
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



}
