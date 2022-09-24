package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BasketDTO;
import com.itwillbs.domain.CouponDTO;

@Repository
public class BasketDAOImpl implements BasketDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.itwillbs.mappers.basketMapper";

	@Override // 유저체크
	public BasketDTO getMemberchk(BasketDTO basketDTO) {
		return sqlSession.selectOne(namespace + ".getUser", basketDTO);
	}

	@Override // 메인에서 카트로 인서트
	public void insertBasket(BasketDTO basketDTO) {
		sqlSession.insert(namespace + ".insertBasket", basketDTO);
	}

	@Override // 디비에서 카트물건리스트 갖고오기
	public List<BasketDTO> getBasketList(BasketDTO basketDTO) {

		return sqlSession.selectList(namespace+".getBasketList",basketDTO);
	}

//	@Override // 주문 디비에 인서트
//	public void insertOrder(BasketDTO basketDTO) {
//		sqlSession.insert(namespace + ".insertOrder", basketDTO);
//	}
//
	@Override // 카트에 물건 삭제
	public void deleteBasket(BasketDTO basketDTO) {
		sqlSession.delete(namespace+".deleteBasket", basketDTO);
	}

	@Override // 중복물건이 담겼는지 검사
	public BasketDTO prodCodeCheck(BasketDTO basketDTO) {
		return sqlSession.selectOne(namespace + ".prodCodeCheck", basketDTO);
	}
	// 수량변경 디비 저장
	@Override
	public void updateBasket(BasketDTO basketDTO) {
		sqlSession.update(namespace + ".updateBasket", basketDTO);
	}
	// 쿠폰 갖고오기
	@Override
	public List<CouponDTO> selectCouponList(CouponDTO couponDTO) {
		return sqlSession.selectList(namespace+".selectCouponList",couponDTO);
	}



}
