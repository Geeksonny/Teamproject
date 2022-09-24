package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PointDTO;

@Repository
public class PointDAOImpl implements PointDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.pointMapper";
	//포인트 회원정보 가져오기
	@Override
	public PointDTO getMember(String userId) {
		return sqlSession.selectOne(namespace + ".getMember", userId);
	}
	//포인트(아이디) 수 조회
	@Override
	public int getPointCount(String userId) {
		return sqlSession.selectOne(namespace+".getPointCount", userId);
	}
	//포인트DB POINT_NUM 조회
	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace+".getMaxNum");
	}
	//포인트 DB 저장
	@Override
	public void insertMember(PointDTO pointDTO) {
		sqlSession.insert(namespace+".insertMember", pointDTO);
	}
	//포인트 충전 DB 저장
	@Override
	public void insertChargePoint(Map<String, Object> sMap) {
		sqlSession.insert(namespace+".insertChargePoint", sMap);
	}
	//포인트 날짜 리스트조회
	@Override
	public List<PointDTO> getPointCheckList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace+".getPointCheckList",pageDTO);
	}

}
