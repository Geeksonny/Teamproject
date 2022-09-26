package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.OrderListDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProdDTO;

public interface MemberDAO {
	// 유저 회원가입
	public void insertMember(MemberDTO memberDTO) throws Exception;

	// 유저 로그인
	public MemberDTO userCheck(MemberDTO memberDTO);
	public MemberDTO getMember(String userId);
	public void loginCheck(MemberDTO memberDTO);
	int updateEmailKey(MemberDTO memberDTO) throws Exception;
	int updateEmailAuth(MemberDTO memberDTO) throws Exception;
	int emailAuthFail(String userId) throws Exception;

	// 이메일 중복 검사
	public MemberDTO checkUserEmail(String userEmail);

	// 업체 회원가입
	public void insertComp(CompDTO compDTO);

	// 업체 로그인
	public CompDTO compCheck(CompDTO compDTO);

	// 아이디 찾기
	public String idSearch(MemberDTO memberDTO);

	// 비밀번호 찾기
	public String pwCheck(MemberDTO memberDTO);
	public void updatePass(MemberDTO memberDTO) throws Exception;

	// 회원 정보 수정
	public void modUser(MemberDTO memberDTO);

	// 비밀번호 변경
	void passMod(MemberDTO memberDTO) throws Exception;

	// 회원 탈퇴
	public void delUser(MemberDTO memberDTO);

	// 휴면 계정 전환
	public void changeStatus(MemberDTO memberDTO);
	// 휴면 계정 체크
	int statusCheck(String userId);

	// 유저 리스트
	public int getUserCount();
	public List<MemberDTO> getUserList(PageDTO pageDTO);

	// 유저 삭제
	public void deleteUser(String userId);

	// 주문 리스트
	public List<OrderListDTO> getOrderList(PageDTO pageDTO);
	public int getOrderCount();
	// 상품 리스트
	public List<ProdDTO> getProductList(PageDTO pageDTO);
	public int getProductCount();
	// 배송 리스트
	public List<OrderDTO> getOrderBList(PageDTO pageDTO);
	public int getOrderBCount();




}
