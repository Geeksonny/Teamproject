<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 네이버로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- <script type="text/javascript"> -->
<!-- // 구글 로그인 버튼 클릭 -->
<!-- function loginWithGoogle() { -->
<!--     $.ajax({ -->
<%--         url: '${pageContext.request.contextPath }/auth/getGoogleAuthUrl', --%>
<!--         type: 'get', -->
<!--     }).done(function (res) { -->
<!--         location.href = res; -->
<!--     }); -->
<!-- } -->
<!-- </script> -->
</head>
<body>
<!-- 메뉴단 -->
<jsp:include page="../inc/menu.jsp"/>

    <!-- 헤더단(광고같은 거 들어가도 됨) -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>로그인</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <span>Login</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

	<!--  내용 -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="contact__text">
                        <div class="section-title">
                            <h2>로그인</h2><br>
                            <h5>회원가입 시 기입했던 ID와 이메일을 적어주세요!</h5>
                        	<hr><br>
                        	<h4>SNS 로그인</h4><br>

								<!--     네이버 로그인 -->
								<div class="mr-3" id="naver_id_login" style="display:inline-block;"></div>
								<!--     카카오 로그인 -->
							    <a href="https://kauth.kakao.com/oauth/authorize?client_id=d7b448253a75eb1ebba5ccf3936ad5ea&redirect_uri=http://localhost:8080/web/auth/kakao&response_type=code">
							    	<img src="${pageContext.request.contextPath}/resources/img/kakao_login_medium_wide.png" style="width: 70px; height: 70px">
							    </a>
							    <!--     구글 로그인 -->
<%-- 							    	<img onclick="loginWithGoogle()" src="${pageContext.request.contextPath}/resources/img/oauth_google.png" style="width: 70px; height: 70px; cursor: pointer;"> --%>
							<br><br>
                        <ul>
                        	<li>
                            	<button type="button" class="site-btn btn-lg w-100" onclick="location.href='${pageContext.request.contextPath }/member/join'">회원가입</button>
                            </li>
                        </ul>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 col-md-6  bd-example">
			        <nav>
			          <div class="nav nav-tabs" id="nav-tab" role="tablist">
			            <button class="nav-link active" id="user-insert-tab" data-bs-toggle="tab" data-bs-target="#user-insert" type="button" role="tab" aria-controls="user-insert" aria-selected="true">일반</button>
			            <button class="nav-link" id="comp-insert-tab" data-bs-toggle="tab" data-bs-target="#comp-insert" type="button" role="tab" aria-controls="comp-insert" aria-selected="false">업체</button>
			          </div>
			        </nav>
			        	<div class="tab-content" id="nav-tabContent">
						<!-- 회원 로그인 -->

         					 <div class="tab-pane fade show active" id="user-insert" role="tabpanel" aria-labelledby="user-insert-tab">
				                <div class="checkout__order">
								<main class="form-signin ">
								  <form action="${pageContext.request.contextPath }/member/loginPro" method="post">
				                    <div class="checkout__input">
				                     <label for="userId">
				                        ID
				                     </label>
				                        <input type="text" id="userId" name="userId" placeholder="ID">
				                    </div>
				                    <div class="checkout__input">
				                  	 <label for="userPass">
				                        비밀번호
				                     </label>
				                        <input type="password" id="userPass" name="userPass" placeholder="비밀번호">
				                    </div>
								     <button type="submit" class="site-btn w-100 btn-lg">로그인</button><br>
								  </form><br>
								  <div class= "text-center">
								  	<a href="${pageContext.request.contextPath }/member/loginIdSearch" class="loginIdSearch">ID 찾기</a> &nbsp; &nbsp; | &nbsp; &nbsp;
								  	<a href="${pageContext.request.contextPath }/member/passSearch" class="loginPassSearch">비밀번호 찾기</a>
								  </div>
								  <div id="idCheck"></div>
								</main>
								</div>



				         	</div>
				         	<!-- 업체 로그인 -->
         					 <div class="tab-pane fade" id="comp-insert" role="tabpanel" aria-labelledby="comp-insert-tab">
				                <div class="checkout__order">
								<main class="form-signin ">
								  <form action="${pageContext.request.contextPath }/member/loginCompPro" method="post">
				                    <div class="checkout__input">
				                     <label for="compId">
				                        업체 ID
				                     </label>
				                        <input type="text" id="compId" name="compId" placeholder="업체 ID">
				                    </div>
				                    <div class="checkout__input">
				                  	 <label for="compPass">
				                        비밀번호
				                     </label>
				                        <input type="password" id="compPass" name="compPass" placeholder="비밀번호">
				                    </div>
<!-- 				                     <input type="hidden" name="compType" placeholder="멤버 타입"> -->
								     <button type="submit" class="site-btn w-100 btn-lg">로그인</button><br>
								  </form>
								</main>
								</div>
				         	</div>
				         	</div>
                  </div>
        	</div>
    	</div>
    </section>
    <!-- Contact Section End -->



    <!-- Footer -->
    <jsp:include page="../inc/footer.jsp"/>
</body>

<!-- // 네이버 로그인 버튼 노출 영역 -->
<script type="text/javascript">
    var naver_id_login = new naver_id_login("J1pjWpChS9vxGVOirvL0", "http://localhost:8080/web/auth/naver");
    var state = naver_id_login.getUniqState();
    naver_id_login.setButton("green", 1, 70);
    naver_id_login.setDomain("http://localhost:8080/");
    naver_id_login.setState(state);
    naver_id_login.init_naver_id_login();
</script>
<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</html>