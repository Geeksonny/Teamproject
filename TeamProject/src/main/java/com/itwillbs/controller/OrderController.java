package com.itwillbs.controller;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.AddressDTO;
import com.itwillbs.domain.BasketDTO;
import com.itwillbs.domain.CouponDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.OrderListDTO;
import com.itwillbs.domain.PointDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.function.FunctionClass;
import com.itwillbs.service.AddressService;
import com.itwillbs.service.BasketService;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.OrderService;
import com.itwillbs.service.PointService;
import com.siot.IamportRestClient.IamportClient;


@Controller
public class OrderController {

	@Inject
	private AddressService addressService;

	@Inject
	private MemberService memberService;

	@Inject
	private BasketService basketService;

	@Inject
	private PointService pointService;

	@Inject
	private OrderService orderService;


	private IamportClient api;

	public OrderController() {
	      // REST API 키와 REST API secret 입력
	      this.api = new IamportClient("6077548071335284", "dCktE2HC7a2YUwzkDWeeqfuZvZdDen3Sm66vMQja5xQTpoAsMz9YUPZ42kuSyxReMbEXbvtEvOjllVjQ");
	}


	@RequestMapping(value = "/order/checkout", method = RequestMethod.GET)
	public String orderCheckout(HttpSession session, Model model, @ModelAttribute BasketDTO basketDTO, @ModelAttribute ProdDTO prodDTO, @ModelAttribute PointDTO pointDTO,
								@ModelAttribute OrderDTO orderDTO, @ModelAttribute OrderListDTO orderListDTO, @ModelAttribute ProdDTO prodDTO2, @ModelAttribute CouponDTO couponDTO ) {
		String userId = (String) session.getAttribute("userId");
		basketDTO.setSbUser(userId);
		pointDTO.setUserId(userId);
		AddressDTO addressDTO = addressService.getAddress(userId);
		MemberDTO memberDTO = memberService.getMember(userId);
		List<BasketDTO> basketList=basketService.getBasketList(basketDTO);
		PointDTO pointDTO2 = pointService.getMember(userId);
		List<ProdDTO> quantityList = orderService.getQuantityList(prodDTO2);


		// 상품 가격 총합
		int total = 0;
		for(BasketDTO dto : basketList) {
			total+=dto.getSbProdPrice() * dto.getSbCount();
		}


		model.addAttribute("addressDTO", addressDTO);
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("basketList", basketList);
		model.addAttribute("total", total);
		model.addAttribute("pointDTO2", pointDTO2);
		model.addAttribute("quantityList", quantityList);
		model.addAttribute("couponDTO", couponDTO);

		return "order/checkout";
	}

	// 결제완료
	 @ResponseBody
	   @RequestMapping(value="/order/orderComplete", method = RequestMethod.POST)
	   public String paymenByImpUid (HttpSession session, HttpServletRequest request, @RequestParam Map<String, Object> para, BasketDTO basketDTO){
	      Map<String, Object> sMap = para;
	      sMap.put("userId", (String)session.getAttribute("userId"));
	      sMap.put("ordDeliveryMessage", request.getParameter("ordDeliveryMessage"));
	      sMap.put("pointDate", new FunctionClass().nowTime("yyyy-MM-dd HH:mm:ss"));
	      sMap.put("pointNow", request.getParameter("pointNow"));
	      sMap.put("pointUsed", request.getParameter("pointUsed"));
	      sMap.put("couNm", request.getParameter("couNm"));

	      System.out.println(sMap);
	      orderService.insertOrder(sMap);
	      basketDTO.setSbUser((String)session.getAttribute("userId"));
	      List<BasketDTO> basketList=basketService.getBasketList(basketDTO);
	      for(int i=0; i<basketList.size(); i++) {
	    	  basketDTO = basketList.get(i);

	    	  sMap.put("ordLUser", basketDTO.getSbUser());
	    	  sMap.put("ordLCode", basketDTO.getSbProdCode());
	    	  sMap.put("ordLQuantity", basketDTO.getSbCount());
	    	  sMap.put("ordLPrice", basketDTO.getSbProdPrice());
	    	  sMap.put("prodLCode", basketDTO.getSbProdCode());

	    	  orderService.isertOrderList(sMap);
	    	  orderService.updateQuantity(sMap);
	      }
	      	 orderService.insertUsePoint(sMap);
	      	 orderService.updateCoupon(sMap);
	      	 orderService.removeItemBasket(sMap);

	      return "redirect:/main/main";
	 }

	 // 마이페이지 주문목록
		@RequestMapping(value = "/mypage/order", method = RequestMethod.POST)
		public String insertAddress(AddressDTO addressDTO, HttpSession session) {
			String userId = (String) session.getAttribute("userId");
			addressDTO.setUserId(userId);
			addressService.insertAddress(addressDTO);
			return "redirect:/mypage/order";
		}

}