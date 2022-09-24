package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.CommonDTO;
import com.itwillbs.domain.PageDTO;

public interface CommonService {

	public List<CommonDTO> selectCommonList(CommonDTO commonDTO);

	public CommonDTO selectCodeSearch(CommonDTO commonDTO);

	// 카운트
	int getCount(CommonDTO commonDTO);


}
