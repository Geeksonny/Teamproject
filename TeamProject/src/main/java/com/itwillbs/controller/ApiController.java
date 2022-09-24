package com.itwillbs.controller;

import java.io.IOException;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.protobuf.TextFormat.ParseException;
import com.itwillbs.dao.GoogleOAuthRequest;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.ApiService;
import com.itwillbs.service.MemberService;

@Controller
public class ApiController {

	@Inject
	private MemberService memberService;
//	@Inject
//	GoogleOAuthRequest googleOAuthRequest;
//
//	// 구글 로그인 호출
//	@RequestMapping(value = "/auth/getGoogleAuthUrl", method = RequestMethod.GET)
//	public @ResponseBody String getGoogleAuthUrl(HttpServletRequest request) throws Exception {
//	    String reqUrl = googleLoginUrl + "/o/oauth2/v2/auth?client_id=" + googleClientId + "&redirect_uri=" + googleRedirecUrl
//	            + "&response_type=code&scope=email%20profile%20openid&access_type=offline";
//
//	    return reqUrl;
//	}

	// 구글 연동정보 조회
//	@RequestMapping(value = "/auth/google", method = RequestMethod.GET)
//	public String oauth_google(HttpServletRequest request, @RequestParam(value = "code") String authCode, HttpServletResponse response) throws Exception {
//
//	    // restTemplate 호출
//	    RestTemplate restTemplate = new RestTemplate();
//
//	    GoogleOAuthRequest googleOAuthRequestParam = GoogleOAuthRequest
//	            .builder()
//	            .clientId(googleClientId)
//	            .clientSecret(googleClientSecret)
//	            .code(authCode)
//	            .redirectUri(googleRedirectUrl + "/login/oauth_google")
//	            .grantType("authorization_code")
//	            .build();
//
//	    ResponseEntity<JSONObject> apiResponse = restTemplate.postForEntity(googleAuthUrl + "/token", googleOAuthRequestParam, JSONObject.class);
//	    JSONObject responseBody = apiResponse.getBody();
//
//	    //   id_token은 jwt 형식
//	    String jwtToken = responseBody.getString("id_token");
//	    String requestUrl = UriComponentsBuilder.fromHttpUrl(googleAuthUrl + "/tokeninfo").queryParam("id_token", jwtToken).toUriString();
//
//	    JSONObject resultJson = restTemplate.getForObject(requestUrl, JSONObject.class);
//
//	    // 구글 정보조회 성공
//	    if (resultJson != null) {
//
//	        //  회원 고유 식별자
//	        String googleUniqueNo = resultJson.getString("sub");
//
//
//	            /**
//
//	        	TO DO : 리턴받은 googleUniqueNo 해당하는 회원정보 조회 후 로그인 처리 후 메인으로 이동
//
//	            */
//
//
//	    // 구글 정보조회 실패
//	    } else {
//	        throw new ErrorMessage("구글 정보조회에 실패했습니다.");
//	    }
//
//	}

	// 카카오 콜백
	@RequestMapping(value = "/auth/kakao", method = RequestMethod.GET)
	public String kakaoLogin(String code, HttpSession session, MemberDTO memberDTO) throws Exception{
		ApiService apiService = new ApiService();
		String token = apiService.getToken(code);
		Map<String, String> kakaoMap = apiService.getUserInfo(token);

		String userId = kakaoMap.get("user_id");
		String userNm = kakaoMap.get("user_name");
		String userType = kakaoMap.get("user_type");

		memberDTO.setUserId(userId);
		memberDTO.setUserNm(userNm);
		memberDTO.setUserType(userType);
		memberDTO.setUserKakaoLogin(1);

		setSession(session, memberDTO, userId, userNm, userType);

		return "redirect:/main/main";
	}

	// 카카오 회원가입
	private void setSession(HttpSession session, MemberDTO memberDTO, String user_id, String user_name, String user_type) throws Exception{
		memberDTO.setUserId(user_id);
		memberDTO.setUserNm(user_name);
		memberDTO.setUserType(user_type);
		MemberDTO mt=newMemberDTO(user_id, user_name, user_type);
		MemberDTO memberDTO2=memberService.userCheck(memberDTO);
		if(memberDTO2 == null) {
			memberService.insertMember(mt);
			memberDTO2.setUserId(user_id);
			memberDTO2.setUserNm(user_name);
			memberDTO2.setUserType(user_type);
		}
		session.setAttribute("userId", memberDTO.getUserId());
	}

	private MemberDTO newMemberDTO(String user_id, String user_name, String user_type) {

		MemberDTO memberDTO = new MemberDTO();
		if(user_name == null || "".equals(user_name)) {
			user_name = "익명";
		}
		memberDTO.setUserId(user_id);
		memberDTO.setUserNm(user_name);
		memberDTO.setUserType(user_type);
		return memberDTO;
	}

	// 네이버 콜백
//	@RequestMapping(value = "/auth/naver", method = RequestMethod.GET)
//	public String naverLogin(String code, HttpSession session, MemberDTO memberDTO) throws Exception{
//		return "member/naverlogin";
//	}
	@RequestMapping(value = "/auth/naver", method = RequestMethod.GET)
	public String naverCallback(HttpSession session) {
		return "member/naverLogin";
	}

	@RequestMapping(value = "/auth/naverlogin", method = RequestMethod.GET)
	public String naverlogin(HttpServletRequest request, HttpSession session) throws Exception {
		String userId = request.getParameter("userId");
		String userNm = request.getParameter("userNm");
		String userType = request.getParameter("userType");

		MemberDTO memberDTO = new MemberDTO();

		setSession(session, memberDTO, userId, userNm, userType);

		return "redirect:/main/main";
	}
}