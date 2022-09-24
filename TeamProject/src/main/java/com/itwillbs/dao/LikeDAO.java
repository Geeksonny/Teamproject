package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.LikeDTO;

public interface LikeDAO {

	



	LikeDTO likeCheck(LikeDTO likeDTO);

	void insertLike(LikeDTO likeDTO);

	void deleteLike(LikeDTO likeDTO);

	void updateLike(BoardDTO boardDTO);

	void updateLikeCancel(BoardDTO boardDTO);

	List<LikeDTO> getLikeList(LikeDTO likeDTO);



	

	



}
