package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.OrderDAO;
import com.itwillbs.domain.BasketDTO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.ProdDTO;


@Service
public class OrderServiceImpl implements OrderService {

	@Inject
	@Autowired
	OrderDAO orderDAO;



	@Override
	public void insertOrder(Map<String, Object> sMap) {
		orderDAO.insertOrder(sMap);
	}

	@Override
	public void orderComplete(Map<String, Object> sMap) {
		orderDAO.orderComplete(sMap);
	}

	@Override
	public void updateQuantity(Map<String, Object> sMap) {
		System.out.println("updateQuantityImpl()");
		orderDAO.updateQuantity(sMap);
	}


//
//	@Override
//	public BasketDTO getItemCode(String userId) {
//		return orderDAO.getItemCode(userId);
//
//	}



	@Override
	public void removeItemBasket(Map<String, Object> sMap) {
		orderDAO.removeItemBasket(sMap);
	}

	@Override
	public void insertUsePoint(Map<String, Object> sMap) {
		orderDAO.insertUsePoint(sMap);

	}

	@Override
	public List<ProdDTO> getQuantityList(ProdDTO proDTO) {
		return null;
	}

	@Override
	public void isertOrderList(Map<String, Object> sMap) {
		System.out.println("insertOrderListImpl()");
		orderDAO.isertOrderList(sMap);

	}

	@Override
	public void updateCoupon(Map<String, Object> sMap) {
		System.out.println("updateCouponServiceImpl");
		orderDAO.updateCoupon(sMap);
	}



}
