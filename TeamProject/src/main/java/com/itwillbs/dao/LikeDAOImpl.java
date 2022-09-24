package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.LikeDTO;

@Repository
public class LikeDAOImpl implements LikeDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.likeMapper";



	@Override
	public LikeDTO likeCheck(LikeDTO likeDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".likeCheck", likeDTO);
	}



	@Override
	public void insertLike(LikeDTO likeDTO) {
		
			
		
		
		sqlSession.insert(namespace+".insertLike", likeDTO);
		
	}



	@Override
	public void deleteLike(LikeDTO likeDTO) {
		sqlSession.delete(namespace+".deleteLike", likeDTO);
		
	}




	@Override
	public void updateLike(BoardDTO boardDTO) {
		System.out.println("DAOLIKE");
		sqlSession.update(namespace+".updateLike", boardDTO);
		
	}




	@Override
	public void updateLikeCancel(BoardDTO boardDTO) {
		sqlSession.update(namespace+".updateLikeCancel", boardDTO);
		
	}



	@Override
	public List<LikeDTO> getLikeList(LikeDTO likeDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".getLikeList", likeDTO);
	}




	
	
	
	
}
