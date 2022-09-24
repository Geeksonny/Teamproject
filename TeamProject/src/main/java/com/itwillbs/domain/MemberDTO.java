package com.itwillbs.domain;

import java.sql.Timestamp;


public class MemberDTO {
	private int userInfoNum;
	private String userId;
	private String userPass;
	private String userNm;
	private String userEmail;
	private String userGender;
	private String userAthletic;
	private String userNicknm;
	private String userPhone;
	private Timestamp userDate;
	private int userPoint;
	private int myCouponNum;
	private String userRank;
	private String userType;
	private int userStatus;
	private Timestamp userLastDate;
	private int userEmailAuth;
	private String userEmailKey;
	private int userKakaoLogin;



	public int getUserKakaoLogin() {
		return userKakaoLogin;
	}
	public void setUserKakaoLogin(int userKakaoLogin) {
		this.userKakaoLogin = userKakaoLogin;
	}
	public int getUserInfoNum() {
		return userInfoNum;
	}
	public void setUserInfoNum(int userInfoNum) {
		this.userInfoNum = userInfoNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserAthletic() {
		return userAthletic;
	}
	public void setUserAthletic(String userAthletic) {
		this.userAthletic = userAthletic;
	}
	public String getUserNicknm() {
		return userNicknm;
	}
	public void setUserNicknm(String userNicknm) {
		this.userNicknm = userNicknm;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public Timestamp getUserDate() {
		return userDate;
	}
	public void setUserDate(Timestamp userDate) {
		this.userDate = userDate;
	}
	public int getUserPoint() {
		return userPoint;
	}
	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}
	public int getMyCouponNum() {
		return myCouponNum;
	}
	public void setMyCouponNum(int myCouponNum) {
		this.myCouponNum = myCouponNum;
	}
	public String getUserRank() {
		return userRank;
	}
	public void setUserRank(String userRank) {
		this.userRank = userRank;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public int getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
	}
	public Timestamp getUserLastDate() {
		return userLastDate;
	}
	public void setUserLastDate(Timestamp userLastDate) {
		this.userLastDate = userLastDate;
	}
	public int getUserEmailAuth() {
		return userEmailAuth;
	}
	public void setUserEmailAuth(int userEmailAuth) {
		this.userEmailAuth = userEmailAuth;
	}
	public String getUserEmailKey() {
		return userEmailKey;
	}
	public void setUserEmailKey(String userEmailKey) {
		this.userEmailKey = userEmailKey;
	}



}
