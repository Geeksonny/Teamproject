package com.itwillbs.dao; 


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.AddressDTO;

@Repository
public class AddressDAOImpl implements AddressDAO {

	@Inject
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.addressMapper";
	
	@Override
	public void insertAddress(AddressDTO addressDTO) {
		System.out.println("addressDAOImpl insertAddress()");
		sqlSession.insert(namespace + ".insertAddress", addressDTO);		
	}


	@Override
	public void updateAddress(AddressDTO addressDTO) {
		System.out.println("addressDAOImpl updateAddress()");
		sqlSession.insert(namespace + ".updateAddress", addressDTO);		
	}
	
	@Override
	public AddressDTO getAddress(String userId) {
		
		return sqlSession.selectOne(namespace + ".getAddress", userId);
	}

	

	@Override
	public void insertAddressPro(AddressDTO addressDTO) {
		sqlSession.insert(namespace + ".insertAddressPro", addressDTO);	
	}


	@Override
	public void updateAddressPro(AddressDTO addressDTO) {
		System.out.println("addressDAOImpl updateAddressPro()");
		sqlSession.insert(namespace + ".updateAddressPro", addressDTO);	
	}



	
	




	
}
