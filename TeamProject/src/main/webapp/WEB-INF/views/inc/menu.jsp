<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<meta charset="UTF-8">
	<meta name="description" content="Male_Fashion Template">
	<meta name="keywords" content="Male_Fashion, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>핏티드</title>

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

	<!-- Css Styles -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/popup-charge.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/magnific-popup.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">

	<!-- JS -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript">
	// 팝업 띄우기
	function openPop() {
	    document.getElementById("popup_layer").style.display = "block";

	}
	// 팝업 닫기
	function closePop() {
	    document.getElementById("popup_layer").style.display = "none";
	}
	</script>

	<!-- CSS -->
	<style>
	#searchMain {
		border: none;
		background-color: #f5f5f9;
		color: #495057;
		border-radius: 1.5rem;
		height: 3em;
	}

	#li {
		font-size: 20px;
	    color: #4ACBAB;
	    display: block;
	    font-weight: 900;
	    position: relative;
	    padding: 3px 0;
	}
	</style>

</head>
<!-- 페이지 로더 -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- 회원메뉴단(모바일) -->
<div class="offcanvas-menu-overlay"></div>
<div class="offcanvas-menu-wrapper">
    <div class="offcanvas__option">
        <div class="offcanvas__links">

			<c:choose>
				<c:when test="${ !(empty sessionScope.userId) && sessionScope.userId ne 'admin'}">
					<!-- sessionScope 아이디가 userId에 admin이 아닐 경우 환영글 / 로그아웃 -->
						<a href="${pageContext.request.contextPath }/mypage">마이페이지</a>
						<a href="${pageContext.request.contextPath }/member/logout">로그아웃</a>
				</c:when>
				<c:when test="${ !(empty sessionScope.compId )}">
					<!-- sessionScope 아이디가 compId에 admin이 아닐 경우 마이페이지 -->
						<a href="${pageContext.request.contextPath }/comp/compMain">업체페이지</a>
						<a href="${pageContext.request.contextPath }/member/logout">로그아웃</a>
				</c:when>
				<c:when test="${ !(empty sessionScope.userId) && sessionScope.userId eq 'admin'}">
					<!-- sessionScope 아이디가 admin일 경우 관리자페이지 -->
						<a href="${pageContext.request.contextPath }/adminpage">관리자페이지</a>
						<a href="${pageContext.request.contextPath }/member/logout">로그아웃</a>
				</c:when>
				<c:otherwise>
					<!-- sessionScope 아이디가 비어있는 경우 로그인 / 회원가입 -->
					<a href="${pageContext.request.contextPath }/member/login">로그인</a>
					<a href="${pageContext.request.contextPath }/member/join">회원가입</a>
				</c:otherwise>
			</c:choose>

        </div>
        <div class="offcanvas__top__hover">
        </div>
    </div>
    <div class="offcanvas__nav__option">
        <a href="#" class="search-switch"><img src="${pageContext.request.contextPath }/resources/img/icon/search.png" alt=""></a>
        <a href="#"><img src="${pageContext.request.contextPath }/resources/img/icon/heart.png" alt=""></a>

       <!-- todo 페이지를 못찾음-->
        <a href="${pageContext.request.contextPath }/order/cart"><img src="${pageContext.request.contextPath }/resources/img/icon/cart.png" alt="">장바구니</a>
    </div>
    <div id="mobile-menu-wrap"></div>
    <div class="offcanvas__text">
		<c:if test="${!(empty sessionScope.userId)}">
			<a href="javascript:openPop();" class="mr-3 ml-3" >포인트 충전</a> |
			<a href="${pageContext.request.contextPath }/order/cart" class="mr-3  ml-3">장바구니</a>
		</c:if>
    </div>
</div>
<!-- 회원메뉴단(모바일) 끝 -->

<!-- 회원메뉴단 -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-7">
                    <div class="header__top__left ml-5">
                     <div class="header__top__links ml-5">
						<c:if test="${!(empty sessionScope.userId)}">
							<a href="javascript:openPop();" class="mr-3 ml-3" >포인트 충전</a> |
							<a href="${pageContext.request.contextPath }/order/cart" class="mr-3  ml-3">장바구니</a>
						</c:if>

                    </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-5">
                    <div class="header__top__right">
                        <div class="header__top__links">

					<c:choose>
						<c:when test="${ !(empty sessionScope.userId) && sessionScope.userId ne 'admin'}">
							<!-- sessionScope 아이디가 userId에 admin이 아닐 경우 환영글 / 로그아웃 -->
								<a href="${pageContext.request.contextPath }/mypage">마이페이지</a>
								<a href="${pageContext.request.contextPath }/member/logout">로그아웃</a>
						</c:when>
						<c:when test="${ !(empty sessionScope.compId )}">
							<!-- sessionScope 아이디가 compId에 admin이 아닐 경우 마이페이지 -->
								<a href="${pageContext.request.contextPath }/comp/compMain">업체페이지</a>
								<a href="${pageContext.request.contextPath }/member/logout">로그아웃</a>
						</c:when>
						<c:when test="${ !(empty sessionScope.userId) && sessionScope.userId eq 'admin'}">
							<!-- sessionScope 아이디가 admin일 경우 관리자페이지 -->
								<a href="${pageContext.request.contextPath }/adminpage">관리자페이지</a>
								<a href="${pageContext.request.contextPath }/member/logout">로그아웃</a>
						</c:when>
						<c:otherwise>
							<!-- sessionScope 아이디가 비어있는 경우 로그인 / 회원가입 -->
							<a href="${pageContext.request.contextPath }/member/login">로그인</a>
							<a href="${pageContext.request.contextPath }/member/join">회원가입</a>
						</c:otherwise>
					</c:choose>

                        </div>
                        <div class="header__top__hover">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 하단메뉴단 -->
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="header__logo">
                    <a href="${pageContext.request.contextPath }/main/main"><img src="${pageContext.request.contextPath }/resources/img/logo.png" alt="로고"></a>
                </div>
            </div>
            <div class="col-lg-5 col-md-6">
              <div class="header__nav__option shop__sidebar__search mb-0">
	              <form action="searchItem" method="post" id="search">
	                  <input type="text" placeholder="단백질 쉐이크" id="searchMain">
	                  <button type="submit"><span class="icon_search" style="color:#495057;"></span></button>
	              </form>
                </div>
            </div>
            <div class="col-lg-4 col-md-12">
                <nav class="header__menu mobile-menu">
                    <ul>
                        <li><span id="li">${sessionScope.name }</span></li>
                        <li><a href="${pageContext.request.contextPath }/product/shop">스토어</a></li>
                        <li><a href="${pageContext.request.contextPath }/board/list">커뮤니티</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="canvas__open"><i class="fa fa-bars"></i></div>
    </div>


    <!--팝업 레이어 영역-->
    <div class="popup_layer" id="popup_layer" style="display: none;">
  	<div class="popup_box">
      <div style="height: 10px; width: 375px; float: top;">
        <a href="javascript:closePop();"><img src="${pageContext.request.contextPath }/resources/img/icon/ic_close.svg" class="m_header-banner-close" width="70px"></a>
     </div>
   <!--팝업 컨텐츠 영역-->
      <div class="popup_cont">
		<h2>포인트 충전</h2>
		<p>		</p>
			<table class="table table-sm">
				<tr>
					<td>
						<label class="box-radio-input"><input type="radio" name="cp_item" value="1000"><span> 1,000원</span></label>
					</td>
					<td>
						<label class="box-radio-input"><input type="radio" name="cp_item" value="5000"><span> 5,000원</span></label>
					</td>
					<td>
		                <label class="box-radio-input"><input type="radio" name="cp_item" value="20000"><span> 20,000원</span></label>
					</td>
				</tr>
				<tr>
					<td>
		                <label class="box-radio-input"><input type="radio" name="cp_item" value="25000"><span> 25,000원</span></label>
					</td>
					<td>
                		<label class="box-radio-input"><input type="radio" name="cp_item" value="30000"><span> 30,000원</span></label>
					</td>
					<td>
               			<label class="box-radio-input"><input type="radio" name="cp_item" value="35000"><span> 35,000원</span></label>
					</td>
				</tr>
				<tr>
					<td>
		                <label class="box-radio-input"><input type="radio" name="cp_item" value="40000"><span> 40,000원</span></label>
					</td>
					<td>
                		<label class="box-radio-input"><input type="radio" name="cp_item" value="50000"><span> 50,000원</span></label>
                		<input type="hidden" value="포인트 충전" id="pointChar" name="pointChar">
					</td>
					<td>
					</td>
				</tr>
			</table>
                <p  style="color: #ac2925; margin-top: 30px">최소 충전 금액은 1,000원이며 <br/>최대 충전 금액은 50,000원 입니다.</p>
    	</div>
                <button type="button" class="btn btn-lg btn-block btn-custom popup_btn" id="charge">충 전 하 기</button>
</div>
</div>

<!-- 아임포트 API -->
<script>
	$('#charge').click(function () {
	    // getter
	    var IMP = window.IMP;
	    IMP.init('imp27865884');
	    var money = $('input[name="cp_item"]:checked').val();
	    var pointNow = parseInt(${pointDTO.pointNow}) + parseInt(money);

	    IMP.request_pay({
	        pg: 'html5_inicis',
	        merchant_uid: 'point' + new Date().getTime(),
	        name: '핏티드 포인트 충전',
	        amount: money,
	        buyer_name: '${memberDTO.userNm}',
	        buyer_tel: '${memberDTO.userPhone}'
	    }, function (rsp) {
	        console.log(rsp);
	        if (rsp.success) {
	            var msg = '결제가 완료되었습니다.';
	            msg += '고유ID : ' + rsp.imp_uid;
	            msg += '상점 거래ID : ' + rsp.merchant_uid;
	            msg += '결제 금액 : ' + rsp.paid_amount;
	            msg += '카드 승인번호 : ' + rsp.apply_num;
	            $.ajax({
	                url: "${pageContext.request.contextPath }/point/insertChargePoint", //충전 금액값을 보낼 url 설정
	                type: "POST",
		        	dataType:"json",
		        	data: {
		            	'pointType' : $('#pointChar').val(),
		            	'pointNow' : pointNow,
						'pointCharge' : money
		        	},
	            });
	        } else {
	            var msg = '결제에 실패하였습니다.';
	            msg += '에러내용 : ' + rsp.error_msg;
	        }
	        alert(msg);
            closePop();
        });
    });
</script>
</header>
