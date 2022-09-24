package com.itwillbs.domain;

public class ViewDTO {
	
	private int boardNum;
	private String userId;
	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "ViewDTO [boardNum=" + boardNum + ", userId=" + userId + "]";
	}
	
	
	
	

	
	
	
	
	

}
