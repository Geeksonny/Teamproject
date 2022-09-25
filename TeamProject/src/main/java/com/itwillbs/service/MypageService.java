package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.MypageDTO;
import com.itwillbs.domain.OrderListDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProdDTO;

public interface MypageService {

	void insertMypage(MypageDTO userId);

	void boardCount(MypageDTO mypageDTO);

	void boardsub(MypageDTO mypageDTO);

	void replysub(MypageDTO mypageDTO);

	void replyCount(MypageDTO mypageDTO);

	MypageDTO mypageselect(MypageDTO mypageDTO);

	List<BoardDTO> getBoardList(BoardDTO boardDTO);

	int getBoardCount();

	List<BoardDTO> getBoardLikeList(BoardDTO boardDTO);
	
	List<ProdDTO> getPordLikeList(PageDTO pageDTO);
	// 마이페이지 주문목록
		List<OrderListDTO> getMyOrdList(PageDTO pageDTO);
		// 마이페이지 주문목록 수량
		int getMyOrdListCount(PageDTO pageDTO);


}
