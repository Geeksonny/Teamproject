package com.itwillbs.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.PointDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PointDTO;

@Service
public class PointServiceImpl implements PointService {

	@Inject
	private PointDAO pointDAO;
	//포인트 회원정보 가져오기
	@Override
	public PointDTO getMember(String userId) {
		return pointDAO.getMember(userId);
	}
	//포인트(아이디) 수 조회
	@Override
	public int getPointCount(String userId) {
		return pointDAO.getPointCount(userId);
	}

	//포인트 DB 저장
	@Override
	public void insertMember(PointDTO pointDTO) {
		pointDTO.setPointDate(new Timestamp(System.currentTimeMillis()));

		// max(num)+1
		if(pointDAO.getMaxNum()==null) {
			pointDTO.setPointNum(1);
		}else {
			pointDTO.setPointNum(pointDAO.getMaxNum()+1);
		}

		pointDAO.insertMember(pointDTO);
	}
	//포인트 충전 DB 저장
	@Override
	public void insertChargePoint(Map<String, Object> sMap) {
		pointDAO.insertChargePoint(sMap);
	}

	//포인트 날짜 리스트조회
	@Override
	public List<PointDTO> getPointCheckList(PageDTO pageDTO) {
		// pageSize  pageNum  currentPage
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;

		// sql => limit #{startRow -1}, #{pageSize}

		pageDTO.setStartRow(startRow-1);
		pageDTO.setEndRow(endRow);
		return pointDAO.getPointCheckList(pageDTO);
	}

}
