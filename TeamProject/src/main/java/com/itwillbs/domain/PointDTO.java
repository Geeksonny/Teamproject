package com.itwillbs.domain;

import java.sql.Timestamp;

public class PointDTO {
	private int pointNum;
	private String userId;
	private String pointType;
	private Timestamp pointDate;
	private int pointNow;
	private int pointUsed;
	private int pointCharge;
	public int getPointNum() {
		return pointNum;
	}
	public void setPointNum(int pointNum) {
		this.pointNum = pointNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPointType() {
		return pointType;
	}
	public void setPointType(String pointType) {
		this.pointType = pointType;
	}
	public Timestamp getPointDate() {
		return pointDate;
	}
	public void setPointDate(Timestamp pointDate) {
		this.pointDate = pointDate;
	}
	public int getPointNow() {
		return pointNow;
	}
	public void setPointNow(int pointNow) {
		this.pointNow = pointNow;
	}
	public int getPointUsed() {
		return pointUsed;
	}
	public void setPointUsed(int pointUsed) {
		this.pointUsed = pointUsed;
	}
	public int getPointCharge() {
		return pointCharge;
	}
	public void setPointCharge(int pointCharge) {
		this.pointCharge = pointCharge;
	}
	
	
}
