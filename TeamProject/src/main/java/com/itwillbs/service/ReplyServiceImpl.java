package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BoardDAO;
import com.itwillbs.dao.ReplyDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Inject
	public ReplyDAO replyDAO;
	
	@Inject
	public BoardDAO boardDAO;

	@Override
	public void insetreply(ReplyDTO replyDTO) {
		if(replyDAO.getMaxNum()==null) {
			//게시판 글이 없음
			replyDTO.setrNum(1);
		}else {
			replyDTO.setrNum(replyDAO.getMaxNum() + 1);
		}
		
		replyDAO.insetreply(replyDTO);
		
	}

	@Override
	public List<ReplyDTO> getReplyList(PageDTO pageDTO) {
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		// sql => limit #{startRow -1}, #{pageSize}
		
		pageDTO.setStartRow(startRow-1);
		pageDTO.setEndRow(endRow);
		System.out.println("ReplyServiceImpl.getReplyList");
		return replyDAO.getReplyList(pageDTO);
	}

	@Override
	public int getReplyCount(int rNum) {
		return replyDAO.getReplyCount(rNum);
	}

	@Override
	public void Replydelete(ReplyDTO replyDTO) {
		System.out.println("ReplyDAOImpl.Replydelete");
		replyDAO.Replydelete(replyDTO);
		
	}

	@Override
	public ReplyDTO rNumCheck(ReplyDTO replyDTO) {
		
		// TODO Auto-generated method stub
		return replyDAO.rNumCheck(replyDTO);
	}

	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return replyDAO.userCheck(memberDTO);
	}

	
	

	
	
	
}
