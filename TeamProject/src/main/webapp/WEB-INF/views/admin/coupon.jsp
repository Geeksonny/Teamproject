<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-relative" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
<head>

<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/jsPro/coupon.js"></script>
<script type="text/javascript">



$(document).ready(function(){

	$("#couNumbtn").click(function(){
		$('#couNum').val(Math.floor(100000000000000000 + Math.random()*900000000000000000)); //18자리 난수
		$('#couNum').focus(); // 생성후 포커스 위치(중복검사를 위해)
	});

	$("#couNum").on('focus keyup', checkCouNum);

}); // documnet


function couponDelete(){

	var sendUrl = "delete1";       // Controller로 보내는 URL Controller에 /delete로 전송되고 매핑함
	var couNum = $('#delCouNum').val();

		var chk = confirm("정말 삭제하시겠습니까?"); //chk가 boolean타입으로 선택가능
		if(chk){ //chk가 true면 if문으로 들어옴
		$.ajax({
			type : 'POST',       // Post방식
			url : sendUrl,          // 전송 URL
			traditional : true,		// ajax 배열 넘기기 옵션
			data : {"couNum":couNum
				   // 보내고자 하는 data 변수 설정
			},
			success: function (rdata) {
				if(rdata == 1) {
				 location.href="coupon";
				}else {
					alert("삭제 실패");
				}

			},
			error:function(){

				alert("에러");
			}
		}); // ajax

		}
}

	var checkCouNumResult = false;			// 쿠폰 코드 중복검사
	var checkCouNmResult = false;			// 쿠폰 이름
	var checkCouDetResult = false;			// 쿠폰 설명


 function checkCouNum(){

	var numRegex = /^[0-9]{18}$/;
	var couNum = $('#couNum').val();
	var spanElem = document.getElementById("checkCouNumResult");

	if (!numRegex.exec(couNum) || couNum.length == 0 || couNum.length == "" ){
		spanElem.innerHTML = "18자리의 숫자를 입력해주세요";
		spanElem.style.color = "RED";
		checkCouNumResult =false;
	} else  {

		$.ajax({
		url:'couNumDupCheck',
		data:{'couNum':couNum},
		type: 'POST',
		success:function(rdata){
			if(rdata=='1'){	// 아이디가 중복이거나 글자 수 넘억
				spanElem.innerHTML = "중복입니다.";
				spanElem.style.color = "RED";
				checkCouNumResult =false;
			}else{
				spanElem.innerHTML = "사용가능한 상품코드입니다.";
				spanElem.style.color = "GREEN";
				checkCouNumResult =true;
			}
		}
		});
	}

} // checkCouNum 마지막 괄호

function couponChk(){

	var couNm = $('#couNm').val();
	var couDc = $('#couDc').val();
	var couDet = $('#couDet').val();


	if(!checkCouNumResult){
			alert("쿠폰 코드 체크 필수");
			$('#couNum').focus();
			return false;
		} else if (couNm.length == 0 || couNm.length == '') {
			alert("쿠폰이름을 입력 필수");
			$('#couNm').focus();
			return false;
		} else if(couDet.length == 0 || couDet.length == ''){
			alert("쿠폰설명 입력 필수");
			$('#couDc').focus();
			return false;
		}


}

</script>



<%
 String strReferer = request.getHeader("referer"); //이전 URL 가져오기

 if(strReferer == null){
%>
<script language="javascript">
  alert("정상적인 경로를 통해 다시 접근해 주세요.");
  document.location.href="${pageContext.request.contextPath }/main/main";
 </script>
<%
  return;
 }
%>
</head>

<body>
	<!-- 메뉴단 -->
	<jsp:include page="../inc/menu.jsp" />
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<jsp:include page="../inc/admin-menu.jsp" />

			<!-- Content wrapper -->
			<div class="content-wrapper">
				<!-- Content -->

				<div class="container-xxl flex-grow-1 container-p-y">
					<h4 class="fw-bold py-3 mb-4">
						<span class="text-muted fw-light">쿠폰 /</span> 쿠폰 관리
					</h4>

					<div class="card mb-4">
						<h5 class="card-header">쿠폰 등록</h5>

						<hr class="my-0" />
						<div class="card-body">
							<form id="formAccountSettings" name="coupon" action="${pageContext.request.contextPath}/admin/couponInsert" onsubmit="return couponChk()" method="POST">
								<div class="row">
									<div class="mb-3 col-md-6">
										<label for="userNm" class="form-label">쿠폰 코드</label>
										<input class="form-control form-control-lg" type="text" name="couNum" id="couNum" placeholder="18자리 숫자를 입력하세요" />
										<span id="checkCouNumResult">
											<!-- 쿠폰코드 결과 표시 영역 -->
										</span>
									</div>
									<div class="mb-3 col-md-6">
										<button type="button" class="btn btn-outline-primary me-2" style="margin-top: 1.8rem; height: 60%;" id=couNumbtn>쿠폰 코드 생성</button>
									</div>
									<p id="couNum1"></p>
									<div class="mb-3 col-md-6">
										<label for="userNm" class="form-label">쿠폰명</label>
										<input class="form-control form-control-lg" type="text" name="couNm" id="couNm" placeholder="쿠폰명을 적어주세요" />
									</div>
									<div class="mb-3 col-md-3">
										<label class="form-label" for="userAthletic">할인율</label>
										<select class="select2 form-control form-control-lg" id="couDc " name="couDc">
											<option value="0.95">5%</option>
											<option value="0.9">10%</option>
											<option value="0.8">20%</option>
											<option value="0.7">30%</option>
											<option value="0.4">40%</option>
											<option value="0.5">50%</option>
										</select>
									</div>
									<div class="mb-3 col-md-9">
										<label for="couDet" class="form-label">쿠폰 설명</label>
										<input class="form-control form-control-lg" type="text" name="couDet" id="couDet" placeholder="상세 설명을 적어주세요" />
									</div>
									<div class="mb-3 col-md-3">
										<button type="submit" class="btn btn-primary me-2" style="margin-top: 1.8rem; height: 60%" onclick="couponChk();">+ 추가</button>
										<button type="reset" class="btn btn-outline-secondary" style="margin-top: 1.8rem; height: 60%">취소</button>
									</div>
							</form>
						</div>
					</div>
				</div>

				<!-- Examples -->

				<h5 class="pb-1 mt-5 mb-3">쿠폰 리스트</h5>
				<div class="row mb-5">
					<c:forEach var="couponDTO" items="${couponList }">
						<div class="col-md-6 col-lg-4 mb-3">
							<div class="card">
								<a onclick="couponDelete();">
									<img src="${pageContext.request.contextPath }/resources/img/icon/ic_close.svg" class="m_header-banner-close right" width="50px" style="cursor: pointer;">
								</a>
								<div class="card-header">
									<h2 style="color: #6c757d; font-weight: 990 !important">
										<strong>${couponDTO.couNum }</strong>
									</h2>

								</div>
								<div class="card-body">
									<h5 class="card-title">
										<strong>${couponDTO.couNm } <span class="badge bg-primary"> <fmt:formatNumber type="number" maxFractionDigits="0" value="${couponDTO.couDc }" />%
										</span></strong>
									</h5>
									<p class="card-text">${couponDTO.couDet }</p>
									<hr>
									<p style="color: #999;">
										발행일 &nbsp;&nbsp;
										<fmt:formatDate pattern="yy-MM-dd" value="${couponDTO.couInfoDate }" />
									</p>
								</div>
								<input type="hidden" name="sbCount" value="${couponDTO.couNum}" id="delCouNum">
							</div>
						</div>
					</c:forEach>
				</div>
				<!--/ Content types -->

				<div class="bd-example-snippet bd-code-snippet mt-5 mb-3">
					<div class="bd-example ">
						<nav aria-label="Standard pagination example">
							<ul class="pagination" style="margin-left: 45%; margin-right: 55%;">
								<li class="page-item"><c:if test="${couponDTO.startPage > couponDTO.pageBlock }">
										<a class="page-link" href="${pageContext.request.contextPath }
							/admin/coupon?pageNum=${couponDTO.startPage - couponDTO.pageBlock}" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</c:if></li>

								<c:forEach var="i" begin="${couponDTO.startPage }" end="${couponDTO.endPage }" step="1">
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/admin/coupon?pageNum=${i}">${i}</a></li>
								</c:forEach>

								<li class="page-item"><c:if test="${couponDTO.endPage < couponDTO.pageCount }">
										<a class="page-link" href="${pageContext.request.contextPath }
						 /admin/coupon?pageNum=${couponDTO.startPage + couponDTO.pageBlock}" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</c:if></li>
							</ul>
						</nav>
					</div>
				</div>








			</div>

			<!-- Footer -->
			<footer class="content-footer footer bg-footer-theme">
				<div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
					<div class="mb-2 mb-md-0"></div>
					<div></div>
				</div>
			</footer>
			<!-- / Footer -->

			<div class="content-backdrop fade"></div>
		</div>
		<!-- Content wrapper -->
	</div>
	<!-- / Layout page -->
	</div>

	<!-- Overlay -->
	<div class="layout-overlay layout-menu-toggle"></div>
	</div>

	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<script src="${pageContext.request.contextPath }/resources/assets/vendor/libs/jquery/jquery.js"></script>
	<script src="${pageContext.request.contextPath }/resources/assets/vendor/libs/popper/popper.js"></script>
	<script src="${pageContext.request.contextPath }/resources/assets/vendor/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath }/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

	<script src="${pageContext.request.contextPath }/resources/assets/vendor/js/menu.js"></script>
	<!-- endbuild -->

	<!-- Vendors JS -->
	<script src="${pageContext.request.contextPath }/resources/assets/vendor/libs/masonry/masonry.js"></script>

	<!-- Main JS -->
	<script src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>

	<!-- Page JS -->

	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>

	<!-- Footer Section Begin -->
	<jsp:include page="../inc/footer.jsp" />
</body>

</html>
