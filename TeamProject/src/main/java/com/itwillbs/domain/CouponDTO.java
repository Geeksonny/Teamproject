package com.itwillbs.domain;

import java.sql.Timestamp;

public class CouponDTO extends PageDTO {
	private int num        ;
	private String couUserId  ;
	private String couNum     ;
	private String couNm      ;
	private float couDc      ;
	private String couYn      ;
	private Timestamp couDate;
	private Timestamp couInfoDate;
	private String couNumCouDc;
	private String couDet;

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCouUserId() {
		return couUserId;
	}
	public void setCouUserId(String couUserId) {
		this.couUserId = couUserId;
	}
	public String getCouNum() {
		return couNum;
	}
	public void setCouNum(String couNum) {
		this.couNum = couNum;
	}
	public String getCouNm() {
		return couNm;
	}
	public void setCouNm(String couNm) {
		this.couNm = couNm;
	}
	public float getCouDc() {
		return couDc;
	}
	public void setCouDc(float couDc) {
		this.couDc = couDc;
	}
	public String getCouYn() {
		return couYn;
	}
	public void setCouYn(String couYn) {
		this.couYn = couYn;
	}
	public Timestamp getCouDate() {
		return couDate;
	}
	public void setCouDate(Timestamp couDate) {
		this.couDate = couDate;
	}
	public String getCouNumCouDc() {
		return couNumCouDc;
	}
	public void setCouNumCouDc(String couNumCouDc) {
		this.couNumCouDc = couNumCouDc;
	}
	public String getCouDet() {
		return couDet;
	}
	public void setCouDet(String couDet) {
		this.couDet = couDet;
	}
	public Timestamp getCouInfoDate() {
		return couInfoDate;
	}
	public void setCouInfoDate(Timestamp couInfoDate) {
		this.couInfoDate = couInfoDate;
	}










}
