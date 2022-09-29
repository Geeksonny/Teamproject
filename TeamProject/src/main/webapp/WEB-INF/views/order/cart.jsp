<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.6.0.js">
</script>
<%-- <script src="${pageContext.request.contextPath }/resources/jsPro/basketListPro.js"></script> --%>
<script type="text/javascript">
$(document).ready(function(){
	itemTotal(); // 전체 합계
	myCoupon(); // 쿠폰 선택

	}); // documnet
	function myCoupon(){
	 var sbUser = $('#sbUser').val();
	 $('.nice-select').hide();
	 $('#myCouponList').show();
		$.ajax({
	        	url: "${pageContext.request.contextPath }/order/myCoupon",
				type: "post",
				data : {'couUserId':sbUser},
				dataType: "json",
				async: false,
				success:function( data ) {
					if(data.code=="S") {
						$('#myCouponList').append("<option value='0_0'>" + "쿠폰 선택" + "</option>");
						var codeList = data.couponList;
					      for(var i = 0; i < codeList.length ; i++){
					        var option = "<option value='" + codeList[i].couNumCouDc + "'>" + codeList[i].couNm + "</option>";
					        $('#myCouponList').append(option);
					      }
					} else {
						alert("ERROR : Common Code");
					}
				}
			}); // ajax
	}


	function itemTotal() {

		//전체 합계
		var sbProdPrice = $("input[name='sbProdPrice']");
		var sbCount = $("input[name='sbCount']");
		var sum = 0;
		var count = sbProdPrice.length;
		var itemDC = 0;
		var prodLQuantity = $("input[name='prodLQuantity']");


		//전체합계
		for (var i = 0; i < count; i++){

		  if(prodLQuantity[i].value !=0){ // 품절 상품 아닌것만 더하기
			sum += parseInt(sbProdPrice[i].value) * parseInt(sbCount[i].value);
		  }

		}
		var sum = new Intl.NumberFormat().format(sum);
		var itemDC = new Intl.NumberFormat().format(itemDC);
		$("#itemTotalPrice").html(sum+" 원"); // 총합표시
		$("#itemDcPrice").html(itemDC+" 원"); // 할인가격 표시
	}

	// 삭제 코드 시작
	function cartDelete(t){
		var sendUrl = "delete";       // Controller로 보내는 URL Controller에 /delete로 전송되고 매핑함
		var basketIndex = t.id.split('_')[1];
		var sbProdCode = $('#sbProdCode_' + basketIndex).val();

			var chk = confirm("정말 삭제하시겠습니까?"); //chk가 boolean타입으로 선택가능
			if(chk){ //chk가 true면 if문으로 들어옴
			$.ajax({
				type : 'POST',       // Post방식
				url : sendUrl,          // 전송 URL
				traditional : true,		// ajax 배열 넘기기 옵션
				data : {'sbProdCode':sbProdCode
					   // 보내고자 하는 data 변수 설정
				},
				success: function (rdata) {
					if(rdata == 1) {
					 location.href="cart";
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


	// 삭제 코드 끝


	//수량 수정 디비 저장
	function updateValue(index){
		var url = "${pageContext.request.contextPath }/order/update";

		var vol = $('#select_vol_'+index).val();
		var sbProdCode = $('#sbProdCode_'+index).val();
		var sbUser = $('#sbUser').val();

		$.ajax({
				type : 'POST',       // Post방식
				url : url,          // 전송 URL
				traditional : true,		// ajax 배열 넘기기 옵션
				data : {
					'sbCount' : vol,
					'sbProdCode': sbProdCode,
					'sbUser' : sbUser                 // 보내고자 하는 data 변수 설정
				}

			}); // ajax
	}
	 /*-------------------
	Quantity change
--------------------- */



var proQty = $('.pro-qty');
proQty.prepend('<span class="fa fa-angle-up dec qtybtn"></span>');
proQty.append('<span class="fa fa-angle-down inc qtybtn"></span>');
proQty.on('click', '.qtybtn', function () {
    var $button = $(this);
    var oldValue = $button.parent().find('input').val();
    if ($button.hasClass('inc')) {
        var newVal = parseFloat(oldValue) + 1;
    } else {
        // Don't allow decrementing below zero
        if (oldValue > 0) {
            var newVal = parseFloat(oldValue) - 1;
        } else {
            newVal = 0;
        }
    }
    $button.parent().find('input').val(newVal);
});

var proQty = $('.pro-qty-2');
proQty.prepend('<span class="fa fa-angle-left dec qtybtn"></span>');
proQty.append('<span class="fa fa-angle-right inc qtybtn"></span>');
proQty.on('click', '.qtybtn', function(){
	var myCouponDC =document.getElementById('myCouponList');
	var myCouponDC1 = myCouponDC.options[myCouponDC.selectedIndex].value.split('_')[1]; // 옵션 value값

    var $button = $(this);
    var oldValue = $button.parent().find('input').val();
    var index = $button.parent().find('input')[0].id.split('_')[2];

    var optionMax= $('#quantity_'+index).val(); // 디비저정된 수량 최대값

    if ($button.hasClass('inc')) {
        if(parseInt(oldValue) >= parseInt(optionMax)){
			alert("재고수량이상으로 주문하실수 없습니다.");
			var newVal = oldValue;
		}else {
         newVal = parseFloat(oldValue) + 1;
		}
    } else {
        // Don't allow decrementing below zero
        if (oldValue > 0) {
            var newVal = parseFloat(oldValue) - 1;
        } else {
            newVal = 0;
        }
    }

    $button.parent().find('input').val(newVal);
    var price = $('#price_' + index).val(); // 개별 가격

    var total = newVal * price ; // 개별 가격 * 새로 바뀐 수량
	var total = new Intl.NumberFormat().format(total); // 원으로 바꾸기
    $('#total_' + index).text(total +"원"); // total에 뿌려주기


	var totalSum = 0;  // 총 합계 구하기
	var itemDC = 0; // 할인 가격
	for(var i = 0; i < $('.total').length ; i++){
		totalSum += parseInt($('.total')[i].textContent.replace(/[^0-9]/g,''));
	}

	if(myCouponDC1!=0){ // 할인율이 0이 아닐때 계산
		itemDC=totalSum - totalSum * myCouponDC1;
		totalSum=totalSum * myCouponDC1;
	}
	var totalSum = new Intl.NumberFormat().format(totalSum); // 원으로 바꾸기
	var itemDC = new Intl.NumberFormat().format(itemDC); // 원으로 바꾸기
	$("#itemTotalPrice").html(totalSum+" 원"); //화면에 총합 표시
	$("#itemDcPrice").html(itemDC+" 원"); // 할인가격 표시
	updateValue(index); // 수량 디비에 넣기
});

$('#myCouponList').change(function(){ // 할인 셀렉박스 바뀔때 동작
	var total = 0;
	var totalArr = $('.total');
	var itemDC=0;
	for(var i=0; i<totalArr.length; i++){ // 개별총합계를 더함
		total += Number($(totalArr[i]).text().replace(/[^0-9]/g,''));
	}

	if(this.value.split('_')[1] != 0){ // 할인율 곱하기
		var totalDc = this.value.split('_')[1]
		itemDC= total - total*totalDc; // 할인된 가격
		total *= totalDc;


	}
	var total = new Intl.NumberFormat().format(total);
	var itemDC = new Intl.NumberFormat().format(itemDC);
	$("#itemDcPrice").html(itemDC + "원"); // 할인가격 표시
	$("#itemTotalPrice").html(total + "원");

});

</script>
</head>

<body>
	<jsp:include page="../inc/menu.jsp" />

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>장바구니</h4>
						<div class="breadcrumb__links">
							<a href="./index.html">Home</a>
							<a href="./shop.html">마이페이지</a>
							<span>장바구니</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Shopping Cart Section Begin -->
	<section class="shopping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8" style="padding-right:30px">
					<div class="shopping__cart__table">
						<table>
							<thead>
								<tr>
									<th colspan=2 style="text-align:center">상품 정보</th>
									<th>&nbsp; &nbsp; &nbsp;수량</th>
									<th>&nbsp; &nbsp; &nbsp; &nbsp;합계</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<form action="${pageContext.request.contextPath }/order/insertOrder" method="post">
									<c:forEach items="${basketList }" var="basketDTO" varStatus="status">
										<tr><td class="product__cart__item">
										<img src="${pageContext.request.contextPath }/resources/img/product/${basketDTO.prodMainimg }" width="200"  /></td>

											<td class="product__cart__item">
												<div class="product__cart__item__pic">
													<img src="img/shopping-cart/cart-1.jpg" alt="">
												</div>
												<div class="product__cart__item__text">
													<h6>${basketDTO.sbProdNm }</h6>
													<h5><fmt:formatNumber value="${basketDTO.sbProdPrice }" pattern="###,###,###"/>원</h5>
												</div>
											</td>
											<td class="quantity__item">
												<c:if test="${basketDTO.prodLQuantity == 0}">
													<h6>품절</h6>
												</c:if>
												<c:if test="${basketDTO.prodLQuantity != 0}">
													<div class="quantity">
														<div class="pro-qty-2">
															<input type="text" id="select_vol_${basketDTO.num}" class="select_vol" name="select_vol" value="${basketDTO.sbCount}" max="${basketDTO.prodLQuantity}" min="1">
															<a href="#"></a>
														</div>
													</div>
												</c:if>
											</td>
											<td class="cart__price">
												<input type="hidden" id="price_${basketDTO.num}" value="${basketDTO.sbProdPrice }">
												<input type="hidden" id="quantity_${basketDTO.num}" value="${basketDTO.prodLQuantity }">
<!-- 												수량증가시 증가버튼 누른 가격만 갖고오기 -->
												<div id="total_${basketDTO.num}" class="total"><fmt:formatNumber value="${basketDTO.sbTotalPrice }" pattern="###,###,###"/>원</div>
											</td>
<!-- 											삭제 구현 -->
											<td class="cart__close" id="delProd_${basketDTO.num}">
											<a id="a_${basketDTO.num}" onclick="cartDelete(this);" title="Remove"><i class="fa fa-close" style="cursor:pointer"></i></a></td>
										</tr>

										<input type="hidden" name="sbProdCode_" value="${basketDTO.sbProdCode}" id="sbProdCode_${basketDTO.num}">
<!-- 										수량증가시 증가버튼 누른 코드만 갖고오기 -->
										<input type="hidden" name="sbCount" value="${basketDTO.sbCount}" id="sbCount">
										<input type="hidden" name="sbProdCode" value="${basketDTO.sbProdCode}" id="sbProdCode">
										<input type="hidden" name="sbProdPrice" value="${basketDTO.sbProdPrice}" id="sbProdPrice">
										<input type="hidden" name="prodLQuantity" value="${basketDTO.prodLQuantity}" id="prodLQuantity">
										<input type="hidden" name="sbUser" value="${basketDTO.sbUser}" id="sbUser">

									</c:forEach>

							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="continue__btn">
								<a href="${pageContext.request.contextPath }/product/shop">쇼핑 계속하기</a>
							</div>
						</div>
					</div>
				</div>


				<div class="col-lg-4" style="padding-left:30px">
					<div class="cart__discount">
						<h6>쿠폰</h6>
						<div class="mb-3" style="padding:15px">
							<select id="myCouponList" class="form-select form-control" name="myCouponList"></select>
						</div>
					</div>

              <div class="checkout__order">
				<h4 class="order__title">장바구니 정보</h4>
<!-- 						<h6>결제</h6> -->
						<ul class="checkout__total__all" style="border:none; padding:0;">
							<li>할인가 <span id="itemDcPrice"></span></li>
							<li>주문 합계 <span id="itemTotalPrice"></span></li>
						</ul>
						<button type="submit" class="site-btn" id="orderChk" name="orderChk" >주문하기</button>
					</form>
					</div>
				</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shopping Cart Section End -->
	<jsp:include page="../inc/footer.jsp" />

</body>
</html>
