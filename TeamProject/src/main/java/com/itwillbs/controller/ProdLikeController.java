package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MypageDTO;
import com.itwillbs.domain.ReplyDTO;
import com.itwillbs.domain.prodLikeDTO;
import com.itwillbs.service.ProdLikeService;

@Controller
public class ProdLikeController {

	//객체생성 부모인터페이스 = 자식클래스
	@Inject
	private  ProdLikeService prodLikeService;


	@RequestMapping(value = "/product/likeinsert", method = RequestMethod.GET)
	public String likeinsert(HttpServletRequest request, HttpSession session,Model model) throws Exception {
		String userId = (String)session.getAttribute("userId");
		prodLikeDTO prodLikeDTO = new prodLikeDTO();
		prodLikeDTO.setUserId(userId);
		prodLikeDTO.setProdLCode(request.getParameter("prodLCode"));
		
		prodLikeDTO prodLikeDTO2 = prodLikeService.prodLikeCheck(prodLikeDTO);
		
		if(userId != null) {
			if(prodLikeDTO2 == null) {
				prodLikeService.inserProdLike(prodLikeDTO);
			}else {
				prodLikeService.deleteProdLike(prodLikeDTO);
			}
		}else {
			return"/notlogin/msg4";
		}
		

		return "redirect:/product/shop";
	}


}
