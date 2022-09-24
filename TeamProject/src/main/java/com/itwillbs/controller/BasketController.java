package com.itwillbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.BasketDTO;
import com.itwillbs.domain.CommonDTO;
import com.itwillbs.domain.CouponDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.service.BasketService;

@Controller
public class BasketController {
	@Inject
	private BasketService basketService;
	// 카트에서 물건 갖고 오기
	@RequestMapping(value = "/order/cart", method = RequestMethod.GET)
	public String orderCartList(HttpServletRequest request, Model model,HttpSession session,@ModelAttribute BasketDTO basketDTO) {
		String userId = (String)session.getAttribute("userId");
		basketDTO.setSbUser(userId);

		List<BasketDTO> basketList=basketService.getBasketList(basketDTO); // 물건 리스트 갖고오기
		model.addAttribute("basketList", basketList);
		return "order/cart";

	}
	// 카트에 물건 담기
	@ResponseBody
	@RequestMapping(value = "/product/cartPro", method = RequestMethod.POST)
	public ResponseEntity<String> cartPro(HttpSession session,HttpServletRequest request,BasketDTO basketDTO) throws Exception {
		String userId = (String)session.getAttribute("userId");

		basketDTO.setSbCount(basketDTO.getSbCount());
		basketDTO.setSbUser(userId);
		BasketDTO basketDTO2 = basketService.prodCodeCheck(basketDTO);

		if(basketDTO2!=null) { // 중복 물건일때
			ResponseEntity<String> entity=new ResponseEntity<String>("2" ,HttpStatus.OK);
			return entity;
		}else { //중복물건 아닐때
			basketService.insertBasket(basketDTO);
			ResponseEntity<String> entity=new ResponseEntity<String>("1" ,HttpStatus.OK);
			return entity;
		}


	}
	// 주문인서트 구현
			@RequestMapping(value = "/order/insertOrder", method = RequestMethod.POST)
			public String insertOrder (HttpSession session,HttpServletRequest request,BasketDTO basketDTO) {
				String[] sbProdCode=request.getParameterValues("CheckRow");
				String[] sbCount=request.getParameterValues("select_vol");
				String[] sbProdPrice=request.getParameterValues("sbProdPrice");
				String userId = (String)session.getAttribute("userId");
				String couNumCouDc =request.getParameter("myCouponList");
				if(sbProdCode != null) {
				for(int i =0 ; i < sbProdCode.length;i++ ) {
					basketDTO.setSbProdCode(sbProdCode[i]);
					basketDTO.setSbCount(Integer.parseInt(sbCount[i]));
					basketDTO.setSbProdPrice(Integer.parseInt(sbProdPrice[i]));
					basketDTO.setSbUser(userId);
					basketDTO.setOrdLCounumcoudc(couNumCouDc);
//					basketService.insertOrder(basketDTO);   // order DB로 넘김
//					basketService.deleteBasket(basketDTO);  // basket DB 데이터 삭제 -------------> 주문시 삭제 하기위애 주석처리
				}
				} else {
					return "redirect:/order/checkout";
				}

				return "redirect:/order/checkout";
			}

			// 삭제기능 구현
			@RequestMapping(value = "/order/delete")
			public ResponseEntity<String> compProdDeleteAjax(HttpSession session,HttpServletRequest request,BasketDTO basketDTO) {
				String userId = (String)session.getAttribute("userId"); // 삭제 할때 필요한 유저 아이디


					basketDTO.setSbUser(userId);         // 삭제 하는 유저 아이디
					basketService.deleteBasket(basketDTO);


				ResponseEntity<String> entity=new ResponseEntity<String>("1" ,HttpStatus.OK);
				return entity;
			}
			// 디비에 수정된 수량 넣기 구현
			@ResponseBody
			@RequestMapping(value = "/order/update",method = RequestMethod.POST)
			public ResponseEntity<String> oderUpdateAjax(HttpSession session,HttpServletRequest request,BasketDTO basketDTO) {


				basketService.updateBasket(basketDTO);
				ResponseEntity<String> entity=new ResponseEntity<String>("1" ,HttpStatus.OK);
				return entity;
			}
			// 쿠폰 리스트 갖고오기

			@RequestMapping(value = "/order/myCoupon", method = RequestMethod.POST)
			public @ResponseBody Map<String, Object> List(HttpServletRequest req, HttpServletResponse res, @ModelAttribute CouponDTO couponDTO) {

				Map<String, Object> map = new HashMap<>();
				try {
					List<CouponDTO> couponList =  basketService.selectCouponList(couponDTO);
					map.put("code", "S");
					map.put("couponList", couponList);
				} catch (Exception e) {
					e.printStackTrace();
				}

				return map;
		    }


}
