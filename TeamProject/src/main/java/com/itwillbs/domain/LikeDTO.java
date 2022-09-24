package com.itwillbs.domain;

import java.sql.Timestamp;

public class LikeDTO {
	
	private int likeNum;
	private int boardNum;
	private String userId;
	private int likeCheck;
	private Timestamp likeDate;
	
	
	
	public Timestamp getLikeDate() {
		return likeDate;
	}
	public void setLikeDate(Timestamp likeDate) {
		this.likeDate = likeDate;
	}
	public int getLikeNum() {
		return likeNum;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public String getUserId() {
		return userId;
	}
	public int getLikeCheck() {
		return likeCheck;
	}
	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setLikeCheck(int likeCheck) {
		this.likeCheck = likeCheck;
	}
	@Override
	public String toString() {
		return "LikeDTO [likeNum=" + likeNum + ", boardNum=" + boardNum + ", userId=" + userId + ", likeCheck="
				+ likeCheck + ", likeDate=" + likeDate + "]";
	}
	
	
	
	
	
	
	

}
