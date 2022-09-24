package com.itwillbs.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.CommonDTO;
import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.OrderListDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;
import com.itwillbs.service.CommonService;
import com.itwillbs.service.CompService;
import com.itwillbs.service.MemberService;
import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

import okhttp3.Request;

@Controller
public class CompController {

	@Inject
	private CompService compService;
	@Inject
	private CommonService commonService;
	@Resource(name = "compUploadPath")
	private String compUploadPath;

	@RequestMapping(value = "/comp/updateProd", method = RequestMethod.GET)
	public String compUpdateProd() {
		return "comp/updateProd";
	}

	@RequestMapping(value = "/comp/insertGoods", method = RequestMethod.GET)
	public String compInsertProd() {
		return "comp/insertGoods";
	}

	// 제품코드 중복검사
	@RequestMapping(value = "/comp/idDupCheck", method = RequestMethod.POST)
	public ResponseEntity<String> compidCheck(HttpServletRequest request) {
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

	@RequestMapping(value = "/comp/insertGoodsPro", method = RequestMethod.POST)
	public String insertPro(HttpServletRequest request, HttpSession session, MultipartFile prodLMainimg,
			MultipartFile prodLSubimg, @ModelAttribute CompDTO compDTO) throws Exception {

		ProdDTO prodDTO = new ProdDTO();
		String prodLCode = request.getParameter("prodLCode");
		if (prodLCode.equals(null) || prodLCode.equals("")) {
			CommonDTO commonDTO = new CommonDTO();
			commonDTO.setComCd("PF"); // 코드 정의
			commonDTO.setColumnNm("PROD_L_CODE"); // 기준 컬럼
			commonDTO.setTableNm("PRODUCT_LIST"); // 테이블 정의
			CommonDTO cd = commonService.selectCodeSearch(commonDTO);
			// cd = PF220906001 로 생성됨
			// 조회해온 코드값을 원하는 DTO에 Set 처리
			prodDTO.setProdLCode(cd.getPkCd());

		} else {
			prodDTO.setProdLCode(prodLCode);
		}


		// 로그인후 세션값, 업체 아이디 갖고옴

		// 파일 이름 => 랜덤문자_파일이름

		UUID uuid = UUID.randomUUID();

		String MainImg = uuid.toString() + "_" + prodLMainimg.getOriginalFilename();
		String SubImg = uuid.toString() + "_" + prodLSubimg.getOriginalFilename();

		// 업로드파일 file.getBytes() => upload/랜덤문자_파일이름 복사
		File uploadMainFile = new File(compUploadPath, MainImg);
		File uploadSubFile = new File(compUploadPath, SubImg);
		FileCopyUtils.copy(prodLMainimg.getBytes(), uploadMainFile);
		FileCopyUtils.copy(prodLSubimg.getBytes(), uploadSubFile);

		prodDTO.setProdLCompnm(request.getParameter("prodLCompNm"));
		prodDTO.setProdLOption1(request.getParameter("prodLOption1"));
		prodDTO.setProdLOption2(request.getParameter("prodLOption2"));
		prodDTO.setProdLOption3(request.getParameter("prodLOption3"));
		prodDTO.setProdLOption4(request.getParameter("prodLOption4"));
		prodDTO.setProdLOption5(request.getParameter("prodLOption5"));
		prodDTO.setProdLProdnm(request.getParameter("prodLProdNm"));
		prodDTO.setProdLPrice(Integer.parseInt(request.getParameter("prodLPrice")));
		prodDTO.setProdLDetail(request.getParameter("ProdLDetail"));
		prodDTO.setProdLQuantity(Integer.parseInt(request.getParameter("prodLQuantity")));
		prodDTO.setProdLSubimg(SubImg);
		prodDTO.setProdLMainimg(MainImg);

//		상세 옵션 넣기

		compService.insertProd(prodDTO);
//		System.out.println(prodDTO);
		// 주소변경 이동
		return "redirect:/comp/insertGoods";
	}
	// 업로드 경로 servlet-context.mxl upload폴더 경로 이름

	// 물품목록페이지
	@RequestMapping(value = "/comp/deleteProd", method = RequestMethod.GET)
	public String list(HttpServletRequest request, Model model, HttpSession session, @ModelAttribute ProdDTO prodDTO) {
		// 한화면에 보여줄 글개수
		int pageSize = 10;
		// 현페이지 번호
		String pageNum = request.getParameter("pageNum");
		String CompNm = (String) session.getAttribute("compId");

		if (pageNum == null) {
			pageNum = "1";
		}

		// 현페이지 번호를 정수형으로 변경
		int currentPage = Integer.parseInt(pageNum);
		// PageDTO 객체생성
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setCompId(CompNm);
		pageDTO.setColumnNm(request.getParameter("searchCol") == null ? "0" : request.getParameter("searchCol")); // 기준
																													// 컬럼
		pageDTO.setSearchKeyWord(request.getParameter("searchKeyWord")); // 검색 키워드 갖고오기
		pageDTO.setStatus(request.getParameter("status")); // 검색 양호,품절 상태 갖고오기
		List<ProdDTO> prodList = compService.getProdList(pageDTO); // 물건 리스트 갖고오기

		int count = compService.getProdCount(pageDTO); // 업체 전체 물건 리스트 갯수
		// 페이징
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

		// 데이터 담아서 list.jsp 이동
		model.addAttribute("prodList", prodList);
		model.addAttribute("pageDTO", pageDTO);

		// 주소변경없이 이동
		// WEB-INF/views/board/list.jsp 이동
		return "/comp/deleteProd";
	}

	// 삭제기능 구현
	@RequestMapping(value = "/comp/delete")
	public ResponseEntity<String> compProdDeleteAjax(HttpServletRequest request) {
		String[] ajaxMsg = request.getParameterValues("valueArr");
		// 삭제되는 데이터 만큼 for 문을 돌려 compService.deleteProd 호출
		for (int i = 0; i < ajaxMsg.length; i++) {
			compService.deleteProd(ajaxMsg[i]);
		}

		ResponseEntity<String> entity = new ResponseEntity<String>("1", HttpStatus.OK);
		return entity;
	}

	// 수정
	@RequestMapping(value = "/comp/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request, Model model) {
		// 파라미터 가져오기
		String prodLCode = request.getParameter("CheckRow");
		// 디비에서 조회
		ProdDTO prodDTO = compService.getProd(prodLCode);

		// model에 데이터 저장
		model.addAttribute("prodDTO", prodDTO);

		// 주소변경없이 이동
		// WEB-INF/views/board/updateForm.jsp 이동
		return "/comp/updateProd";
	}

	@RequestMapping(value = "/comp/updatePro", method = RequestMethod.POST)
	public String updatePro(HttpSession session, HttpServletRequest request, MultipartFile prodLMainimg,
			MultipartFile prodLSubimg) throws Exception {
		String filenamemain = "";
		String filenamesub = "";
		if (prodLMainimg.isEmpty()) {
			filenamemain = request.getParameter("oldfilemain");
		} else {
			UUID uuid = UUID.randomUUID();
			filenamemain = uuid.toString() + "_" + prodLMainimg.getOriginalFilename();
			// 업로드파일 file.getBytes() => upload/랜덤문자_파일이름 복사
			File uploadFileMain = new File(compUploadPath, filenamemain);

			FileCopyUtils.copy(prodLMainimg.getBytes(), uploadFileMain);
		}
		if (prodLSubimg.isEmpty()) {
			filenamemain = request.getParameter("oldfilesub");
		} else {
			UUID uuid = UUID.randomUUID();
			filenamemain = uuid.toString() + "_" + prodLSubimg.getOriginalFilename();
			// 업로드파일 file.getBytes() => upload/랜덤문자_파일이름 복사
			File uploadFileSub = new File(compUploadPath, filenamesub);

			FileCopyUtils.copy(prodLSubimg.getBytes(), uploadFileSub);
		}

		ProdDTO prodDTO = new ProdDTO();
		prodDTO.setProdLCode(request.getParameter("prodLCode"));
		prodDTO.setProdLPrice(Integer.parseInt(request.getParameter("prodLPrice")));
		prodDTO.setProdLQuantity(Integer.parseInt(request.getParameter("prodSCount")));
		prodDTO.setProdLDetail(request.getParameter("ProdLDetail"));
		prodDTO.setProdLMainimg(filenamemain);
		prodDTO.setProdLSubimg(filenamesub);

		// id 일치 확인
		CompDTO compDTO = new CompDTO();
		String CompNm = (String) session.getAttribute("compId");
		compDTO.setCompId(CompNm);
		compDTO = compService.getComp(compDTO);
		if (compDTO != null) {
//			num pass 일치
			compService.updateProd(prodDTO);
			// 주소변경하면서 이동 /board/list 이동
			return "redirect:/comp/updateProd";
		} else {
			// 아이디 틀림
			// "틀림" 뒤로이동
			// 주소변경없이 이동
			// WEB-INF/views/board/msg.jsp 이동
			return "board/msg";
		}
	}

	@RequestMapping(value = "/comp/prodRefund", method = RequestMethod.GET)
	public String compProdRefund() {
		return "comp/prodRefund";
	}

	// 업체 정보 수정
	@RequestMapping(value = "/comp/modify", method = RequestMethod.GET)
	public String compModify(HttpSession session, Model model, CompDTO compDTO) {
		// 세션값 가져오기
		String compId = (String) session.getAttribute("compId");
		compDTO.setCompId(compId);
		// id에 대한 정보를 디비에 가져오기
		compDTO = compService.getComp(compDTO);
		// 가져온 정보를 담아 info.jsp 이동

		model.addAttribute("compDTO", compDTO);

		return "comp/compModify";
	}

	@RequestMapping(value = "/comp/modifyPro", method = RequestMethod.POST)
	public String modifyPro(CompDTO compDTO, HttpSession session) {
		// 패스워드 아이디 일치 메서드 호출
		CompDTO compDTO2 = compService.getComp(compDTO);
		if (compDTO2 != null) {
			// 아이디 비밀번호 일치
			// 수정작업
			compService.modComp(compDTO);
			// 주소변경 이동
			return "redirect:/comp/modify";
		} else {
			// 아이디 비밀번호 틀림
			return "member/msg";
		}
	}

	// 업체페이지 - 비밀번호 변경 페이지
	@RequestMapping(value = "/comp/passMod", method = RequestMethod.GET)
	public String passModify() {
		return "comp/passModify";
	}

	@RequestMapping(value = "/comp/prodList", method = RequestMethod.GET)
	public String compProdList() {
		return "comp/prodList";
	}

	// 회원 탈퇴
	@RequestMapping(value = "/comp/deletePro", method = RequestMethod.POST)
	public ResponseEntity<String> deletePro(CompDTO compDTO, HttpServletRequest request, HttpSession session) {
		// 메서드 호출
		CompDTO compDTO2 = compService.getComp(compDTO);
		String result = "";
		if (compDTO2 != null) {
			compService.delComp(compDTO);
			// 세션값 초기화
			session.invalidate();
			result = "ok";
		} else {
			result = "fail";
		}
		ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
		return entity;

	}

	// 비밀번호 체크
	@RequestMapping(value = "/comp/passCheck", method = RequestMethod.POST)
	public ResponseEntity<String> passCheck(CompDTO compDTO, HttpServletRequest request) throws Exception {
		CompDTO compDTO2 = compService.getComp(compDTO);
		String result = "";
		if (compDTO2 == null) {
			result = "no";
		} else {
			result = "ok";
		}
		ResponseEntity<String> entity = new ResponseEntity<String>(result, HttpStatus.OK);
		return entity;
	}

	// 비밀번호 변경
	@RequestMapping(value = "/comp/passModPro", method = RequestMethod.POST)
	public String passMod(HttpSession session, HttpServletRequest request, CompDTO compDTO) throws Exception {
		String compPass = request.getParameter("newPass");
		compDTO.setCompPass(compPass);
		String compId = (String) session.getAttribute("compId");
		compDTO.setCompId(compId);
		compService.passMod(compDTO);
		session.invalidate();
//			("msg", "정보 수정이 완료되었습니다. 다시 로그인해주세요.");

		return "redirect:/member/login";
	}

	// 주문 목록 페이지
	@RequestMapping(value = "/comp/ordList", method = RequestMethod.GET)
	public String ordList(HttpServletRequest request, Model model, HttpSession session,
			@ModelAttribute OrderListDTO orderListDTO) {

		// 한화면에 보여줄 글개수
		int pageSize = 10;
		// 현페이지 번호
		String pageNum = request.getParameter("pageNum");
		String compId = (String) session.getAttribute("compId");

		if (pageNum == null) {
			pageNum = "1";
		}

		// 현페이지 번호를 정수형으로 변경
		int currentPage = Integer.parseInt(pageNum);
		// PageDTO 객체생성
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setCompId(compId);
		List<OrderListDTO> ordList = compService.getOrdList(pageDTO); // 주문 물건 리스트 갖고오기
		int count = compService.getOrdCount(pageDTO); // 업체 전체 물건 리스트 갯수
		// 페이징
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

		// 데이터 담아서 list.jsp 이동
		model.addAttribute("ordList", ordList);
		model.addAttribute("pageDTO", pageDTO);

		// 주소변경없이 이동
		// WEB-INF/views/board/list.jsp 이동
		return "/comp/ordList";
	}

	// 송장번호 입력과 배송중으로 바꿈
	@RequestMapping(value = { "/comp/delivNumberInsert" }, method = { RequestMethod.POST })
	public String delivNumberInsert(OrderListDTO orderListDTO,HttpServletRequest request) throws Exception {
		String ordLDelivNumber = request.getParameter("ordLDelivComp");
		ordLDelivNumber += ","+request.getParameter("ordLDelivNum");
		orderListDTO.setOrdLDelivNumber(ordLDelivNumber);
		compService.delivNumberInsert(orderListDTO); // 송장번호 입력
		orderListDTO.setOrdDeliveryStatus("1"); // 배송중으로 셋팅
		compService.delivNumberUpdate(orderListDTO); // 배송중으로 셋팅

		return "redirect:/comp/ordList";
	}
	// 송장번호 입력과 배송중으로 바꿈
	@RequestMapping(value = { "/comp/refund" }, method = { RequestMethod.POST })
	public String refund(OrderListDTO orderListDTO,HttpServletRequest request) throws Exception {
		orderListDTO.setOrdDeliveryStatus("3"); //배송취소로 셋팅
		orderListDTO.setOrdRefund("12"); // 환불완료로 셋팅
		compService.refundDeliveryStatusUpdate(orderListDTO); // 배송취소, 환불완료로 디비수정
		compService.couponUpdate(orderListDTO); // 쿠폰 돌려주기
		compService.prodquantityUpdate(orderListDTO); // 물품수량 되돌리기
		return "redirect:/comp/ordList";
	}



//		 업체 페이지 메인화면
	@RequestMapping(value = "/comp/compMain", method = RequestMethod.GET)
	public ModelAndView complist(HttpSession session, HttpServletRequest req, HttpServletResponse res,
			@ModelAttribute OrderListDTO orderListDTO, @ModelAttribute CompDTO compDTO, @ModelAttribute ProdDTO prodDTO,
			@ModelAttribute PageDTO pageDTO) throws Exception {
		String compId = (String) session.getAttribute("compId");
		compDTO.setCompId(compId);
		CompDTO compDTO2 = compService.getComp(compDTO);
		if (compDTO2 != null) {

			try {

				ModelAndView mv = new ModelAndView();
				orderListDTO.setCompId(compId); // 기준 업체

				// 1 미배송 갯수
				orderListDTO.setOrdDeliveryStatus("1");
				int ordCount1 = compService.getOrdCountDeliv(orderListDTO);
				mv.addObject("ordCount1", ordCount1);
				mv.setViewName("comp/compMain");

				// 3 배송완료 갯수
				orderListDTO.setOrdDeliveryStatus("3");
				int ordCount3 = compService.getOrdCountDeliv(orderListDTO);
				mv.addObject("ordCount3", ordCount3);

				// 총 매출
				int totalsum = compService.getTotalsum(orderListDTO); // 물건개별 총합 리스트 갖고오기
				mv.addObject("totalsum", totalsum);

				// 품절,품절임박, 양호 상품 갯수
				orderListDTO.setCompId(compId);

				OrderListDTO prodAmount = compService.getProdAmount(orderListDTO);

				mv.addObject("prodAmount", prodAmount);

				// 총 물건 등록갯수
				pageDTO.setCompId(compId);
				int totalProd = compService.getProdCount(pageDTO);
				mv.addObject("totalProd", totalProd);
				// 업체 정보
				compDTO.setCompId(compId);
				CompDTO compDTO1 = compService.getComp(compDTO);
				mv.addObject("compDTO1", compDTO1);

				return mv;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;

		} else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("member/msg");
			return mv;
		}
	}
	// 주문 목록 클릭시 주문 상세 페이지
	@RequestMapping(value = "/comp/ordListDet", method = RequestMethod.GET)
	public String ordListDet(HttpServletRequest request, Model model) {
		// 파라미터 가져오기
		String prodLCodeUser = request.getParameter("CheckRow");
		 String prodLCode = prodLCodeUser.split(",")[0];
		 String ordUser = prodLCodeUser.split(",")[1];

		// 디비에서 조회
		OrderListDTO orderListDTO1 = new OrderListDTO();
		orderListDTO1.setOrdLUser(ordUser);
		orderListDTO1.setOrdLCode(prodLCode);
		OrderListDTO orderListDTO = compService.getOrdListDet(orderListDTO1);

		// model에 데이터 저장
		model.addAttribute("orderListDTO", orderListDTO);

		// 주소변경없이 이동
		// WEB-INF/views/board/updateForm.jsp 이동
		return "/comp/ordListDet";
	}




} // 마지막 괄호
