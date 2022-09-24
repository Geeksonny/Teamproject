package com.itwillbs.domain;

public class AddressDTO {
	
	private String userId;
	private String addressZipcode;
	private String address;
	private String addressDetails;
	private String addressGetNm;
	private String addressGetPhone;
	
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAddressZipcode() {
		return addressZipcode;
	}
	public void setAddressZipcode(String addressZipcode) {
		this.addressZipcode = addressZipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetails() {
		return addressDetails;
	}
	public void setAddressDetails(String addressDetails) {
		this.addressDetails = addressDetails;
	}
	public String getAddressGetNm() {
		return addressGetNm;
	}
	public void setAddressGetNm(String addressGetNm) {
		this.addressGetNm = addressGetNm;
	}
	public String getAddressGetPhone() {
		return addressGetPhone;
	}
	public void setAddressGetPhone(String addressGetPhone) {
		this.addressGetPhone = addressGetPhone;
	}
	
	@Override
	public String toString() {
		return "AddressDTO [userId=" + userId + ", addressZipcode=" + addressZipcode + ", address=" + address
				+ ", addressDetails=" + addressDetails + ", addressGetNm=" + addressGetNm + ", addressGetPhone="
				+ addressGetPhone + "]";
	}
	
	
	
	
	
	
	
	
	
	
}
