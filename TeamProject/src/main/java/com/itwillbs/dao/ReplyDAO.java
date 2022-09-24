package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReplyDTO;

public interface ReplyDAO {

	void insetreply(ReplyDTO replyDTO);


	List<ReplyDTO> getReplyList(PageDTO pageDTO);


	int getReplyCount(int rNum);


	Integer getMaxNum();


	void Replydelete(ReplyDTO replyDTO);


	ReplyDTO rNumCheck(ReplyDTO replyDTO);


	MemberDTO userCheck(MemberDTO memberDTO);

	


		
	

}
