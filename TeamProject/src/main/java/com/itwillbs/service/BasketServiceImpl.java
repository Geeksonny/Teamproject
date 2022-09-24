package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BasketDAO;
import com.itwillbs.domain.BasketDTO;
import com.itwillbs.domain.CouponDTO;

@Service
public class BasketServiceImpl implements BasketService {
	@Inject
	private BasketDAO basketDAO;

	@Override // 유저체크
	public BasketDTO getMemberchk(BasketDTO basketDTO) {

		return basketDAO.getMemberchk(basketDTO);
	}

	@Override // 메인에서 카트로 인서트
	public void insertBasket(BasketDTO basketDTO) {
		basketDTO.setShoppingBasketDate(new Timestamp(System.currentTimeMillis()));
		basketDAO.insertBasket(basketDTO);
	}

	@Override // 디비에서 카트물건리스트 갖고오기
	public List<BasketDTO> getBasketList(BasketDTO basketDTO) {

		return basketDAO.getBasketList(basketDTO);
	}

//	@Override // 주문 디비에 인서트
//	public void insertOrder(BasketDTO basketDTO) {
//		basketDTO.setShoppingBasketDate(new Timestamp(System.currentTimeMillis()));
//		basketDAO.insertOrder(basketDTO);
//	}
//
	@Override // 카트에 물건 삭제
	public void deleteBasket(BasketDTO basketDTO) {
		basketDAO.deleteBasket(basketDTO);

	}

	@Override //중복 물건 담겼는지 검사
	public BasketDTO prodCodeCheck(BasketDTO basketDTO) {
		return basketDAO.prodCodeCheck(basketDTO);
	}

	@Override
	public void updateBasket(BasketDTO basketDTO) {
		basketDAO.updateBasket(basketDTO);

	}

	@Override
	public List<CouponDTO> selectCouponList(CouponDTO couponDTO) {

		return basketDAO.selectCouponList(couponDTO);
	}

}
