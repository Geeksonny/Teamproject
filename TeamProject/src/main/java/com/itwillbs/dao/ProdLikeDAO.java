package com.itwillbs.dao;

import com.itwillbs.domain.prodLikeDTO;

public interface ProdLikeDAO {

	void inserProdLike(prodLikeDTO prodLikeDTO);

	prodLikeDTO prodLikeCheck(prodLikeDTO prodLikeDTO);

	void deleteProdLike(prodLikeDTO prodLikeDTO);

}
