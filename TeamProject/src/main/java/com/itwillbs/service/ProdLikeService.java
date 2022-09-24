package com.itwillbs.service;

import com.itwillbs.domain.prodLikeDTO;

public interface ProdLikeService {

	void inserProdLike(prodLikeDTO prodLikeDTO);

	prodLikeDTO prodLikeCheck(prodLikeDTO prodLikeDTO);

	void deleteProdLike(prodLikeDTO prodLikeDTO);


}
