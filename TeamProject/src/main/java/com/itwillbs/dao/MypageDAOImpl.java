package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MypageDTO;
import com.itwillbs.domain.OrderListDTO;
import com.itwillbs.domain.PageDTO;
@Repository
public class MypageDAOImpl implements MypageDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.mypageMapper";

	@Override
	public void insertMypage(MypageDTO userId) {
		sqlSession.insert(namespace+".insertMypage", userId);

	}

	@Override
	public void boardCount(MypageDTO mypageDTO) {
		sqlSession.update(namespace+".boardCount", mypageDTO);
	}

	@Override
	public void boardsub(MypageDTO mypageDTO) {
		sqlSession.update(namespace+".boardsub", mypageDTO);

	}

	@Override
	public void replysub(MypageDTO mypageDTO) {
		sqlSession.update(namespace+".replysub", mypageDTO);
	}

	@Override
	public void replyCount(MypageDTO mypageDTO) {
		sqlSession.update(namespace+".replyCount", mypageDTO);
	}

	@Override
	public MypageDTO mypageselect(MypageDTO mypageDTO) {
		System.out.println(mypageDTO.getBoardCount());
		return sqlSession.selectOne(namespace+".mypageselect", mypageDTO);

	}

	@Override
	public List<OrderListDTO> getMyOrdList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getMyOrdList",pageDTO);
	}

	@Override
	public int getMyOrdListCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace+".getMyOrdListCount", pageDTO);
	}



}
