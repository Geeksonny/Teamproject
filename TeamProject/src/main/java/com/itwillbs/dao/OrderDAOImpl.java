package com.itwillbs.dao;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProdDTO;


@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	@Autowired
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.orderMapper";

	@Override
	public void insertOrder(Map<String, Object> sMap) {
		sqlSession.insert(namespace + ".insertOrder", sMap);
	}

	@Override
	public void orderComplete(Map<String, Object> sMap) {
		sqlSession.insert(namespace+".orderComplete", sMap);
	}

	@Override
	public void updateQuantity(Map<String, Object> sMap) {
		sqlSession.update(namespace + ".updateQuantity", sMap);

	}

	@Override
	public void insertUsePoint(Map<String, Object> sMap) {
		sqlSession.insert(namespace+".insertUsePoint", sMap);

	}

	@Override
	public void removeItemBasket(Map<String, Object> sMap) {
		sqlSession.delete(namespace + ".removeItemBasket", sMap);

	}

	@Override
	public List<ProdDTO> getQuantityList(ProdDTO proDTO) {
		return sqlSession.selectList(namespace + ".getQuantityList", proDTO);
	}

	@Override
	public void insertOrderList(Map<String, Object> sMap) {
		System.out.println("inserOrderListDAO");
		sqlSession.delete(namespace + ".insertOrderList", sMap);

	}

	@Override
	public void updateCoupon(Map<String, Object> sMap) {
		System.out.println("updateCouponDAOImpl!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		sqlSession.update(namespace + ".updateCoupon", sMap);
	}

	@Override
	public void deletePoint() {
		sqlSession.update(namespace + ".deletePoint");		
	}
	
	
}