package com.itwillbs.domain;

public class prodLikeDTO {
	
	private int prodLikeNum;
	private String userId;
	private String prodLCode;
	
	
	public int getProdLikeNum() {
		return prodLikeNum;
	}
	public void setProdLikeNum(int prodLikeNum) {
		this.prodLikeNum = prodLikeNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProdLCode() {
		return prodLCode;
	}
	public void setProdLCode(String prodLCode) {
		this.prodLCode = prodLCode;
	}
	@Override
	public String toString() {
		return "prodLikeDTO [prodLikeNum=" + prodLikeNum + ", userId=" + userId + ", prodLCode=" + prodLCode + "]";
	}
	
	

}
