package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.ProdDTO;

public interface ProdService {

	public List<ProdDTO> selectProdList(ProdDTO prodDTO);

	public int selectProdListCnt(ProdDTO prodDTO);

	public ProdDTO selectProdDetail(ProdDTO prodDTO);

	/* 상품 id 이름 */
	public List<ProdDTO> getProdNumName(ProdDTO prodDTO);

	/* 리뷰 등록 */
	public void enrollReply(ProdDTO prodDTO);

	/* 리뷰 존재 체크 */
	public int checkReply(ProdDTO prodDTO);

	/* 리뷰 페이징처리 */
	public List<ProdDTO> selectReplyList(ProdDTO prodDTO);

	public int selectReplyListCnt(ProdDTO prodDTO);

	/* 추천 상품 리스트 */
	public List<ProdDTO> selectProdRelatedList(ProdDTO details);

	/* 메인화면 - 신상품 리스트 */
	public List<ProdDTO> selectProdNewList(ProdDTO prodDTO);

	/* 메인화면 - 많이 팔린 상품 리스트 */
	public List<ProdDTO> selectProdBsList(ProdDTO prodDTO);

}