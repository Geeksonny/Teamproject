package com.itwillbs.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.dao.PointDAO;
import com.itwillbs.dao.PointDAOImpl;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PointDTO;
import com.itwillbs.function.FunctionClass;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.PointService;
import com.itwillbs.service.PointServiceImpl;
import com.siot.IamportRestClient.IamportClient;


@Controller
public class PointController {
//	@ResponseBody
//	@RequestMapping(value = "/verify_iamport/{imp_uid}", method = RequestMethod.POST)
//	public IamportResponse<Payment> verifyIamportPOST(@PathVariable(value = "imp_uid") String imp_uid) throws IamportResponseException, IOException {
//	    return client.paymentByImpUid(imp_uid);
//	}

	@Inject
	private PointService pointService;

	private PointDAO pointDAO;

	@Inject
	private MemberService memberService;

	private IamportClient api;
	public PointController() {
	      // REST API 키와 REST API secret 입력
	      this.api = new IamportClient("6077548071335284", "dCktE2HC7a2YUwzkDWeeqfuZvZdDen3Sm66vMQja5xQTpoAsMz9YUPZ42kuSyxReMbEXbvtEvOjllVjQ");
	}

	// 포인트 충전 DB저장
	 @ResponseBody
	   @RequestMapping(value="/point/insertChargePoint", method = RequestMethod.POST)
	   public String paymenByImpUid (HttpSession session, HttpServletRequest request, @RequestParam Map<String, Object> para){
	      Map<String, Object> sMap = para;
	      sMap.put("userId", (String)session.getAttribute("userId"));
	      sMap.put("pointType", request.getParameter("pointType"));
	      sMap.put("pointDate", new FunctionClass().nowTime("yyyy-MM-dd HH:mm:ss"));
	      System.out.println(sMap);
	      pointService.insertChargePoint(sMap);

	      return "redirect:/main/main";
	 }

}
