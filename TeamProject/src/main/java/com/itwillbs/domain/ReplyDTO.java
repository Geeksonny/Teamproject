package com.itwillbs.domain;

import java.sql.Timestamp;

public class ReplyDTO {

	private int rNum;
	private int boardNum;
	private String userId;
	private String rPass;
	private String rContent;
	private Timestamp rDate;
	
	public int getrNum() {
		return rNum;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public String getUserId() {
		return userId;
	}
	public String getrPass() {
		return rPass;
	}
	public String getrContent() {
		return rContent;
	}
	public Timestamp getrDate() {
		return rDate;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setrPass(String rPass) {
		this.rPass = rPass;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public void setrDate(Timestamp rDate) {
		this.rDate = rDate;
	}
	@Override
	public String toString() {
		return "ReplyDTO [rNum=" + rNum + ", boardNum=" + boardNum + ", userId=" + userId + ", rPass=" + rPass
				+ ", rContent=" + rContent + ", rDate=" + rDate + "]";
	}
	
	
	
	
	
}
