package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.prodLikeDTO;

@Repository
public class ProdLikeDAOImpl implements ProdLikeDAO{
	
	@Inject
	SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.prodlikeMapper";

	@Override
	public void inserProdLike(prodLikeDTO prodLikeDTO) {
		sqlSession.insert(namespace+".inserProdLike",prodLikeDTO);
		
	}

	@Override
	public prodLikeDTO prodLikeCheck(prodLikeDTO prodLikeDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".prodLikeCheck",prodLikeDTO);
	}

	@Override
	public void deleteProdLike(prodLikeDTO prodLikeDTO) {
		sqlSession.delete(namespace+".deleteProdLike",prodLikeDTO);
		
	}
	
	
}
