package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BoardDAO;
import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.LikeDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SearchDTO;
import com.itwillbs.domain.ViewDTO;

@Service
public class BoardServiceImpl implements BoardService{

//	객체생성 부모=자식
	@Inject
	private BoardDAO boardDAO;
	private BoardDAO likeDAO;
	
	
	@Override
	public void insertBoard(BoardDTO boardDTO) {
		//폼에서 가져온값 name pass subject content
		// num,readcount,date
		// num = max(num)+1
		if(boardDAO.getMaxNum()==null) {
			//게시판 글이 없음
			boardDTO.setBoardNum(1);
		}else {
			boardDTO.setBoardNum(boardDAO.getMaxNum() + 1);
		}
		
		System.out.println(boardDTO);
		
		boardDAO.insertBoard(boardDTO);
	}

	@Override
	public List<BoardDTO> getBoardList(PageDTO pageDTO) {
		// pageSize  pageNum  currentPage
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		// sql => limit #{startRow -1}, #{pageSize}
		
		pageDTO.setStartRow(startRow-1);
		pageDTO.setEndRow(endRow);
		
		return boardDAO.getBoardList(pageDTO);
		
	}

	@Override
	public int getBoardCount() {
		return boardDAO.getBoardCount();
	}
	@Override
	public BoardDTO getBoard(int boardNum) {
		return boardDAO.getBoard(boardNum);
	}

	@Override
	public BoardDTO numCheck(BoardDTO boardDTO) {
		return boardDAO.numCheck(boardDTO);
	}

	@Override
	public void updateBoard(BoardDTO boardDTO) {
		boardDAO.updateBoard(boardDTO);
	}

	@Override
	public void updateFile(BoardDTO boardDTO) {
		boardDAO.updateFile(boardDTO);
		
	}
	
	@Override
	public void deleteBoard(BoardDTO boardDTO) {
		boardDAO.deleteBoard(boardDTO);
	}
	

	@Override
	public BoardDTO PassCheck(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		return boardDAO.PassCheck(boardDTO);
	}

	@Override
	public ViewDTO viewcheck(ViewDTO viewDTO) {
		// TODO Auto-generated method stub
		return boardDAO.viewcheck(viewDTO);
	}

	@Override
	public void viewinsert(ViewDTO viewDTO) {
		boardDAO.viewinsert(viewDTO);
		
	}

	@Override
	public void viewup(int boardNum) {
		boardDAO.viewup(boardNum);
		
	}

	@Override
	public void rCountsub(int boardNum) {
		boardDAO.rCountsub(boardNum);		
	}

	@Override
	public void rCount(int boardNum) {
		boardDAO.rCount(boardNum);		
	}

	

//	@Override
//	public List<BoardDTO> searchBoard(SearchDTO boardDTO) {
//		// TODO Auto-generated method stub
//		return boardDAO.searchBoard(boardDTO);
//	}

	@Override
	public List<BoardDTO> searchBoard(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		return boardDAO.searchBoard(boardDTO);
	}

	

	

	
	
	

}
