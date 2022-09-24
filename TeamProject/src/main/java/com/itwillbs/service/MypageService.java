package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.MypageDTO;
import com.itwillbs.domain.OrderListDTO;
import com.itwillbs.domain.PageDTO;

public interface MypageService {

	void insertMypage(MypageDTO userId);

	void boardCount(MypageDTO mypageDTO);

	void boardsub(MypageDTO mypageDTO);

	void replysub(MypageDTO mypageDTO);

	void replyCount(MypageDTO mypageDTO);

	MypageDTO mypageselect(MypageDTO mypageDTO);


	// 마이페이지 주문목록
	List<OrderListDTO> getMyOrdList(PageDTO pageDTO);
	// 마이페이지 주문목록 수량
	int getMyOrdListCount(PageDTO pageDTO);

}
