package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MypageDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ReplyDTO;
import com.itwillbs.domain.prodLikeDTO;
import com.itwillbs.service.MypageService;
import com.itwillbs.service.ProdLikeService;

@Controller
public class ProdLikeController {

	//媛앹껜�깮�꽦 遺�紐⑥씤�꽣�럹�씠�뒪 = �옄�떇�겢�옒�뒪
	@Inject
	private  ProdLikeService prodLikeService;
	@Inject
	private MypageService mypageService;

	@RequestMapping(value = "/product/likeinsert", method = RequestMethod.GET)
	public String likeinsert(HttpServletRequest request, HttpSession session,Model model) throws Exception {
		String userId = (String)session.getAttribute("userId");
		prodLikeDTO prodLikeDTO = new prodLikeDTO();
		prodLikeDTO.setUserId(userId);
		prodLikeDTO.setProdLCode(request.getParameter("prodLCode"));
		MypageDTO mypageDTO =new MypageDTO();
		mypageDTO.setUserId((String)session.getAttribute("userId"));
		prodLikeDTO prodLikeDTO2 = prodLikeService.prodLikeCheck(prodLikeDTO);
		
		if(userId != null) {
			if(prodLikeDTO2 != null) {
				prodLikeService.deleteProdLike(prodLikeDTO);
				mypageService.productLikesub(mypageDTO);
			}else {
				prodLikeService.inserProdLike(prodLikeDTO);
				mypageService.productLike(mypageDTO);
			}
		}else {
			return"/product/msg";
		}
		

		return "redirect:/product/shop";
	}
	@RequestMapping(value = "/product/detailsLike", method = RequestMethod.GET)
	public String likedetails(HttpServletRequest request, HttpSession session,Model model, ProdDTO prodDTO) throws Exception {
		int prodLNum=Integer.parseInt(request.getParameter("prodLNum"));
		String userId = (String)session.getAttribute("userId");
		prodLikeDTO prodLikeDTO = new prodLikeDTO();
		prodLikeDTO.setUserId(userId);
		prodLikeDTO.setProdLCode(request.getParameter("prodLCode"));
		MypageDTO mypageDTO =new MypageDTO();
		mypageDTO.setUserId((String)session.getAttribute("userId"));
		prodLikeDTO prodLikeDTO2 = prodLikeService.prodLikeCheck(prodLikeDTO);
		
		if(userId != null) {
			if(prodLikeDTO2 != null) {
				prodLikeService.deleteProdLike(prodLikeDTO);
				mypageService.productLikesub(mypageDTO);
			}else {
				prodLikeService.inserProdLike(prodLikeDTO);
				mypageService.productLike(mypageDTO);
			}
		}else {
			return"/product/msg";
		}
		model.addAttribute("prodLNum", prodLNum);

		return "redirect:/product/details";
	}
	
	
	@RequestMapping(value = "/main/likeinsert2", method = RequestMethod.GET)
	public String likeinsert2(HttpServletRequest request, HttpSession session,Model model) throws Exception {
		String userId = (String)session.getAttribute("userId");
		prodLikeDTO prodLikeDTO = new prodLikeDTO();
		prodLikeDTO.setUserId(userId);
		prodLikeDTO.setProdLCode(request.getParameter("prodLCode"));
		MypageDTO mypageDTO =new MypageDTO();
		mypageDTO.setUserId((String)session.getAttribute("userId"));
		prodLikeDTO prodLikeDTO2 = prodLikeService.prodLikeCheck(prodLikeDTO);
		
		if(userId != null) {
			if(prodLikeDTO2 != null) {
				prodLikeService.deleteProdLike(prodLikeDTO);
				mypageService.productLikesub(mypageDTO);
			}else {
				prodLikeService.inserProdLike(prodLikeDTO);
				mypageService.productLike(mypageDTO);
			}
		}else {
			return"/product/msg";
		}
		

		return "redirect:/main/main";
	}


}
