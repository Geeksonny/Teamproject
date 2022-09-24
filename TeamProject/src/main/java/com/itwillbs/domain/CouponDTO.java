package com.itwillbs.domain;

import java.sql.Timestamp;

public class CouponDTO {
	private int num        ;
	private String couUserNm  ;
	private String couNum     ;
	private String couNm      ;
	private float couDc      ;
	private String couYn      ;
	private Timestamp couDate;
	private String couNumCouDc;


	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCouUserNm() {
		return couUserNm;
	}
	public void setCouUserNm(String couUserNm) {
		this.couUserNm = couUserNm;
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







}
