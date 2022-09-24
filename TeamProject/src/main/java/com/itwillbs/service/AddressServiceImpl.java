package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.AddressDAO;
import com.itwillbs.domain.AddressDTO;
import org.mybatis.spring.SqlSessionTemplate;

@Service
public class AddressServiceImpl implements AddressService {

	@Inject
	@Autowired
	private AddressDAO addressDAO;

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public void insertAddress(AddressDTO addressDTO) {
		addressDAO.insertAddress(addressDTO);
		
	}

	@Override
	public void updateAddress(AddressDTO addressDTO) {
		System.out.println("addressServiceImpl()");
		addressDAO.updateAddressPro(addressDTO);
	}

	@Override
	public AddressDTO getAddress(String userId) {
		return addressDAO.getAddress(userId);
	}


	
	
	
}
