package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.LikeDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReplyDTO;
import com.itwillbs.domain.SearchDTO;
import com.itwillbs.domain.ViewDTO;

public interface BoardDAO {
	//추상메서드
	void insertBoard(BoardDTO boardDTO);

	Integer getMaxNum();

	List<BoardDTO> getBoardList(BoardDTO boardDTO);

	int getBoardCount(BoardDTO boardDTO);

	BoardDTO getBoard(BoardDTO boardDTO);

	BoardDTO numCheck(BoardDTO boardDTO);

	void updateBoard(BoardDTO boardDTO);

	void updateFile(BoardDTO boardDTO);

	void deleteBoard(BoardDTO boardDTO);

	BoardDTO PassCheck(BoardDTO boardDTO);

	ViewDTO viewcheck(ViewDTO viewDTO);

	void viewinsert(ViewDTO viewDTO);

	void viewup(int boardNum);

	void rCountsub(int boardNum);

	void rCount(int boardNum);

	List<BoardDTO> getBoardTopList(BoardDTO boardDTO);








}