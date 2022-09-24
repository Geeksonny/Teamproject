package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ProdDTO;

public interface OrderDAO {

	public void insertOrder(Map<String, Object> sMap);
	
	public void updateQuantity(Map<String, Object> sMap);
	
	public void removeItemBasket(Map<String, Object> sMap);
	
//	public BasketDTO getItemCode(String userId);
	
	void orderComplete(Map<String, Object> sMap);
	
	public void insertUsePoint(Map<String, Object> sMap);
	
	public void isertOrderList(Map<String, Object> sMap);
	
	List<ProdDTO> getQuantityList(ProdDTO proDTO); 
}


