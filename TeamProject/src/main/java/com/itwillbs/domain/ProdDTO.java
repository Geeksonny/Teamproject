package com.itwillbs.domain;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

public class ProdDTO extends PageDTO {

	// 상품
	private int prodLNum;
	private String prodLCode;
	private String prodLOption1;
	private String prodLOption2;
	private String prodLOption3;
	private String prodLOption4;
	private String prodLOption5;
	private String prodLProdnm;
	private int prodLPrice;
	private Timestamp prodLUploaddate;
	private String prodLCompnm;
	private String prodLMainimg;
	private String prodLSubimg;
	private String prodLDetail;
	private int prodLQuantity;

	// 별점 평균, 카운트
	private int avgRating;
	private int countRating;

	// 검색, 카테고리, 정렬 기능
	private String srhText;
	private String category;
	private String gridColumn;

	// 리뷰 관련
	private String userId;
	private int replyNum;
	private String content;
	private int rating;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date replyDate;

	// 사업자
	private String compNm;

	public int getProdLNum() {
		return prodLNum;
	}
	public void setProdLNum(int prodLNum) {
		this.prodLNum = prodLNum;
	}
	public String getProdLCode() {
		return prodLCode;
	}
	public void setProdLCode(String prodLCode) {
		this.prodLCode = prodLCode;
	}
	public String getProdLOption1() {
		return prodLOption1;
	}
	public void setProdLOption1(String prodLOption1) {
		this.prodLOption1 = prodLOption1;
	}
	public String getProdLOption2() {
		return prodLOption2;
	}
	public void setProdLOption2(String prodLOption2) {
		this.prodLOption2 = prodLOption2;
	}

	public String getProdLOption3() {
		return prodLOption3;
	}
	public void setProdLOption3(String prodLOption3) {
		this.prodLOption3 = prodLOption3;
	}
	public String getProdLOption4() {
		return prodLOption4;
	}
	public void setProdLOption4(String prodLOption4) {
		this.prodLOption4 = prodLOption4;
	}
	public String getProdLOption5() {
		return prodLOption5;
	}
	public void setProdLOption5(String prodLOption5) {
		this.prodLOption5 = prodLOption5;
	}
	public String getProdLProdnm() {
		return prodLProdnm;
	}
	public void setProdLProdnm(String prodLProdnm) {
		this.prodLProdnm = prodLProdnm;
	}
	public int getProdLPrice() {
		return prodLPrice;
	}
	public void setProdLPrice(int prodLPrice) {
		this.prodLPrice = prodLPrice;
	}
	public Timestamp getProdLUploaddate() {
		return prodLUploaddate;
	}
	public void setProdLUploaddate(Timestamp prodLUploaddate) {
		this.prodLUploaddate = prodLUploaddate;
	}
	public String getProdLCompnm() {
		return prodLCompnm;
	}
	public void setProdLCompnm(String prodLCompnm) {
		this.prodLCompnm = prodLCompnm;
	}
	public String getProdLMainimg() {
		return prodLMainimg;
	}
	public void setProdLMainimg(String prodLMainimg) {
		this.prodLMainimg = prodLMainimg;
	}
	public String getProdLSubimg() {
		return prodLSubimg;
	}
	public void setProdLSubimg(String prodLSubimg) {
		this.prodLSubimg = prodLSubimg;
	}
	public String getProdLDetail() {
		return prodLDetail;
	}
	public void setProdLDetail(String prodLDetail) {
		this.prodLDetail = prodLDetail;
	}
	public int getProdLQuantity() {
		return prodLQuantity;
	}
	public void setProdLQuantity(int prodLQuantity) {
		this.prodLQuantity = prodLQuantity;
	}
	public String getSrhText() {
		return srhText;
	}
	public void setSrhText(String srhText) {
		this.srhText = srhText;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getGridColumn() {
		return gridColumn;
	}
	public void setGridColumn(String gridColumn) {
		this.gridColumn = gridColumn;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	public int getAvgRating() {
		return avgRating;
	}
	public void setAvgRating(int avgRating) {
		this.avgRating = avgRating;
	}
	public int getCountRating() {
		return countRating;
	}
	public void setCountRating(int countRating) {
		this.countRating = countRating;
	}
	public String getCompNm() {
		return compNm;
	}
	public void setCompNm(String compNm) {
		this.compNm = compNm;
	}

	@Override
	public String toString() {
		return "ProdDTO [prodLNum=" + prodLNum + ", prodLCode=" + prodLCode + ", prodLOption1=" + prodLOption1
				+ ", prodLOption2=" + prodLOption2 + ", prodLOption3=" + prodLOption3 + ", prodLOption4=" + prodLOption4
				+ ", prodLOption5=" + prodLOption5 + ", prodLProdnm=" + prodLProdnm + ", prodLPrice=" + prodLPrice
				+ ", prodLUploaddate=" + prodLUploaddate + ", prodLCompnm=" + prodLCompnm + ", prodLMainimg="
				+ prodLMainimg + ", prodLSubimg=" + prodLSubimg + ", prodLDetail=" + prodLDetail + ", prodLQuantity="
				+ prodLQuantity + ", avgRating=" + avgRating + ", countRating=" + countRating + ", srhText=" + srhText
				+ ", category=" + category + ", gridColumn=" + gridColumn + ", userId=" + userId + ", replyNum="
				+ replyNum + ", content=" + content + ", rating=" + rating + ", replyDate=" + replyDate + ", compNm="
				+ compNm + "]";
	}

}