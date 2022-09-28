package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.OrderListDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProdDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.memberMapper";

	// 유저 회원가입 동작
	@Override
	public void insertMember(MemberDTO memberDTO) throws Exception{
		sqlSession.insert(namespace + ".insertMember", memberDTO);
	}

	// 유저 로그인 동작
	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace+".userCheck", memberDTO);
	}

	// 유저 아이디 중복체크 동작
	@Override
	public MemberDTO getMember(String userId) {
		return sqlSession.selectOne(namespace+".getMember", userId);
	}

	// 업체 회원가입 동작
	@Override
	public void insertComp(CompDTO compDTO) {
		sqlSession.insert(namespace + ".insertComp", compDTO);

	}

	// 업체 로그인 동작
	@Override
	public CompDTO compCheck(CompDTO compDTO) {
		return sqlSession.selectOne(namespace+".compCheck", compDTO);
	}

	// 마지막 로그인
	@Override
	public void loginCheck(MemberDTO memberDTO) {
		sqlSession.selectOne(namespace+".loginCheck", memberDTO);
	}

	// 이메일 인증키 동작
	@Override
	public int updateEmailKey(MemberDTO memberDTO) throws Exception {
		System.out.println("MemberDAOImpl() updateEmailKey");
		return sqlSession.update(namespace + ".updateEmailKey", memberDTO);
	}

	// 이메일 인증 컬럼 업데이트 동작
	@Override
	public int updateEmailAuth(MemberDTO memberDTO) throws Exception {
		System.out.println("MemberDAOImpl() updateEmailAuth");
		return sqlSession.update(namespace + ".updateEmailAuth", memberDTO);
	}

	// 이메일 인증 확인 동작
	@Override
	public int emailAuthFail(String userId) throws Exception {
		 return sqlSession.selectOne(namespace + ".emailAuthFail", userId);
	}

	// 아이디 찾기 동작
	@Override
	public String idSearch(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace + ".idSearch", memberDTO);
	}
	@Override
	public MemberDTO checkUserEmail(String userEmail) {
		return sqlSession.selectOne(namespace + ".checkUserEmail", userEmail);
	}
	// 비밀번호 찾기 동작
	@Override
	public void updatePass(MemberDTO memberDTO) {
		sqlSession.update(namespace + ".updatePass", memberDTO);
	}
	@Override
	public String pwCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace + ".pwCheck", memberDTO);
	}

	// 회원 정보 수정 동작
	@Override
	public void modUser(MemberDTO memberDTO) {
		sqlSession.update(namespace + ".modUser", memberDTO);
	}

	// 회원 탈퇴 동작
	@Override
	public void delUser(MemberDTO memberDTO) {
		sqlSession.delete(namespace + ".delUser", memberDTO);
	}

	// 비밀번호 변경 동작
	@Override
	public void passMod(MemberDTO memberDTO) throws Exception {
		sqlSession.update(namespace + ".passMod", memberDTO);

	}

	// 휴면 계정 전환 동작
	@Override
	public void changeStatus(MemberDTO memberDTO) {
		sqlSession.update(namespace + ".changeStatus", memberDTO);
	}
	// 휴면 계정 체크 동작
	@Override
	public int statusCheck(String userId) {
		return sqlSession.selectOne(namespace + ".statusCheck", userId);
	}

	// 유저 리스트
	@Override
	public int getUserCount() {
		System.out.println("uc");
		return sqlSession.selectOne(namespace + ".getUserCount");
	}
	@Override
	public List<MemberDTO> getUserList(PageDTO pageDTO) {
		System.out.println("ul");
		return sqlSession.selectList(namespace + ".getUserList", pageDTO);
	}

	// 유저 삭제
	@Override
	public void deleteUser(String userId) {
		sqlSession.update(namespace + ".deleteUser", userId);
	}

	// 주문 리스트
	@Override
	public List<OrderListDTO> getOrderList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getOrderList", pageDTO);
	}
	@Override
	public int getOrderCount() {
		return sqlSession.selectOne(namespace + ".getOrderCount");
	}

	// 상품 리스트
	@Override
	public List<ProdDTO> getProductList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getProductList", pageDTO);
	}
	@Override
	public int getProductCount() {
		return sqlSession.selectOne(namespace + ".getProductCount");
	}
	// 배송 리스트
	@Override
	public List<OrderDTO> getOrderBList(PageDTO pageDTO) {
		return sqlSession.selectList(namespace + ".getOrderBList", pageDTO);
	}
	@Override
	public int getOrderBCount() {
		return sqlSession.selectOne(namespace + ".getOrderBCount");
	}







}
