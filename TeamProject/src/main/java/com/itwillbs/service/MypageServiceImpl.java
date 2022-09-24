package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MypageDAO;
import com.itwillbs.domain.MypageDTO;
import com.itwillbs.domain.OrderListDTO;
import com.itwillbs.domain.PageDTO;

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
	public MypageDTO mypageselect(MypageDTO mypageDTO) {
		return mypageDAO.mypageselect(mypageDTO);

	}
	// 마이페이지 주문목록
	@Override
	public List<OrderListDTO> getMyOrdList(PageDTO pageDTO) {
		// pageSize  pageNum  currentPage
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;

		// sql => limit #{startRow -1}, #{pageSize}

		pageDTO.setStartRow(startRow-1);
		pageDTO.setEndRow(endRow);
		return mypageDAO.getMyOrdList(pageDTO);
	}

	@Override
	public int getMyOrdListCount(PageDTO pageDTO) {
		return mypageDAO.getMyOrdListCount(pageDTO);
	}


}
