package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MypageDAO;
import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.CouponDTO;
import com.itwillbs.domain.MypageDTO;
import com.itwillbs.domain.OrderListDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProdDTO;

@Service
public class MypageServiceImpl implements MypageService {

	@Inject
	private MypageDAO mypageDAO;

	@Override
	public void insertMypage(MypageDTO userId) {
		mypageDAO.insertMypage(userId);

	}

	@Override
	public void boardCount(MypageDTO mypageDTO) {
		mypageDAO.boardCount(mypageDTO);

	}

	@Override
	public void boardsub(MypageDTO mypageDTO) {
		mypageDAO.boardsub(mypageDTO);

	}

	@Override
	public void replysub(MypageDTO mypageDTO) {
		mypageDAO.replysub(mypageDTO);
	}

	@Override
	public void replyCount(MypageDTO mypageDTO) {
		mypageDAO.replyCount(mypageDTO);
	}

	@Override
	public void productLikesub(MypageDTO mypageDTO) {
		mypageDAO.productLikesub(mypageDTO);
	}

	@Override
	public void productLike(MypageDTO mypageDTO) {
		mypageDAO.productLike(mypageDTO);
	}

	@Override
	public MypageDTO mypageselect(MypageDTO mypageDTO) {
		return mypageDAO.mypageselect(mypageDTO);

	}

	@Override
	public List<BoardDTO> getBoardList(BoardDTO boardDTO) {
		// pageSize  pageNum  currentPage
				int startRow=(boardDTO.getCurrentPage()-1)*boardDTO.getPageSize()+1;
				int endRow=startRow+boardDTO.getPageSize()-1;

				// sql => limit #{startRow -1}, #{pageSize}

				boardDTO.setStartRow(startRow-1);
				boardDTO.setEndRow(endRow);

				return mypageDAO.getBoardList(boardDTO);
	}

	@Override
	public int getBoardCount() {
		return mypageDAO.getBoardCount();
	}

	@Override
	public List<BoardDTO> getBoardLikeList(BoardDTO boardDTO) {
		// pageSize  pageNum  currentPage
		int startRow=(boardDTO.getCurrentPage()-1)*boardDTO.getPageSize()+1;
		int endRow=startRow+boardDTO.getPageSize()-1;

		// sql => limit #{startRow -1}, #{pageSize}

		boardDTO.setStartRow(startRow-1);
		boardDTO.setEndRow(endRow);

		return mypageDAO.getBoardLikeList(boardDTO);
	}

	@Override
	public List<ProdDTO> getPordLikeList(ProdDTO prodDTO) {
		// pageSize  pageNum  currentPage
				int startRow=(prodDTO.getCurrentPage()-1)*prodDTO.getPageSize()+1;
				int endRow=startRow+prodDTO.getPageSize()-1;

				// sql => limit #{startRow -1}, #{pageSize}

				prodDTO.setStartRow(startRow-1);
				prodDTO.setEndRow(endRow);

				return mypageDAO.getPordLikeList(prodDTO);
	}
	// ���������� �ֹ����
		@Override
		public List<OrderListDTO> getOrdList(PageDTO pageDTO) {
			// pageSize  pageNum  currentPage
			int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			int endRow=startRow+pageDTO.getPageSize()-1;

			// sql => limit #{startRow -1}, #{pageSize}

			pageDTO.setStartRow(startRow-1);
			pageDTO.setEndRow(endRow);
			return mypageDAO.getOrdList(pageDTO);
		}

		@Override
		public int getMyOrdListCount(PageDTO pageDTO) {
			return mypageDAO.getMyOrdListCount(pageDTO);
		}
		// 마이페이지 쿠폰 리스트
		@Override
		public List<CouponDTO> getMyCouponList(CouponDTO couponDTO) {
			int startRow=(couponDTO.getCurrentPage()-1)*couponDTO.getPageSize()+1;
			int endRow=startRow+couponDTO.getPageSize()-1;
			couponDTO.setStartRow(startRow-1);
			couponDTO.setEndRow(endRow);
			return mypageDAO.getMyCouponList(couponDTO);
		}
		// 마이페이지 쿠폰 등록
		@Override
		public void insertMyCoupon(CouponDTO couponDTO) {
			couponDTO.setCouDate(new Timestamp(System.currentTimeMillis()));
			mypageDAO.insertMyCoupon(couponDTO);
		}
		// 마이페이지 페이징처리
		@Override
		public int getMyCouponListCount(CouponDTO couponDTO) {
			return mypageDAO.getMyCouponListCount(couponDTO);
		}

		// 주문취소 시 상태변경
		@Override
		public void updateOrderStatus(OrderListDTO orderListDTO) {
			mypageDAO.updateOrderStatus(orderListDTO);
		}
		// 주문취소 시 ORD_NUM 정보확인
		@Override
		public OrderListDTO numCheck(int ordNum) {
			return mypageDAO.numCheck(ordNum);
		}
		// 주문확정
		@Override
		public void updateOrderFin(OrderListDTO orderListDTO) {
			mypageDAO.updateOrderFin(orderListDTO);
		}

}
