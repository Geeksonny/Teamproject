package com.itwillbs.controller;

import java.lang.System.Logger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.LikeDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.ReplyDTO;
import com.itwillbs.service.LikeService;
import com.itwillbs.service.MypageService;

@Controller
public class LikeController {
	
	@Inject 
	private  LikeService likeService;
	
	@Inject
	private MypageService mypageService;
	
	@RequestMapping(value = "/board/likeinset", method = RequestMethod.GET)
	public String likeinset(HttpServletRequest request, HttpSession session, Model model) {
		
		int boardNum=Integer.parseInt(request.getParameter("boardNum"));
		LikeDTO likeDTO=new LikeDTO();
		likeDTO.setBoardNum(boardNum);
		likeDTO.setUserId((String)session.getAttribute("userId"));
		BoardDTO boardDTO=new BoardDTO();
		boardDTO.setBoardNum(boardNum);
		
		List<LikeDTO> likeList = likeService.getLikeList(likeDTO);
		LikeDTO likeDTO2=likeService.likeCheck(likeDTO);
		
		
		
		if(likeDTO2 != null) {
			likeService.deleteLike(likeDTO);
			likeService.updateLikeCancel(boardDTO);
		}else{
			likeService.insertLike(likeDTO);
			likeService.updateLike(boardDTO);
		}
		
		
		model.addAttribute("likeList",likeList);
		return "redirect:/board/content?boardNum="+boardNum;
	}
	
	
}
