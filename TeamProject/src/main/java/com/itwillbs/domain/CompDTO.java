package com.itwillbs.domain;

import java.sql.Timestamp;

public class CompDTO {

	private int companyInfoNum;
	private String compId;
	private String compNm;
	private String compPass;
	private String compEmail;
	private String compRegNum;
	private int userType;
	private String compPhone;
	private String compZipcode;
	private String compAddress;
	private String compDetaddress;


	public String getCompZipcode() {
		return compZipcode;
	}
	public void setCompZipcode(String compZipcode) {
		this.compZipcode = compZipcode;
	}
	public String getCompDetaddress() {
		return compDetaddress;
	}
	public void setCompDetaddress(String compDetaddress) {
		this.compDetaddress = compDetaddress;
	}

	public String getCompAddress() {
		return compAddress;
	}
	public void setCompAddress(String compAddress) {
		this.compAddress = compAddress;
	}

	private Timestamp compDate;

	public int getCompanyInfoNum() {
		return companyInfoNum;
	}
	public void setCompanyInfoNum(int companyInfoNum) {
		this.companyInfoNum = companyInfoNum;
	}
	public String getCompId() {
		return compId;
	}
	public void setCompId(String compId) {
		this.compId = compId;
	}
	public String getCompNm() {
		return compNm;
	}
	public void setCompNm(String compNm) {
		this.compNm = compNm;
	}
	public String getCompPass() {
		return compPass;
	}
	public void setCompPass(String compPass) {
		this.compPass = compPass;
	}
	public String getCompEmail() {
		return compEmail;
	}
	public void setCompEmail(String compEmail) {
		this.compEmail = compEmail;
	}
	public String getCompRegNum() {
		return compRegNum;
	}
	public void setCompRegNum(String compRegNum) {
		this.compRegNum = compRegNum;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public String getCompPhone() {
		return compPhone;
	}
	public void setCompPhone(String compPhone) {
		this.compPhone = compPhone;
	}
	public Timestamp getCompDate() {
		return compDate;
	}
	public void setCompDate(Timestamp compDate) {
		this.compDate = compDate;
	}

	@Override
	public String toString() {
		return "CompDTO [companyInfoNum=" + companyInfoNum + ", compId=" + compId + ", compNm=" + compNm + ", compPass="
				+ compPass + ", compEmail=" + compEmail + ", compRegNum=" + compRegNum + ", userType=" + userType
				+ ", compPhone=" + compPhone + ", compDate=" + compDate + "]";
	}





}
