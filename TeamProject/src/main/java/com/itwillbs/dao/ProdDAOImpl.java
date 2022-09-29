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
	public List<ProdDTO> getProdNumName(ProdDTO prodDTO) {
		return sqlSession.selectList(namespace+".getProdNumName",prodDTO);
	}

	@Override
	public void enrollReply(ProdDTO prodDTO) {
		sqlSession.insert(namespace+".enrollReply",prodDTO);
	}

	@Override
	public void updateReply(ProdDTO prodDTO) {
		sqlSession.update(namespace+".updateReply", prodDTO);
	}

	@Override
	public void deleteReply(ProdDTO prodDTO) {
		sqlSession.delete(namespace+".deleteReply", prodDTO);
	}

	@Override
	public int checkReply(ProdDTO prodDTO) {
		return sqlSession.selectOne(namespace+".checkReply",prodDTO);
	}

	@Override
	public List<ProdDTO> selectReplyList(ProdDTO prodDTO) {
		return sqlSession.selectList(namespace+".selectReplyList",prodDTO);
	}

	@Override
	public int selectReplyListCnt(ProdDTO prodDTO) {
		return sqlSession.selectOne(namespace+".selectReplyListCnt",prodDTO);
	}

	@Override
	public List<ProdDTO> selectProdRelatedList(ProdDTO details) {
		return sqlSession.selectList(namespace+".selectProdRelatedList",details);
	}

	@Override
	public List<ProdDTO> selectProdNewList(ProdDTO prodDTO) {
		return sqlSession.selectList(namespace+".selectProdNewList",prodDTO);
	}

	@Override
	public List<ProdDTO> selectProdBsList(ProdDTO prodDTO) {
		return sqlSession.selectList(namespace+".selectProdBsList",prodDTO);
	}

}