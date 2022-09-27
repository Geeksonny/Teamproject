package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.CouponDTO;
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

	void productLikesub(MypageDTO mypageDTO);

	void productLike(MypageDTO mypageDTO);


	MypageDTO mypageselect(MypageDTO mypageDTO);

	List<BoardDTO> getBoardList(BoardDTO boardDTO);

	int getBoardCount();

	List<BoardDTO> getBoardLikeList(BoardDTO boardDTO);

	List<ProdDTO> getPordLikeList(ProdDTO prodDTO);
	// ���������� �ֹ����
		List<OrderListDTO> getOrdList(PageDTO pageDTO);
		// ���������� �ֹ���� ����
		int getMyOrdListCount(PageDTO pageDTO);
		// 마이페이지 쿠폰 리스트
		List<CouponDTO> getMyCouponList(CouponDTO couponDTO);
		// 마이페이지 쿠폰 등록
		void insertMyCoupon(CouponDTO couponDTO);
		// 마이페이지 페이징 처리
		int getMyCouponListCount(CouponDTO couponDTO);







}
