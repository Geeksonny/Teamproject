package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReplyDTO;

public interface ReplyService {



	void insetreply(ReplyDTO replyDTO);

	List<ReplyDTO> getReplyList(PageDTO pageDTO);

	int getReplyCount(int rNum);

	void Replydelete(ReplyDTO replyDTO);

	ReplyDTO rNumCheck(ReplyDTO replyDTO);

	MemberDTO userCheck(MemberDTO memberDTO);


}
