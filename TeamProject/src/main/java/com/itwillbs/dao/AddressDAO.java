package com.itwillbs.dao;


import com.itwillbs.domain.AddressDTO;

public interface AddressDAO {

	public void insertAddress(AddressDTO addressDTO);
	
	public void updateAddress(AddressDTO addressDTO);
	
	public AddressDTO getAddress(String userId);
	
	public void insertAddressPro(AddressDTO addressDTO);
	
	public void updateAddressPro(AddressDTO addressDTO);
	

}
