package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.CommonDTO;
import com.itwillbs.domain.PageDTO;

public interface CommonDAO {

	List<CommonDTO> selectCommonList(CommonDTO commonDTO);

	CommonDTO selectCodeSearch(CommonDTO commonDTO);

	// 카운트
	int getCount(CommonDTO commonDTO);

}
