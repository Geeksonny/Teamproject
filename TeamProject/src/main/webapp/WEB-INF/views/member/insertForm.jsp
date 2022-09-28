<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- 아이디 중복검사 -->
<script type="text/javascript"
src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

	var checkIdResult = false;			// 아이디 중복확인 여부
	var checkPassResult = false;		// 패스워드 검사
	var checkRetypePassResult = false;	// 패스워드 확인 결과
	var checkNameResult = false;
	var checkEmailResult = false;

	function checkPass(password){
			// 패스워드 검사를 위한 정규표현식 패턴 작성 및 검사 결과에 따른 변수값 변경
		var spanElem = document.getElementById("checkPassResult");

		// 정규표현식 패턴 정의
		var lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/; // 길이 및 사용 가능 문자 규칙
		var engLowerRegex = /[a-z]/;	// 소문자
		var numRegex = /[0-9]/;		// 숫자 규칙
		var specRegex = /[!@#$%]/;	// 특수문자 규칙

		var count = 0;	// 각 규칙별 검사 결과를 카운팅 할 변수

		if(lengthRegex.exec(password)){	// 패스워드 길이 및 사용 가능 문자 규칙 통과 시
			$('#userPass').removeClass("is-invalid");
			$('#userPass').addClass("is-valid");
// 			spanElem.innerHTML = "사용 가능한 패스워드";
// 			spanElem.style.color = "GREEN";

			// 각 규칙별 검사 후 해당 항목이 포함되어 있을 경우 카운트 증가
			if(engLowerRegex.exec(password)) count++;
			if(numRegex.exec(password)) count++;
			if(specRegex.exec(password)) count++;

			switch(count){
			case 3: // 특수문자, 대문자, 소문자, 숫자 중 3개를 만족
				$('#userPass').removeClass("is-invalid");
				$('#userPass').addClass("is-valid");
				spanElem.innerHTML = '';
				checkPassResult = true;
				break;
			case 2: // 특수문자, 대문자, 소문자, 숫자 중 2개를 만족
				$('#userPass').removeClass("is-valid");
				$('#userPass').addClass("is-invalid");
				spanElem.innerHTML = '';
// 				spanElem.innerHTML = '"보안 강도 : 보통"';
// 				spanElem.style.color = "ORANGE";
				checkPassResult = true;
				break;
			default:
				$('#userPass').removeClass("is-valid");
				$('#userPass').addClass("is-invalid");
				spanElem.innerHTML = '영문자, 숫자, 특수문자 중 2가지 이상 조합 필수!';
				spanElem.style.color = "#dc3545";
				checkPassResult = false;
			}
		} else {
				//spanElem.innerHTML = "사용 불가능한 패스워드";
				$('#userPass').removeClass("is-valid");
				$('#userPass').addClass("is-invalid");
			spanElem.innerHTML = '영문자, 숫자, 특수문자 조합 8 ~ 16자리 필수!';
			spanElem.style.color = "#dc3545";
			checkPassResult = false;
		}

	}

	function checkRetypePass(userPass2){
		var pass = document.userForm.userPass.value;
		var spanElem = document.getElementById("checkRetypePassResult");
		if(pass == userPass2){	// 패스워드 일치
// 			spanElem.innerHTML = "패스워드 일치";
// 			spanElem.style.color = "GREEN";
			checkRetypePassResult = true;
			$('#userPass2').removeClass("is-invalid");
			$('#userPass2').addClass("is-valid");
		} else {	// 패스워드 불일치
// 			spanElem.innerHTML = "패스워드 불일치";
// 			spanElem.style.color = "#dc3545"
			checkRetypePassResult = false;
			$('#userPass2').removeClass("is-valid");
			$('#userPass2').addClass("is-invalid");
		}

	}

	function checkName(userNm) {
		var spanElem = document.getElementById("checkNameResult");

		var lengthRegex = /^[가-힣]{2,5}$/;

		if(lengthRegex.exec(userNm)){
// 			spanElem.innerHTML = "이름 형식 일치";
// 			spanElem.style.color = "GREEN";'
			$('#userNm').removeClass("is-invalid");
			$('#userNm').addClass("is-valid");
			checkNameResult = true;
		} else {
// 			spanElem.innerHTML = "이름 형식 불일치";
// 			spanElem.style.color = "RED";
			$('#userNm').removeClass("is-valid");
			$('#userNm').addClass("is-invalid");
			checkNameResult = false;
		}

	}

	function checkSubmit(){

// 				!checkIdResult){
// 			alert("아이디 중복확인 필수!");
// 			document.userForm.id.focus();
// 			return false;
		if (document.userForm.userId.value == "") {
			alert("아이디를 입력해 주세요!");
			document.userForm.userId.focus();
			return checkIdResult = false;
		} else if(!checkPassResult){
			alert("올바른 패스워드 입력 필수!");
			document.userForm.userPass.focus();
			return false;
		} else if(!checkRetypePassResult){
			alert("패스워드 확인 필수!");
			document.userForm.userPass2.focus();
			return false;
		} else if (!checkNameResult) {
			alert("이름 입력 필수!");
			document.userForm.userNm.focus();
			return false;
// 		}else if (!checkEmailResult) {
// 			alert("이메일 입력 필수!");
// 			document.userForm.userEmail.focus();
// 			return false;
		}


		return true;
	}

// 회원 타입 선택
$(document).ready(function(){
	 $("form[name=compForm]").hide();

 $("input:radio[name=memberType]").click(function(){

     if($("input[name=memberType]:checked").val() == "2"){
         $("form[name=compForm]").show();
         $("form[name=userForm]").hide();
         // radio 버튼의 value 값이 1이라면 활성화

     }else if($("input[name=memberType]:checked").val() == "1"){
           $("form[name=userForm]").show();
           $("form[name=compForm]").hide();
         // radio 버튼의 value 값이 0이라면 비활성화
     }
 });
});

// 아이디 중복 체크
function uidCheck(){

	$.ajax({
		url:'${pageContext.request.contextPath }/member/idDupCheck',
		data:{'userId':$('#userId').val()},
		type: 'POST',
		success:function(rdata){
			if(rdata=='iddup'){	// 아이디가 중복이거나 글자 수 넘억
				$('#userId').addClass("is-invalid");
				$('#userId').removeClass("is-valid");
			}else{
				$('#userId').addClass("is-valid");
				$('#userId').removeClass("is-invalid");
			}
		}
	});

};

// 이메일 중복 체크
function uemailCheck(){

	$.ajax({
		url:'${pageContext.request.contextPath }/member/mailDupCheck',
		data:{'userEmail':$('#userEmail').val()},
		type: 'POST',
		success:function(rdata){
			if(rdata=='emaildup'){
				$('#userEmail').addClass("is-invalid");
				$('#userEmail').removeClass("is-valid");
			}else{
				$('#userEmail').addClass("is-valid");
				$('#userEmail').removeClass("is-invalid");
			}
		}
	});

};

// 사업자 등록번호
$(document).ready(function () {
   $(function () {

            $('#compRegNum').keydown(function (event) {
             var key = event.charCode || event.keyCode || 0;
             $text = $(this);
             if (key !== 8 && key !== 9) {
                 if ($text.val().length === 3) {
                     $text.val($text.val() + '-');
                 }
                 if ($text.val().length === 6) {
                     $text.val($text.val() + '-');
                 }
             }

             return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
			 // Key 8번 백스페이스, Key 9번 탭, Key 46번 Delete 부터 0 ~ 9까지, Key 96 ~ 105까지 넘버패트
			 // => JQuery 0-9 숫자 백스페이스, 탭, Delete 키 넘버패드외에는 입력못함
         })
   });

});

</script>
</head>
<body class="bg-light">
<!-- 메뉴단 -->
<jsp:include page="../inc/menu.jsp"/>

	<!--  내용 -->
    <div class="container-sm py-5 col-md-7 col-sm-6 text-center">
      <section id="forms">
    	<h2 class="fw-bold pt-3 pt-xl-5 pb-2 pb-xl-3">회원가입</h2>

		<div class="mt-2 mb-2">
			<input type="radio" name="memberType" id="user" value="1" checked> <label for="user">회원</label> &nbsp; &nbsp; &nbsp; &nbsp;
			<input type="radio" name="memberType" id="comp" value="2"> <label for="comp">업체</label>
		</div>

<!-- 일반 회원 가입 -->
        <form class=form-signin action="${pageContext.request.contextPath }/member/joinMemPro" name=userForm method="post" onsubmit="return checkSubmit()">
      <div>
        <div class="bd-example">
          <div class="form-floating mb-3">
            <input type="text" class="form-control" name="userId" id="userId" placeholder="ID" onkeyup="uidCheck(this.value)">
            <label for="userId">ID</label>
          </div>
           <div class="form-floating mb-3">
            <input type="text" class="form-control" name="userNm" id="userNm" placeholder="홍길동" onkeyup="checkName(this.value)">
            <span class="mt-1" id="checkNameResult"><!-- 이름 형식 일치 여부 표시  --></span>
            <label for="userNm">이름</label>
          </div>
           <div class="form-floating mb-3">
            <input type="text" class="form-control" name="userNicknm" id="userNicknm" placeholder="홍길동" >
            <label for="userNicknm">닉네임</label>
          </div>
          <div class="form-floating mb-3">
            <input type="email" class="form-control" name="userEmail" id="userEmail" placeholder="name@example.com" onkeyup="uemailCheck(this.value)">
            <label for="userEmail">이메일 주소</label>
          </div>
          <div class="form-floating mb-3">
            <input type="password" class="form-control" name="userPass" id="userPass" placeholder="Password" onkeyup="checkPass(this.value)">
            <span id="checkPassResult"><!-- 패스워드 규칙 판별 결과 표시  --></span>
            <label for="userPass">비밀번호</label>
          </div>
          <div class="form-floating mb-3">
            <input type="password" class="form-control" name=userPass2 id="userPass2" placeholder="Password" onkeyup="checkRetypePass(this.value)">
			<span id="checkRetypePassResult"><!-- 패스워드 일치 여부 표시  --></span>
            <label for="userPass2">비밀번호 확인</label>
          </div>
        </div>
      </div>
      <input type="hidden" name="userType" id="userType" value="1">
            <div class="mb-3">
              <input class="form-check-input is-invalid" type="checkbox" value="" id="invalidCheck3" required>
              <label class="form-check-label" for="invalidCheck3">
                개인정보 수집에 동의합니다.
              </label>

            </div>
          <div class="mb-3">
            <button class="site-btn w-100 btn-lg" type="submit">회원가입</button>
          </div>
       	   </form>

 <!-- 업체 회원 가입 -->
        <form class=form-signin action="${pageContext.request.contextPath }/member/joinCompPro" name=compForm method="post">
      <div>
        <div class="bd-example">
          <div class="form-floating mb-3">
            <input type="text" class="form-control" name="compId" id="compId" placeholder="ID" onkeyup="cidCheck(this.value)">
            <label for="userId">ID</label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" class="form-control" name="compNm" id="compNm" placeholder="상호명">
            <label for="compNm">상호명</label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" class="form-control" name="compRegNum" id="compRegNum" placeholder="123-45-67890" maxlength="12">
            <label for="userEmail">사업자 등록번호</label>
          </div>
          <div class="form-floating mb-3">
            <input type="password" class="form-control" name="compPass" id="compPass" placeholder="Password">
            <label for="userPass">비밀번호</label>
          </div>
          <div class="form-floating mb-3">
            <input type="password" class="form-control" name="compPass2" id="compPass2" placeholder="Password">
            <label for="userPass2">비밀번호 확인</label>
          </div>
        </div>
      </div>
      <input type="hidden" name="userType" id="userType" value="1">
            <div class="mb-3">
              <input class="form-check-input is-invalid" type="checkbox" value="" id="invalidCheck3" required>
              <label class="form-check-label" for="invalidCheck3">
                개인정보 수집에 동의합니다.
              </label>

            </div>
          <div class="mb-3">
            <button class="site-btn w-100 btn-lg" type="submit">회원가입</button>
          </div>
       	   </form>

		</section>
	</div>


    <!-- Footer -->
    <jsp:include page="../inc/footer.jsp"/>
</body>

    <!-- 부트스트랩 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>