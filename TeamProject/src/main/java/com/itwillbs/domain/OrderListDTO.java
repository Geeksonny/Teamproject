package com.itwillbs.domain;

import java.sql.Timestamp;

public class OrderListDTO extends OrderDTO{
	private OrderDTO orderDTO;
	private int trnum;
	private int ordNum;
	private String ordLCode; 			// 상품코드
	private String ordLProdnm; 			// 상품이름
	private String ordLUser; 			// 주문자 아이디
	private String ordLUserNm; 			// 주문자 이름
	private String compNm; 				// 회사 이름


	private int ordLNum;				// 주문번호		
	private int ordLQuantity; 			// 주문수량
	private int ordLPrice;    			// 개별가격
	private Timestamp ordLDate;
	private String compId;			 	// 회사아이디
	private String ordDeliveryStatus;	// 배송상태
	private int individualPrice;	 	// 개별물품 총합
	
	private String ordLDelivNumber;   	//운송장 번호
	private int count;
	private String ordPurchasestatus;	//구매상태

	private String ge50Count; 			//50개이상 상품수량
	private String ne50Count; 			//50개 미만 상품수량
	private String eq50Couunt; 			// 0개 상품 수량
	private String ordLCouponnum; 		//사용 쿠폰 넘버
	private String ordRefund; 			//환불 여부

	public int getTrnum() {
		return trnum;
	}
	public void setTrnum(int trnum) {
		this.trnum = trnum;
	}
	public int getNum() {
		return ordNum;
	}
	public void setNum(int num) {
		this.ordNum = num;
	}
	public String getOrdLCode() {
		return ordLCode;
	}
	public void setOrdLCode(String ordLCode) {
		this.ordLCode = ordLCode;
	}
	public String getOrdLUser() {
		return ordLUser;
	}
	public void setOrdLUser(String ordLUser) {
		this.ordLUser = ordLUser;
	}
	public int getOrdLQuantity() {
		return ordLQuantity;
	}
	public void setOrdLQuantity(int ordLQuantity) {
		this.ordLQuantity = ordLQuantity;
	}
	public int getOrdLPrice() {
		return ordLPrice;
	}
	public void setOrdLPrice(int ordLPrice) {
		this.ordLPrice = ordLPrice;
	}

	public Timestamp getOrdLDate() {
		return ordLDate;
	}
	public void setOrdLDate(Timestamp ordLDate) {
		this.ordLDate = ordLDate;
	}
	public String getCompId() {
		return compId;
	}
	public void setCompId(String compId) {
		this.compId = compId;
	}
	public String getOrdDeliveryStatus() {
		return ordDeliveryStatus;
	}
	public void setOrdDeliveryStatus(String ordDeliveryStatus) {
		this.ordDeliveryStatus = ordDeliveryStatus;
	}
	

	public String getOrdLDelivNumber() {
		return ordLDelivNumber;
	}
	public void setOrdLDelivNumber(String ordLDelivNumber) {
		this.ordLDelivNumber = ordLDelivNumber;
	}

	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

	public String getOrdPurchasestatus() {
		return ordPurchasestatus;
	}
	public void setOrdPurchasestatus(String ordPurchasestatus) {
		this.ordPurchasestatus = ordPurchasestatus;
	}


	public String getGe50Count() {
		return ge50Count;
	}
	public void setGe50Count(String ge50Count) {
		this.ge50Count = ge50Count;
	}
	public String getNe50Count() {
		return ne50Count;
	}
	public void setNe50Count(String ne50Count) {
		this.ne50Count = ne50Count;
	}
	public String getEq50Couunt() {
		return eq50Couunt;
	}
	public void setEq50Couunt(String eq50Couunt) {
		this.eq50Couunt = eq50Couunt;
	}

	public String getOrdLCouponnum() {
		return ordLCouponnum;
	}
	public void setOrdLCouponnum(String ordLCouponnum) {
		this.ordLCouponnum = ordLCouponnum;
	}
	public String getOrdLUserNm() {
		return ordLUserNm;
	}
	public void setOrdLUserNm(String ordLUserNm) {
		this.ordLUserNm = ordLUserNm;
	}
	public int getOrdNum() {
		return ordNum;
	}
	public void setOrdNum(int ordNum) {
		this.ordNum = ordNum;
	}

	public String getOrdLProdnm() {
		return ordLProdnm;
	}
	public void setOrdLProdnm(String ordLProdnm) {
		this.ordLProdnm = ordLProdnm;
	}
	public String getCompNm() {
		return compNm;
	}
	public void setCompNm(String compNm) {
		this.compNm = compNm;
	}

	public String getOrdRefund() {
		return ordRefund;
	}
	public void setOrdRefund(String ordRefund) {
		this.ordRefund = ordRefund;
	}
	public int getIndividualPrice() {
		return individualPrice;
	}
	public void setIndividualPrice(int individualPrice) {
		this.individualPrice = individualPrice;
	}
	public int getOrdLNum() {
		return ordLNum;
	}
	public void setOrdLNum(int ordLNum) {
		this.ordLNum = ordLNum;
	}
	public OrderDTO getOrderDTO() {
		return orderDTO;
	}
	public void setOrderDTO(OrderDTO orderDTO) {
		this.orderDTO = orderDTO;
	}
	@Override
	public String toString() {
		return "OrderListDTO [orderDTO=" + orderDTO + ", trnum=" + trnum + ", ordNum=" + ordNum + ", ordLCode="
				+ ordLCode + ", ordLProdnm=" + ordLProdnm + ", ordLUser=" + ordLUser + ", ordLUserNm=" + ordLUserNm
				+ ", compNm=" + compNm + ", ordLNum=" + ordLNum + ", ordLQuantity=" + ordLQuantity + ", ordLPrice="
				+ ordLPrice + ", ordLDate=" + ordLDate + ", compId=" + compId + ", ordDeliveryStatus="
				+ ordDeliveryStatus + ", individualPrice=" + individualPrice + ", ordLDelivNumber=" + ordLDelivNumber
				+ ", count=" + count + ", ordPurchasestatus=" + ordPurchasestatus + ", ge50Count=" + ge50Count
				+ ", ne50Count=" + ne50Count + ", eq50Couunt=" + eq50Couunt + ", ordLCouponnum=" + ordLCouponnum
				+ ", ordRefund=" + ordRefund + "]";
	}
	


}
