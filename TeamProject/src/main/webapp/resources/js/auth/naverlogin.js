/**
 *
 */
     var naver_id_login = new naver_id_login("J1pjWpChS9vxGVOirvL0", "http://localhost:8080/web/auth/naver");
	 // 네이버 사용자 프로필 조회
	 naver_id_login.get_naver_userprofile("naverSignInCallback()");
	 // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
 function naverSignInCallback() {
 	var userId = naver_id_login.getProfileData('email');
 	var userNm = naver_id_login.getProfileData('name');
 	location.href='naverlogin?userId='+userId+'&userNm='+userNm+'&userType=1'
}