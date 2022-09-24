package com.itwillbs.service;


import com.itwillbs.domain.AddressDTO;

public interface AddressService {
	
	// 배송지 저장(회원정보수정)
	public void insertAddress(AddressDTO addressDTO);
	
	// 배송지 수정
	public void updateAddress(AddressDTO addressDTO);
	
	
	// 배송지 불러오기 Y 한건
	public AddressDTO getAddress(String userId);
	
}
