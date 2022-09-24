package com.itwillbs.domain;


public class OrderDTO {
	private int num;
	
	private String ordUser;
	private String ordGetNm;
	private String ordGetAddress;
	private String ordGetZipcode;
	private String ordGetPhone;
	private String ordDeliveryMessage;
	private String ordPayment;
	private int ordTotalPrice;
	private int ordSavedpoint;
	private int ordCouponDc;
	private int ordUsepoint;
	private int ordFinalPrice;
	private String ordPurchaseStatus;
	private int ordDeliveryPrice;
	

	
	
	public String getOrdGetZipcode() {
		return ordGetZipcode;
	}
	public void setOrdGetZipcode(String ordGetZipcode) {
		this.ordGetZipcode = ordGetZipcode;
	}
	public String getOrdUser() {
		return ordUser;
	}
	public void setOrdUser(String ordUser) {
		this.ordUser = ordUser;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getOrdGetNm() {
		return ordGetNm;
	}
	public void setOrdGetNm(String ordGetNm) {
		this.ordGetNm = ordGetNm;
	}
	public String getOrdGetAddress() {
		return ordGetAddress;
	}
	public void setOrdGetAddress(String ordGetAddress) {
		this.ordGetAddress = ordGetAddress;
	}
	
	public String getOrdGetPhone() {
		return ordGetPhone;
	}
	public void setOrdGetPhone(String ordGetPhone) {
		this.ordGetPhone = ordGetPhone;
	}
	public String getOrdDeliveryMessage() {
		return ordDeliveryMessage;
	}
	public void setOrdDeliveryMessage(String ordDeliveryMessage) {
		this.ordDeliveryMessage = ordDeliveryMessage;
	}

	public String getOrdPayment() {
		return ordPayment;
	}
	public void setOrdPayment(String ordPayment) {
		this.ordPayment = ordPayment;
	}
	public int getOrdTotalPrice() {
		return ordTotalPrice;
	}
	public void setOrdTotalPrice(int ordTotalPrice) {
		this.ordTotalPrice = ordTotalPrice;
	}
	public int getOrdSavedpoint() {
		return ordSavedpoint;
	}
	public void setOrdSavedpoint(int ordSavedpoint) {
		this.ordSavedpoint = ordSavedpoint;
	}
	public int getOrdCouponDc() {
		return ordCouponDc;
	}
	public void setOrdCouponDc(int ordCouponDc) {
		this.ordCouponDc = ordCouponDc;
	}
	public int getOrdUsepoint() {
		return ordUsepoint;
	}
	public void setOrdUsepoint(int ordUsepoint) {
		this.ordUsepoint = ordUsepoint;
	}
	public int getOrdFinalPrice() {
		return ordFinalPrice;
	}
	public void setOrdFinalPrice(int ordFinalPrice) {
		this.ordFinalPrice = ordFinalPrice;
	}
	public String getOrdPurchaseStatus() {
		return ordPurchaseStatus;
	}
	public void setOrdPurchaseStatus(String ordPurchaseStatus) {
		this.ordPurchaseStatus = ordPurchaseStatus;
	}
	public int getOrdDeliveryPrice() {
		return ordDeliveryPrice;
	}
	public void setOrdDeliveryPrice(int ordDeliveryPrice) {
		this.ordDeliveryPrice = ordDeliveryPrice;
	}
	
	@Override
	public String toString() {
		return "OrderDTO [num=" + num + ", ordUser=" + ordUser + ", ordGetNm=" + ordGetNm + ", ordGetAddress="
				+ ordGetAddress + ", ordGetZipcode=" + ordGetZipcode + ", ordGetPhone=" + ordGetPhone
				+ ", ordDeliveryMessage=" + ordDeliveryMessage + ", ordPayment=" + ordPayment
				+ ", ordTotalPrice=" + ordTotalPrice + ", ordSavedpoint=" + ordSavedpoint + ", ordCouponDc="
				+ ordCouponDc + ", ordUsepoint=" + ordUsepoint + ", ordFinalPrice=" + ordFinalPrice
				+ ", ordPurchaseStatus=" + ordPurchaseStatus + ", ordDeliveryPrice=" + ordDeliveryPrice + "]";
	}
	
	

	

	
	
	
	
	

	
	
}
