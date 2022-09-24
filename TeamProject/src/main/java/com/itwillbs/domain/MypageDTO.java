package com.itwillbs.domain;

public class MypageDTO {
	
	private String userId;
	private int boardCount;
	private int replyCount;
	private int productLike;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getBoardCount() {
		return boardCount;
	}
	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getProductLike() {
		return productLike;
	}
	public void setProductLike(int productLike) {
		this.productLike = productLike;
	}
	@Override
	public String toString() {
		return "MypageDTO [userId=" + userId + ", boardCount=" + boardCount + ", replyCount=" + replyCount
				+ ", productLike=" + productLike + "]";
	}
	
	
	
	
	
	
}
