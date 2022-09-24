package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProdLikeDAO;
import com.itwillbs.dao.ReplyDAO;
import com.itwillbs.domain.prodLikeDTO;

@Service
public class ProdLikeServiceImpl implements ProdLikeService {
	
	@Inject
	public ProdLikeDAO prodLikeDAO;
	
	@Override
	public void inserProdLike(prodLikeDTO prodLikeDTO) {
		prodLikeDAO.inserProdLike(prodLikeDTO);
		
	}

	@Override
	public prodLikeDTO prodLikeCheck(prodLikeDTO prodLikeDTO) {
		// TODO Auto-generated method stub
		return prodLikeDAO.prodLikeCheck(prodLikeDTO);
	}

	@Override
	public void deleteProdLike(prodLikeDTO prodLikeDTO) {
		prodLikeDAO.deleteProdLike(prodLikeDTO);
		
	}


}
