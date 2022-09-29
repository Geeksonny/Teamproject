<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-relative" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
<head>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<%-- <script src="${pageContext.request.contextPath }/resources/jsPro/insertGoods.js"></script> --%>
<!--   셀렉트박스 js -->
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
<script type="text/javascript">
$(document).ready(function() {
	var one;
	var two;
	var three;
	var four;
	$('.nice-select').hide();
	$('#prodLOption1').show();
	$('#prodLOption1').change(function() {
		one = this.options[this.selectedIndex].value;
		$('#div2').hide(); //숨김
		$('#prodLOption2').empty(); //초기화
		$('.nice-select').hide();
		$('#prodLOption1').show();
		$('#div3').hide(); //숨김
		$('#prodLOption3').empty(); //초기화
		$('#div4').hide(); //숨김
		$('#prodLOption4').empty(); //초기화
		$('#div5').hide(); //숨김
		$('#prodLOption5').empty(); //초기화
		$.ajax({
			url: "${pageContext.request.contextPath }/common/selectOptionList",
			type: "post",
			data: { "srhHighCd": one },
			dataType: "json",
			async: false,
			success: function(data) {
				if (data.code == "S") {
					$('#div2').show();
					$('#prodLOption2').show();
					$('#prodLOption2').append("<option>" + "선택" + "</option>");
					var codeList = data.commonList;
					for (var i = 0; i < codeList.length; i++) {
						var option = "<option value='" + codeList[i].cdOpt + "'>" + codeList[i].cdOptNm + "</option>";
						$('#prodLOption2').append(option);
					}
				} else {
					alert("ERROR : Common Code");
				}
			}
		});
	});

	$('#prodLOption2').change(function() {
		two = this.options[this.selectedIndex].value;
		$('#div3').hide(); //숨김
		$('#prodLOption3').empty(); //초기화
		$('#div4').hide(); //숨김
		$('#prodLOption4').empty(); //초기화
		$('#div5').hide(); //숨김
		$('#prodLOption5').empty(); //초기화
		$.ajax({
			url: "${pageContext.request.contextPath }/common/selectOptionList",
			type: "post",
			data: { "srhHighCd": two },
			dataType: "json",
			async: false,
			success: function(data) {
				if (data.code == "S") {
					$('#div3').show();
					$('#prodLOption3').show();
					$('#prodLOption3').append("<option>" + "선택" + "</option>");
					var codeList = data.commonList;
					for (var i = 0; i < codeList.length; i++) {
						var option = "<option value='" + codeList[i].cdOpt + "'>" + codeList[i].cdOptNm + "</option>";
						$('#prodLOption3').append(option);
					}
				} else {
					alert("ERROR : Common Code");
				}
			}
		});
	});

	$('#prodLOption3').change(function() {
		three = this.options[this.selectedIndex].value;
		if (three == "P0101" || three == "P0102" || three == "F0101" || three == "F0102" || three == "F0103") {
			if (three == "P0101" || three == "P0102") {
				three = "COLOR";
			} else if (three == "F0101" || three == "F0102" || three == "F0103") {
				three = "TASTE";
			} else {
				three = "";
			}
			$('#div4').hide(); //숨김
			$('#prodLOption4').empty(); //초기화
			$('#div5').hide(); //숨김
			$('#prodLOption5').empty(); //초기화
			$.ajax({
				url: "${pageContext.request.contextPath }/common/selectOptionList",
				type: "post",
				data: { "srhHighCd": three },
				dataType: "json",
				async: false,
				success: function(data) {
					if (data.code == "S") {
						$('#div4').show();
						$('#prodLOption4').show();
						$('#prodLOption4').append("<option>" + "선택" + "</option>");
						var codeList = data.commonList;
						for (var i = 0; i < codeList.length; i++) {
							var option = "<option value='" + codeList[i].cdOpt + "'>" + codeList[i].cdOptNm + "</option>";
							$('#prodLOption4').append(option);
						}
					} else {
						alert("ERROR : Common Code");
					}
				}
			});
		}
	});

	$('#prodLOption4').change(function() {
		if (three == "COLOR") {
			four = "SIZE";
			$('#div5').hide(); //숨김
			$('#prodLOption5').empty(); //초기화
			$.ajax({
				url: "${pageContext.request.contextPath }/common/selectOptionList",
				type: "post",
				data: { "srhHighCd": four },
				dataType: "json",
				async: false,
				success: function(data) {
					if (data.code == "S") {
						$('#div5').show();
						$('#prodLOption5').show();
						$('#prodLOption5').append("<option>" + "선택" + "</option>");
						var codeList = data.commonList;
						for (var i = 0; i < codeList.length; i++) {
							var option = "<option value='" + codeList[i].cdOpt + "'>" + codeList[i].cdOptNm + "</option>";
							$('#prodLOption5').append(option);
						}
					} else {
						alert("ERROR : Common Code");
					}
				}
			});
		}
	});


});


function insertGoodsChk() {
	var prodLOption1 = $('#prodLOption1').val();
	var prodLProdNm = $("input[name=prodLProdNm]").val();
	var prodLPrice = $("input[name=prodLPrice]").val();
	var prodLQuantity = $("input[name=prodLQuantity]").val();
	var ProdLDetail = $("input[name=ProdLDetail]").val();
	var prodLMainimg = $("input[name=prodLMainimg]").val();
	var prodLSubimg = $("input[name=prodLSubimg]").val();

	if (prodLOption1 == 0) {
		alert("옵션을 선택해주세요");
		return false;
	} else if (prodLProdNm.length == 0 || prodLProdNm.length == '') {
		alert("이름을 입력해주세요");
		return false;
	} else if (prodLPrice.length == 0 || prodLPrice.length == '') {
		alert("가격을 입력해주세요");
		return false;
	} else if (prodLQuantity.length == 0 || prodLQuantity.length == '') {
		alert("수량을 입력해주세요");
		return false;
	} else if (ProdLDetail.length == 0 || ProdLDetail.length == '') {
		alert("상품설명을 입력해주세요");
		return false;

	} else if (prodLMainimg.length == 0 || prodLMainimg.length == '') {
		alert("상품 메인 사진을 입력해주세요");
		return false;

	} else if (prodLSubimg.length == 0 || prodLSubimg.length == '') {
		alert("상품 서브 사진을 입력해주세요");
		return false;
	} else {
		return true;
	}

}

// 가격
const formatPrice = (target) => {
	// 숫자만 남긴 후 포맷
	target.value = Number(target.value
		.replace(/[^0-9]/g, ''))
	//   .toLocaleString();
}


</script>

</head>

<body>
	<!-- 메뉴단 -->
	<jsp:include page="../inc/menu.jsp" />
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">

			<!-- 		큰화면 버티컬 시작-->
			<jsp:include page="../inc/comp-menu.jsp" />
			<!-- 		큰화면 버티컬 끝 -->


			<!-- Content wrapper -->
			<div class="content-wrapper">
				<!-- Content -->
				<!-- 화면줄였을때 버티컬 메뉴 및 큰화면에서는 시작 -->
				<div class="container-xxl flex-grow-1 container-p-y">
					<h4 class="fw-bold py-3 mb-4">
						<span class="text-muted fw-light">상품 관리 /</span> 상품 등록
					</h4>

					<div class="row">
						<div class="col-md-12">
							<ul class="nav nav-pills flex-column flex-md-row mb-3">
								<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath }/comp/updateProd">
										<i class="bx bx-user me-1"></i> 상품 등록
									</a></li>
								<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/comp/deleteProd">
										<i class="bx bx-user me-1"></i> 상품 목록
									</a></li>
							</ul>
							<!--  화면줄였을때 버티컬 및 큰화면에서는 시작 매뉴끝                  -->

							<div class="col-xl">
								<div class="tab-pane fade show active" id="user-insert" role="tabpanel" aria-labelledby="user-insert-tab">

									<div class="card mb-4">
										<div class="card-body">
											<form action="${pageContext.request.contextPath }/comp/insertGoodsPro" onsubmit="return insertGoodsChk()" method="post" enctype="multipart/form-data">
												<div class="row">

													<div class="prod_p01 col-3 mb-3">
														<label for="defaultSelect" class="form-label">분류</label>
														<select id="prodLOption1" class="form-select form-control-lg" name="prodLOption1">
															<option value="0">분류 선택</option>
															<option value="PROD">운동용품</option>
															<option value="FOOD">식품</option>
														</select>
													</div>

													<div id="div2" class="prod col-2" style="display: none">
														<label for="defaultSelect" class="form-label">상품 분류</label>
														<select id="prodLOption2" class="form-select form-control-lg" name="prodLOption2">
															<c:forEach var="cdList" items="${cdList}">
																<option value="${cdList.cdOpt}">${cdList.cdOptNm}</option>
															</c:forEach>
														</select>
													</div>

													<div id="div3" class="prod_p01 col-2" style="display: none">
														<label for="defaultSelect" class="form-label">상세 분류</label>
														<select id="prodLOption3" class="form-select form-control-lg" name="prodLOption3">
															<option>선택</option>
														</select>
													</div>

													<div id="div4" class="prod_color col-2" style="display: none">
														<label for="defaultSelect" class="form-label">색상</label>
														<select id="prodLOption4" class="form-select form-control-lg" name="prodLOption4">
															<option>선택</option>
														</select>
													</div>
													<div id="div5" class="prod_size col-2" style="display: none">
														<label for="defaultSelect" class="form-label">사이즈</label>
														<select id="prodLOption5" class="form-select form-control-lg" name="prodLOption5">
															<option>선택</option>
														</select>
													</div>

													<!-- 줄 구분 -->
													<div></div>
													<div class="mb-3 col-8">
														<label class="form-label" for="basic-default-fullname">상품명</label>
														<input type="text" class="form-control form-control-lg" id="basic-default-fullname" name="prodLProdNm" placeholder="상품명 입력" />
													</div>

													<div class="mb-3 col-4">
														<label class="form-label" for="basic-default-fullname">업체명</label>
														<input type="text" class="form-control form-control-lg" id="basic-default-fullname" name="prodLCompNm" value="${compDTO2.compNm }" readonly />
													</div>

													<div class="mb-3 col-4">
														<label class="form-label" for="basic-default-fullname">상품코드</label>
														<input type="text" class="form-control form-control-lg" id="basic-default-fullname" name="prodLCode" value="${prodDTO.prodLCode}" readonly />
													</div>

													<div class="mb-3 col-4">
														<label class="form-label" for="basic-default-company">가격</label>
														<input type="text" class="form-control form-control-lg" id="basic-default-company" name="prodLPrice" oninput="formatPrice(this)" style="text-align: right;" placeholder="원" />
													</div>
													<div class="mb-3 col-4">
														<label class="form-label" for="basic-default-company">수량</label>
														<input type="text" class="form-control form-control-lg" id="basic-default-company" name="prodLQuantity" oninput="formatPrice(this)" style="text-align: right;" placeholder="개" />
													</div>
													<div class="mb-3">
														<label class="form-label" for="basic-default-message">상품 설명</label>
														<textarea id="basic-default-message" name="ProdLDetail" class="form-control" placeholder="상품에 대한 설명을 적어주세요"></textarea>
													</div>
													<div class="mb-3 col-6">
														<label class="form-label" for="basic-default-message">상품 메인 사진 첨부</label>
														<input class="form-control" type="file" id="formFile" name="prodLMainimg" />
													</div>
													<div class="mb-4 col-6">
														<label class="form-label" for="basic-default-message">상품 서브 사진 첨부</label>
														<input class="form-control" type="file" id="formFile" name="prodLSubimg" />
													</div>

												</div>
												<input type="hidden" name="prodLOption" value="goods">
												<button type="submit" class="btn btn-primary">등록</button>
												<button type="reset" class="btn btn-primary">취소</button>
											</form>
										</div>
									</div>
								</div>
							</div>
							<!-- 				컨텐트 탭바로 크게 감싸기 -->

						</div>

					</div>
				</div>
			</div>
			<!--/ Content -->

			<!-- Footer -->
			<footer class="content-footer footer bg-footer-theme">
				<div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
					<div class="mb-2 mb-md-0">
						©
						<script>
								document.write(new Date().getFullYear());
							</script>
						, made with ❤️ by
						<a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
					</div>
					<div>
						<a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
						<a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>
						<a href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/" target="_blank" class="footer-link me-4">Documentation</a>

						<a href="https://github.com/themeselection/sneat-html-admin-template-free/issues" target="_blank" class="footer-link me-4">Support</a>
					</div>
				</div>
			</footer>
			<!-- / Footer -->

			<div class="content-backdrop fade"></div>
		</div>
		<!-- 화면 줄였을때 Content wrapper -->
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

	<!-- Main JS -->
	<script src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>

	<!-- Page JS -->

	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>

	<!-- Footer Section Begin -->
	<jsp:include page="../inc/footer.jsp" />
</body>

</html>
