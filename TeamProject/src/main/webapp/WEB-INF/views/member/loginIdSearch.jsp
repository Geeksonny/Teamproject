<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script type="text/javascript"
src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

	// 아이디 찾기
	$(document).ready(function(){
		$('#searchId').click(function(){
			$.ajax({
				url:'${pageContext.request.contextPath }/member/idSearchPro',
				type:'POST',
				data:{'userNm':$('#userNm').val(),'userEmail':$('#userEmail').val()},
				success:function(rdata){
				var result="";
				 if(rdata=="no"){	// 아이디 없음
					result="아이디가 없습니다";
			 	}else{				// 아이디 있음
			 		result="찾으시는 아이디는 "+ rdata +" 입니다";
			 	}
			 	$('#resultId').html(result);
				}
			});
		});
	});

</script>
</head>
<body>
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
                            <h2>ID 찾기</h2><br>
                            <h5>회원가입 시 기입했던 이름과 이메일을 적어주세요!</h5>
                        </div>
                        <hr><br>
                        <ul>
                        	<li>
                                <div class="row">
                                <div class="col-lg-6 col-md-6">
                                	<button type="button" class="site-btn btn-lg w-100" onclick="location.href='${pageContext.request.contextPath }/member/login'">로그인 페이지로</button>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                	<button type="button" class="site-btn btn-lg w-100" onclick="location.href='${pageContext.request.contextPath }/member/loginPassSearch'">비밀번호 찾기</button><br>
                                </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

				<!-- ID 찾기 -->
                <div class="col-lg-6 col-md-6  bd-example">
		              <div class="checkout__order">
						<main class="form-signin ">
						  <form method="post">
		                    <div class="checkout__input">
		                     <label for="userNm">
		                        이름
		                     </label>
		                        <input type="text" id="userNm" name="userNm" placeholder="이름">
		                    </div>
		                    <div class="checkout__input">
		                  	 <label for="userEmail">
		                        이메일
		                     </label>
		                        <input type="email" id="userEmail" name="userEmail" placeholder="이메일">
		                    </div>
						     <input type="button" class="site-btn w-100 btn-lg" value="ID 찾기" id="searchId"><br>
						  </form><br>
						  <div id="resultId" class= "text-center">
						  </div>
						</main>
		         	</div>
                </div>
        	</div>
    	</div>
    </section>
    <!-- Contact Section End -->



    <!-- Footer -->
    <jsp:include page="../inc/footer.jsp"/>
</body>
<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</html>