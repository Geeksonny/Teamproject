package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.CommonDTO;
import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.CouponDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.OrderListDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;

public interface CompService {
	// 상품 신규 등록
	public void insertProd(ProdDTO prodDTO);

	// 상품 리스트
	public List<ProdDTO> getProdList(PageDTO pageDTO);

	// 상품 갯수
	public int getProdCount(PageDTO pageDTO);

	// 상품 개별 정보
	public ProdDTO getProd(String prodLCode);

	// 제품삭제
	public void deleteProd(String prodLCode);

	// 제품 수정
	public void updateProd(ProdDTO prodDTO);

	// 업체 정보
	public CompDTO getComp(CompDTO compDTO);

	// 업체 정보 수정
	public void modComp(CompDTO compDTO);

	// 비밀번호 변경
	public void passMod(CompDTO compDTO) throws Exception;

	// 업체 탈퇴
	public void delComp(CompDTO compDTO);

	// 주문 목록
	public List<OrderListDTO> getOrdList(PageDTO pageDTO);

	// 주문 목록 페이징
	public int getOrdCount(PageDTO pageDTO);

	// 송장번호입력
	public void delivNumberInsert(OrderListDTO orderListDTO);

	// 주문 상태 변경
	public void delivNumberUpdate(OrderListDTO orderListDTO);

	// 미배송/배송완료 수량
	public int getOrdCountDeliv(OrderListDTO orderListDTO);

	// 업체 리스트
	public List<CompDTO> getCompList(PageDTO pageDTO);

	int getCompCount();

	// 업체 삭제
	public void deleteComp(String compId);

	// 총 매출
	public int getTotalsum(OrderListDTO orderListDTO);

	// 품절,품절임박, 양호 상품 갯수
	public OrderListDTO getProdAmount(OrderListDTO orderListDTO);

	// 주문 상세 정보
	public OrderListDTO getOrdListDet(OrderListDTO orderDTO1);

	// 배송취소, 환불완료로 디비수정
	public void refundDeliveryStatusUpdate(OrderListDTO orderListDTO);

	// 물품수량 되돌리기
	public void prodquantityUpdate(OrderListDTO orderListDTO);

	// 포인트 돌려주기
	public void pointUpdate(OrderListDTO orderListDTO);

	// admin 쿠폰 등록
	public void insertCoupon(CouponDTO couponDTO);

	// admin 쿠폰리스트 갖고오기
	public List<CouponDTO> getCouponList(CouponDTO couponDTO);

	// 쿠폰삭제
	public void deleteCoupon(CouponDTO couponDTO);

	// 쿠폰리스트 갯수
	int getCouponListCount(CouponDTO couponDTO);
	//쿠폰 코드
	public CouponDTO getCouponNum(CouponDTO couponDTO);
	// 마이페이지 쿠폰 코드
	public int getMyCouponNum(CouponDTO couponDTO);
}
