package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProdDAO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class ProdServiceImpl implements ProdService{

//	객체생성 부모=자식
	@Inject
	private ProdDAO prodDAO;

	@Override
	public List<ProdDTO> selectProdList(ProdDTO prodDTO) {
		int startRow=(prodDTO.getCurrentPage()-1)*prodDTO.getPageSize()+1;
		int endRow=startRow+prodDTO.getPageSize()-1;

		prodDTO.setStartRow(startRow-1);
		prodDTO.setEndRow(endRow);

		return prodDAO.selectProdList(prodDTO);
	}

	@Override
	public int selectProdListCnt(ProdDTO prodDTO) {
		int startRow=(prodDTO.getCurrentPage()-1)*prodDTO.getPageSize()+1;
		int endRow=startRow+prodDTO.getPageSize()-1;

		prodDTO.setStartRow(startRow-1);
		prodDTO.setEndRow(endRow);

		return prodDAO.selectProdListCnt(prodDTO);
	}

	@Override
	public ProdDTO selectProdDetail(ProdDTO prodDTO) {
		return prodDAO.selectProdDetail(prodDTO);
	}

	/* 상품 id 이름 */
	@Override
	public List<ProdDTO> getProdNumName(ProdDTO prodDTO) {
		return prodDAO.getProdNumName(prodDTO);
	}

	/* 댓글 등록 */
	@Override
	public void enrollReply(ProdDTO prodDTO) {
		prodDAO.enrollReply(prodDTO);
	}

	/* 댓글 존재 체크 */
	@Override
	public int checkReply(ProdDTO prodDTO) {
		return prodDAO.checkReply(prodDTO);
	}

	/* 추천 상품 리스트 */
	@Override
	public List<ProdDTO> selectProdRelatedList(ProdDTO details) {
		return prodDAO.selectProdRelatedList(details);
	}

	/* 메인화면 - 신상품 리스트 */
	@Override
	public List<ProdDTO> selectProdNewList(ProdDTO prodDTO) {
		return prodDAO.selectProdNewList(prodDTO);
	}

	/* 메인화면 - 많이 팔린 상품 리스트 */
	@Override
	public List<ProdDTO> selectProdBsList(ProdDTO prodDTO) {
		return prodDAO.selectProdBsList(prodDTO);
	}

}