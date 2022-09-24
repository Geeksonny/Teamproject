package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProdDTO;

@Repository
public class ProdDAOImpl implements ProdDAO{

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.prodMapper";

	@Override
	public List<ProdDTO> selectProdList(ProdDTO prodDTO) {
		return sqlSession.selectList(namespace+".selectProdList",prodDTO);
	}

	@Override
	public int selectProdListCnt(ProdDTO prodDTO) {
		return sqlSession.selectOne(namespace+".selectProdListCnt",prodDTO);
	}

	@Override
	public ProdDTO selectProdDetail(ProdDTO prodDTO) {
		return (ProdDTO) sqlSession.selectOne(namespace+".selectProdDetail",prodDTO);
	}

	@Override
	public ProdDTO getProdNumName(ProdDTO prodDTO) {
		return (ProdDTO) sqlSession.selectOne(namespace+".getProdNumName",prodDTO);
	}

	@Override
	public void enrollReply(ProdDTO prodDTO) {
		sqlSession.insert(namespace+".enrollReply",prodDTO);
	}

	@Override
	public int checkReply(ProdDTO prodDTO) {
		return sqlSession.selectOne(namespace+".checkReply",prodDTO);
	}

}
