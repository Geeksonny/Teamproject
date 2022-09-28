package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.CompDAO;
import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.CouponDTO;
import com.itwillbs.domain.OrderListDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;

@Service
public class CompServiceImpl implements CompService {
	@Inject
	private CompDAO compDAO;

	// 상품등록
	@Override
	public void insertProd(ProdDTO prodDTO) {
		prodDTO.setProdLUploaddate(new Timestamp(System.currentTimeMillis()));

		compDAO.insertProd(prodDTO);
	}

	// 상품게시판list
	@Override
	public List<ProdDTO> getProdList(PageDTO pageDTO) {
		// pageSize pageNum currentPage
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;

		// sql => limit #{startRow -1}, #{pageSize}

		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);

		return compDAO.getProdList(pageDTO);
	}

	// 상품 수량
	@Override
	public int getProdCount(PageDTO pageDTO) {
		return compDAO.getProdCount(pageDTO);
	}

	// 개별 상품 정보
	@Override
	public ProdDTO getProd(String prodLCode) {
		return compDAO.getProd(prodLCode);
	}

	// 상품삭제
	@Override
	public void deleteProd(String prodLCode) {
		compDAO.deleteProd(prodLCode);
	}

	// 상품 수정
	@Override
	public void updateProd(ProdDTO prodDTO) {
		compDAO.updateProd(prodDTO);
	}

	// 업체 정보 갖고 오기
	@Override
	public CompDTO getComp(CompDTO compDTO) {
		return compDAO.getComp(compDTO);
	}

	// 업체 정보 수정
	@Override
	public void modComp(CompDTO compDTO) {
		compDAO.modComp(compDTO);
	}

	// 업체 비밀번호 변경
	@Override
	public void passMod(CompDTO compDTO) throws Exception {
		compDAO.passMod(compDTO);
	}

	// 업체 탈퇴
	@Override
	public void delComp(CompDTO compDTO) {
		compDAO.delComp(compDTO);
	}

	@Override
	public List<OrderListDTO> getOrdList(PageDTO pageDTO) {
		// pageSize pageNum currentPage
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;

		// sql => limit #{startRow -1}, #{pageSize}

		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		return compDAO.getOrdList(pageDTO);
	}

	@Override
	public int getOrdCount(PageDTO pageDTO) {

		return compDAO.getOrdCount(pageDTO);
	}

	// 송장번호 입력
	@Override
	public void delivNumberInsert(OrderListDTO orderListDTO) {
		compDAO.delivNumberInsert(orderListDTO);
	}

	// 배송상태 변경
	@Override
	public void delivNumberUpdate(OrderListDTO orderListDTO) {
		compDAO.delivNumberUpdate(orderListDTO);
	}

	// 미배송/배송완료 수량
	@Override
	public int getOrdCountDeliv(OrderListDTO orderListDTO) {
		return compDAO.getOrdCountMain(orderListDTO);
	}

	// 총매출
	@Override
	public int getTotalsum(OrderListDTO orderListDTO) {
		return compDAO.getTotalsum(orderListDTO);
	}

	@Override
	public OrderListDTO getProdAmount(OrderListDTO orderListDTO) {
		return compDAO.getProdAmount(orderListDTO);
	}

	// 업체 리스트
	@Override
	public List<CompDTO> getCompList(PageDTO pageDTO) {
		// pageSize pageNum currentPage
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;

		// sql => limit #{startRow -1}, #{pageSize}

		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		return compDAO.getCompList(pageDTO);
	}

	@Override
	public int getCompCount() {
		return compDAO.getCompCount();
	}

	// 업체 삭제
	@Override
	public void deleteComp(String compId) {
		compDAO.deleteComp(compId);

	}

	// 주문 상세 정보
	@Override
	public OrderListDTO getOrdListDet(OrderListDTO orderDTO1) {

		return compDAO.getOrdListDet(orderDTO1);
	}

	// 배송취소, 환불완료로 디비수정
	@Override
	public void refundDeliveryStatusUpdate(OrderListDTO orderListDTO) {
		compDAO.refundDeliveryStatusUpdate(orderListDTO);

	}

	// 물품수량 되돌리기
	@Override
	public void prodquantityUpdate(OrderListDTO orderListDTO) {
		compDAO.prodquantityUpdate(orderListDTO);

	}

	// 포인트 돌려주기
	@Override
	public void pointUpdate(OrderListDTO orderListDTO) {
		compDAO.pointUpdate(orderListDTO);

	}

	// admin 쿠폰 등록
	@Override
	public void insertCoupon(CouponDTO couponDTO) {
		couponDTO.setCouInfoDate(new Timestamp(System.currentTimeMillis()));

		compDAO.insertCoupon(couponDTO);
	}

	// admin 쿠폰리스트 갖고오기
	@Override
	public List<CouponDTO> getCouponList(CouponDTO couponDTO) {
		int startRow = (couponDTO.getCurrentPage() - 1) * couponDTO.getPageSize() + 1;
		int endRow = startRow + couponDTO.getPageSize() - 1;
		couponDTO.setStartRow(startRow - 1);
		couponDTO.setEndRow(endRow);
		return compDAO.getCouponList(couponDTO);
	}

	// admin 쿠폰 삭제
	@Override
	public void deleteCoupon(CouponDTO couponDTO) {
		compDAO.deleteCoupon(couponDTO);
	}

	// admin 쿠폰리스스 갯수
	@Override
	public int getCouponListCount(CouponDTO couponDTO) {
		return compDAO.getCouponListCount(couponDTO);
	}
	// 쿠폰 코드갖고오기
	@Override
	public CouponDTO getCouponNum(CouponDTO couponDTO) {
		return compDAO.getCouponNum(couponDTO);
	}

	@Override
	public int getMyCouponNum(CouponDTO couponDTO) {
		return compDAO.getMyCouponNum(couponDTO);
	}

}
