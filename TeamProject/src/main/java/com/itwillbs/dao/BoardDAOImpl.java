package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.LikeDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReplyDTO;
import com.itwillbs.domain.SearchDTO;
import com.itwillbs.domain.ViewDTO;

@Repository
public class BoardDAOImpl implements BoardDAO{

	//마이바티스 객체생성
	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.boardMapper";

	@Override
	public void insertBoard(BoardDTO boardDTO) {
		sqlSession.insert(namespace+".insertBoard", boardDTO);
	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace+".getMaxNum");
	}

	@Override
	public List<BoardDTO> getBoardList(BoardDTO boardDTO) {
		return sqlSession.selectList(namespace+".getBoardList",boardDTO);
	}

	@Override
	public int getBoardCount(BoardDTO boardDTO) {
		return sqlSession.selectOne(namespace+".getBoardCount", boardDTO);
	}
	@Override
	public BoardDTO getBoard(int boardNum) {
		return sqlSession.selectOne(namespace+".getBoard", boardNum);
	}

	@Override
	public BoardDTO numCheck(BoardDTO boardDTO) {

		return sqlSession.selectOne(namespace+".numCheck", boardDTO);
	}

	@Override
	public void updateBoard(BoardDTO boardDTO) {
		sqlSession.update(namespace+".updateBoard", boardDTO);
	}

	@Override
	public void updateFile(BoardDTO boardDTO) {
		sqlSession.update(namespace+".updateFile", boardDTO);

	}

	@Override
	public void deleteBoard(BoardDTO boardDTO) {

		sqlSession.delete(namespace+".deleteBoard", boardDTO);
	}

	@Override
	public BoardDTO PassCheck(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".PassCheck", boardDTO);
	}

	@Override
	public ViewDTO viewcheck(ViewDTO viewDTO) {
		return sqlSession.selectOne(namespace+".viewcheck", viewDTO);
	}

	@Override
	public void viewinsert(ViewDTO viewDTO) {
		sqlSession.insert(namespace+".viewinsert", viewDTO);

	}

	@Override
	public void viewup(int boardNum) {
		sqlSession.update(namespace+".viewup", boardNum);


	}

	@Override
	public void rCountsub(int boardNum) {
		sqlSession.update(namespace+".rCountsub", boardNum);
	}

	@Override
	public void rCount(int boardNum) {
		sqlSession.update(namespace+".rCount", boardNum);
	}

	@Override
	public List<BoardDTO> gettopBoard(BoardDTO boardDTO) {
		return sqlSession.selectList(namespace+".gettopBoard",boardDTO);
	}








}