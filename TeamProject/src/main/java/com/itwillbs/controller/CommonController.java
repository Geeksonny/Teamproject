package com.itwillbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.CommonDTO;
import com.itwillbs.service.CommonService;

@Controller
public class CommonController {

	@Inject
	private CommonService commonService;

	@RequestMapping(value = "/common/selectOptionList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> List(HttpServletRequest req, HttpServletResponse res, @ModelAttribute CommonDTO commonDTO) {

		Map<String, Object> map = new HashMap<>();

		try {
			List<CommonDTO> commonList =  commonService.selectCommonList(commonDTO);
			map.put("code", "S");
			map.put("commonList", commonList);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return map;
    }

}
