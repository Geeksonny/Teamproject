package com.itwillbs.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.AddressDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.AddressService;
import com.itwillbs.service.MemberService;

@Controller
public class AddressController {

	@Inject
	private AddressService addressService;

	@Inject
	private MemberService memberService;

	// 회원정보수정 - 배송지관리 - 배송지입력 
	@RequestMapping(value = "/order/insertAddress", method = RequestMethod.POST)
	public String insertAddress(AddressDTO addressDTO, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		addressDTO.setUserId(userId);
		addressService.insertAddress(addressDTO);
		return "redirect:/mypage/addr";
	}
	
	// 주문페이지 - 배송지입력
	@RequestMapping(value = "/order/insertAddress2", method = RequestMethod.POST)
	public String insertAddress2(AddressDTO addressDTO, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		addressDTO.setUserId(userId);
		addressService.insertAddress(addressDTO);
		System.out.println("insertAddress2"+addressDTO.getAddress());
		return "redirect:/order/checkout";
	}

	// 회원정보수정 - 배송지관리 - 배송지수정
	@RequestMapping(value = "/order/updateAddressPro", method = RequestMethod.POST)
	public String updateAddressPro(AddressDTO addressDTO, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		addressDTO.setUserId(userId);
		addressService.updateAddress(addressDTO);

		return "redirect:/mypage/addr";
	}
	
	// 주문페이지 - 배송지수정
	@RequestMapping(value = "/order/updateAddressPro2", method = RequestMethod.POST)
	public String updateAddressPro2(AddressDTO addressDTO, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		addressDTO.setUserId(userId);
		addressService.updateAddress(addressDTO);
		
		return "redirect:/order/checkout";
	}
	
	@RequestMapping(value = "/mypage/addr", method = RequestMethod.GET)
	public String userAddress(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");
		AddressDTO addressDTO = addressService.getAddress(userId);
		MemberDTO memberDTO = memberService.getMember(userId);
		model.addAttribute("addressDTO", addressDTO);
		model.addAttribute("memberDTO", memberDTO);
		
		return "mypage/userAddress";
	}

}
