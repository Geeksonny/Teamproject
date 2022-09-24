package com.itwillbs.domain;

import java.sql.Timestamp;

public class BasketDTO {
	private int num;
	private int sbBasketNum;
	private String sbUser;
	private String sbProdCode;
	private int sbCount;
	private int prodLQuantity;
	private int sbProdPrice;
	private int sbTotalPrice;
	private String sbProdNm;
	private String ordLCounumcoudc;
	private Timestamp shoppingBasketDate;
	private String prodMainimg;


	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getSbBasketNum() {
		return sbBasketNum;
	}
	public void setSbBasketNum(int sbBasketNum) {
		this.sbBasketNum = sbBasketNum;
	}
	public String getSbUser() {
		return sbUser;
	}
	public void setSbUser(String sbUser) {
		this.sbUser = sbUser;
	}
	public String getSbProdCode() {
		return sbProdCode;
	}
	public void setSbProdCode(String sbProdCode) {
		this.sbProdCode = sbProdCode;
	}
	public int getSbCount() {
		return sbCount;
	}
	public void setSbCount(int sbCount) {
		this.sbCount = sbCount;
	}
	public int getSbProdPrice() {
		return sbProdPrice;
	}
	public void setSbProdPrice(int sbProdPrice) {
		this.sbProdPrice = sbProdPrice;
	}
	public int getSbTotalPrice() {
		return sbTotalPrice;
	}
	public void setSbTotalPrice(int sbTotalPrice) {
		this.sbTotalPrice = sbTotalPrice;
	}
	public String getSbProdNm() {
		return sbProdNm;
	}
	public void setSbProdNm(String sbProdNm) {
		this.sbProdNm = sbProdNm;
	}
	public Timestamp getShoppingBasketDate() {
		return shoppingBasketDate;
	}
	public void setShoppingBasketDate(Timestamp shoppingBasketDate) {
		this.shoppingBasketDate = shoppingBasketDate;
	}
	public int getProdLQuantity() {
		return prodLQuantity;
	}
	public void setProdLQuantity(int prodLQuantity) {
		this.prodLQuantity = prodLQuantity;
	}


	public String getOrdLCounumcoudc() {
		return ordLCounumcoudc;
	}
	public void setOrdLCounumcoudc(String ordLCounumcoudc) {
		this.ordLCounumcoudc = ordLCounumcoudc;
	}



	public String getProdMainimg() {
		return prodMainimg;
	}
	public void setProdMainimg(String prodMainimg) {
		this.prodMainimg = prodMainimg;
	}
	@Override
	public String toString() {
		return "BasketDTO [sbBasketNum=" + sbBasketNum + ", sbUser=" + sbUser + ", sbProdCode=" + sbProdCode
				+ ", sbCount=" + sbCount + ", prodLQuantity=" + prodLQuantity + ", sbProdPrice=" + sbProdPrice
				+ ", sbTotalPrice=" + sbTotalPrice + ", sbProdNm=" + sbProdNm + ", shoppingBasketDate="
				+ shoppingBasketDate + "]";
	}


}
