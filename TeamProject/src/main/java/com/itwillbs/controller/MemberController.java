package com.itwillbs.controller;

import java.math.BigInteger;
import java.security.SecureRandom;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MypageDTO;
import com.itwillbs.domain.PointDTO;
import com.itwillbs.mail.MailUtils;
import com.itwillbs.mail.TempKey;
import com.itwillbs.service.CommonService;
import com.itwillbs.service.CompService;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MypageService;
import com.itwillbs.service.PointService;

@Controller
public class MemberController {

	@Inject
	private MemberService memberService;
	@Inject
	private PointService pointService;
	@Inject
	private MypageService mypageService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	// 회원가입(유저)
	@RequestMapping(value = "/member/join", method = RequestMethod.GET)
	public String insert() {
		return "member/insertForm";
	}
	@RequestMapping(value = "/member/joinMemPro", method = RequestMethod.POST)
	public String insertPro(MypageDTO mypageDTO, MemberDTO memberDTO, PointDTO pointDTO, Model model) throws Exception {

		memberDTO.setUserPass(bcryptPasswordEncoder.encode(memberDTO.getUserPass()));

		memberService.insertMember(memberDTO);
		mypageService.insertMypage(mypageDTO);
		pointService.insertMember(pointDTO);
		model.addAttribute("memberDTO",memberDTO);
		model.addAttribute("pointDTO",pointDTO);
		return "redirect:/member/joinEmailCheck";
	}

	// 이메일 인증 요청
	@RequestMapping(value = "/member/joinEmailCheck", method = RequestMethod.GET)
	public String emailCheck(MemberDTO memberDTO, Model model) throws Exception{
		model.addAttribute("memberDTO",memberDTO);
		return "member/joinEmailCheck";
	}
	// 이메일 인증 완료
	@RequestMapping(value = "/member/joinSuccess", method = RequestMethod.GET)
	public String joinSuccess(MemberDTO memberDTO) throws Exception{
		memberService.updateEmailAuth(memberDTO);
		// 이메일 인증 성공 시 추가정보 입력 후 관심있는 운동에 대한 추천
		return "member/joinSuccess";
	}

	// 회원가입(업체)
	@RequestMapping(value = "/member/joinComp", method = RequestMethod.GET)
	public String insertComp() {
		// 주소변경없이 이동
		return "member/insertUserForm";
	}
	@RequestMapping(value = "/member/joinCompPro", method = RequestMethod.POST)
	public String insertCompPro(CompDTO compDTO) {
		// 메서드 호출
		memberService.insertComp(compDTO);

		// 주소변경 이동
		return "redirect:/member/login";
	}

	// 로그인(유저)
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login(Model model, HttpSession session) {
    	String clientId = "J1pjWpChS9vxGVOirvL0";//애플리케이션 클라이언트 아이디값";
        String redirectURI = "http://localhost:8080/web/auth/naver";
        SecureRandom random = new SecureRandom();
        String state = new BigInteger(130, random).toString();

        String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
        apiURL += "&client_id=" + clientId;
        apiURL += "&redirect_uri=" + redirectURI;
        apiURL += "&state=" + state;
        model.addAttribute("naver_url",apiURL);
		return "member/login";
	}
	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
	// jsp는 세션이 자동으로 만들어지지만 자바는 HttpSession으로 만들어야한다
	public String loginPro(MemberDTO memberDTO, HttpSession session, HttpServletRequest request) throws Exception {
		// 메서드 호출
		MemberDTO memberDTO2=memberService.userCheck(memberDTO);

        // 이메일 인증유무 확인 후 1이 아닌 경우, 인증확인 메세지
        if (memberService.emailAuthFail(memberDTO.getUserId()) != 1) {
            return "/member/emailAuthFail";
        }
        // 휴면 계정이면 상태 바꾸고 체크하기
        memberService.changeStatus(memberDTO);
        if (memberService.statusCheck(memberDTO.getUserId()) == 1) {
        	return "member/statusmsg";
        }
        // 아이디 비밀번호 일치하지 않으면 오류 메세지 출력
        if(memberDTO2 != null && bcryptPasswordEncoder.matches(memberDTO.getUserPass(), memberDTO2.getUserPass())) {
	        // 로그인 세션값 생성
	        session.setAttribute("userId", memberDTO.getUserId());
	        // 마지막 로그인
	        memberService.loginCheck(memberDTO);
        } else {
        	return "/member/msg";
        }

        PointDTO pointDTO = pointService.getMember(memberDTO.getUserId());
        session.setAttribute("pointDTO",pointDTO);
		// main/main 이동
		return "redirect:/main/main";
	}
	// 로그인 경고 메세지
	@RequestMapping(value = "/member/msg", method = RequestMethod.GET)
	public String msg() {
		return "member/msg";
	}
	// 로그인(업체)
	@RequestMapping(value = "/member/loginCompPro", method = RequestMethod.POST)
	public String loginCompPro(CompDTO compDTO, HttpSession session) {
		CompDTO compDTO2=memberService.compCheck(compDTO);
		if(compDTO2!=null) {
			session.setAttribute("compId", compDTO.getCompId());

			return "redirect:/main/main";
		}else {
			return "/member/msg";
		}
	}

	// 아이디 찾기 페이지
	@RequestMapping(value = "/member/loginIdSearch", method = RequestMethod.GET)
	public String idSearch(MemberDTO memberDTO, Model model) throws Exception{
		return "member/loginIdSearch";
	}
	// 아이디 찾기
	@ResponseBody
	@RequestMapping(value = "/member/idSearchPro", method = RequestMethod.POST)
	public String idSearchPro(@ModelAttribute MemberDTO memberDTO, HttpServletResponse response) {
		String result = "";
		if(memberService.idSearch(memberDTO)==null) {	// 아이디가 널이 아닌 경우
			result = "no";
		}else {											// 아이디 있으면 아이디 출력
			result = memberService.idSearch(memberDTO).substring
					(0, memberService.idSearch(memberDTO).length() - 4)+"****";
		}
		return result;
	}
	// 비밀번호 찾기
	@RequestMapping(value = "/member/passSearch", method = RequestMethod.GET)
	public String findPass() throws Exception{
		return "member/loginPassSearch";
	}
	@RequestMapping(value = "/member/passSearchPro", method = RequestMethod.POST)
	public String loginPassSearchPro(@ModelAttribute MemberDTO memberDTO, HttpServletResponse response) throws Exception{
		if(memberService.pwCheck(memberDTO)==null){
			return "member/msg";
		}
		memberService.updatePass(memberDTO);
		return "redirect:/member/login";
	}


	// 로그아웃
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		// 세션값 초기화
		session.invalidate();
		// /member/main 이동
		// 주소변경 이동
		return "redirect:/main/main";
	}

	// 메인
	@RequestMapping(value = "/main/main", method = RequestMethod.GET)
	public String indexMain() {
		return "main/main";
	}

	@RequestMapping(value = "/basic/basic-badge-button", method = RequestMethod.GET)
	public String basicBasicBadgeButton() {
		return "basic/basic-badge-button";
	}
	@RequestMapping(value = "/basic/basic-form", method = RequestMethod.GET)
	public String basicBasicForm() {
		return "basic/basic-form";
	}
	@RequestMapping(value = "/basic/basic-menu-table", method = RequestMethod.GET)
	public String basicBasicMenuTable() {
		return "basic/basic-menu-table";
	}

	@RequestMapping(value = "/member/cards-basic", method = RequestMethod.GET)
	public String memberCardsBasic() {
		return "basic/cards-basic";
	}
	@RequestMapping(value = "/member/form-layouts-horizontal", method = RequestMethod.GET)
	public String memberFormLayoutsHorizontal() {
		return "basic/form-layouts-horizontal";
	}
	@RequestMapping(value = "/member/form-layouts-vertical", method = RequestMethod.GET)
	public String memberFormLayoutsVertical() {
		return "basic/form-layouts-vertical";
	}
	@RequestMapping(value = "/member/forms-basic-inputs", method = RequestMethod.GET)
	public String memberFormBasicInputs() {
		return "basic/forms-basic-inputs";
	}
	@RequestMapping(value = "/member/forms-input-groups", method = RequestMethod.GET)
	public String memberFormInputGroups() {
		return "basic/forms-input-groups";
	}
	@RequestMapping(value = "/member/tables", method = RequestMethod.GET)
	public String memberTables() {
		return "basic/tables";
	}
	@RequestMapping(value = "/member/ui-buttons", method = RequestMethod.GET)
	public String memberUiButtons() {
		return "basic/ui-buttons";
	}
	@RequestMapping(value = "/member/ui-pagination", method = RequestMethod.GET)
	public String memberUiPagination() {
		return "basic/ui-pagination";
	}







}