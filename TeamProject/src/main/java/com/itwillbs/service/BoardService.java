package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.LikeDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReplyDTO;
import com.itwillbs.domain.SearchDTO;
import com.itwillbs.domain.ViewDTO;

public interface BoardService {
	//추상메서드
	void insertBoard(BoardDTO boardDTO);

	List<BoardDTO> getBoardList(BoardDTO boardDTO);

	int getBoardCount(BoardDTO boardDTO);

	BoardDTO getBoard(int boardNum);

//	BoardDTO boardDTO2=boardService.numCheck(boardDTO);
	BoardDTO numCheck(BoardDTO boardDTO);

//	boardService.updateBoard(boardDTO);
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