package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.OrderListDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;


@Repository
public class CompDAOImpl implements CompDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.compMapper";
	// 상품 신규등록
	@Override
	public void insertProd(ProdDTO prodDTO) {
		// 마이바티스 메서드 호출
		sqlSession.insert(namespace + ".insertProd", prodDTO);
	}
	// 개별 상품 정보
	@Override
	public ProdDTO getProd(String prodLCode) {
		return sqlSession.selectOne(namespace+".getProd", prodLCode);
	}
	// 상품 리스트
	@Override
	public List<ProdDTO> getProdList(PageDTO pageDTO) {

		return sqlSession.selectList(namespace+".getProdList",pageDTO);
	}
	// 상품 수량
	@Override
	public int getProdCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace+".getProdCount",pageDTO);
	}
	// 상품 삭제
	@Override
	public void deleteProd(String prodLCode) {
		sqlSession.delete(namespace+".deleteProd", prodLCode);
	}
	// 상품 수정
	@Override
	public void updateProd(ProdDTO prodDTO) {
		sqlSession.update(namespace + ".updateProd", prodDTO);
	}

	// 아이디 일치하면 업체 정보 갖고오기
	@Override
	public CompDTO getComp(CompDTO compDTO) {
		return sqlSession.selectOne(namespace + ".getComp", compDTO);
	}
	// 업체 정보수정
	@Override
	public void modComp(CompDTO compDTO) {
		sqlSession.update(namespace + ".modComp", compDTO);
	}
	// 업체 탈퇴
	@Override
	public void delComp(CompDTO compDTO) {
		sqlSession.delete(namespace + ".delComp", compDTO);
	}
	// 비밀번호 변경 동작
	@Override
	public void passMod(CompDTO compDTO) throws Exception {
		sqlSession.update(namespace + ".passMod", compDTO);

	}
	// 주문리스트
	@Override
	public List<OrderListDTO> getOrdList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getOrdList",pageDTO);
	}
	// 주문목록 갯수
	@Override
	public int getOrdCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace+".getOrdCount",pageDTO);
	}
	// 송장번호 입력
	@Override
	public void delivNumberInsert(OrderListDTO orderListDTO) {
		sqlSession.insert(namespace + ".delivNumberInsert", orderListDTO);
	}
	// 배송 상태 변경
	@Override
	public void delivNumberUpdate(OrderListDTO orderListDTO) {
		System.out.println("delivNumberUpdate : " + orderListDTO.getOrdDeliveryStatus());
		sqlSession.update(namespace + ".delivNumberUpdate", orderListDTO);
	}
	// 미배송/배송완료 수량
	@Override
	public int getOrdCountMain(OrderListDTO orderListDTO) {
		return sqlSession.selectOne(namespace+".getOrdCountMain",orderListDTO);
	}
	// 업체 리스트
	@Override
	public List<CompDTO> getCompList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getCompList", pageDTO);
	}
	@Override
	public int getCompCount() {
		return sqlSession.selectOne(namespace + ".getCompCount");
	}
	// 업체 삭제
	@Override
	public void deleteComp(String compId) {
		sqlSession.update(namespace + ".deleteComp", compId);

	}
	//총 매출
	@Override
	public int getTotalsum(OrderListDTO orderListDTO) {
		return sqlSession.selectOne(namespace+".getTotalsum",orderListDTO);
	}
	// 품절,품절임박, 양호 상품 갯수
//	@Override
//	public List<OrderListDTO> getProdAmount(OrderListDTO orderListDTO) {
//		return sqlSession.selectList(namespace+".getProdAmount",orderListDTO);
//	}
	@Override
	public OrderListDTO getProdAmount(OrderListDTO orderListDTO) {
		return sqlSession.selectOne(namespace + ".getProdAmount", orderListDTO);
	}
	// 주문상세정보
	@Override
	public OrderListDTO getOrdListDet(OrderListDTO orderDTO1) {
		return sqlSession.selectOne(namespace+".getOrdListDet",orderDTO1);
	}
	// 배송취소, 환불완료로 디비수정
	@Override
	public void refundDeliveryStatusUpdate(OrderListDTO orderListDTO) {
		sqlSession.update(namespace + ".refundDeliveryStatusUpdate", orderListDTO);

	}

	// 물품수량 되돌리기
	@Override
	public void prodquantityUpdate(OrderListDTO orderListDTO) {
		sqlSession.update(namespace + ".prodquantityUpdate", orderListDTO);

	}
	@Override
	public void pointUpdate(OrderListDTO orderListDTO) {
		sqlSession.update(namespace + ".pointUpdate", orderListDTO);
	}



}
