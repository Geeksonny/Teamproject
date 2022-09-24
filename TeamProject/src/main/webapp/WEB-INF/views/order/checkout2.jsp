
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.itwillbs.dao.OrderDAO"%>
<%@page import="com.itwillbs.domain.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/jsPro/basketListPro.js"></script>
</head>

	<script>
	function myCoupon(){
	 var sbUser = "${memberDTO.userId}";
	 $('.nice-select').hide();
	 $('#myCouponList').show();
	//  var myCouponDC =document.getElementById('myCouponList');
	//  var myCouponDC1 = myCouponDC.options[myCouponDC.selectedIndex].value.split('_')[1]; // 옵션 value값
		$.ajax({
	        	url: "myCoupon",
				type: "post",
				data : {'couUserNm':sbUser},
				dataType: "json",
				async: false,
				success:function( data ) {
					if(data.code=="S") {
						$('#myCouponList').append("<option value='0_0'>" + "선택" + "</option>");
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
	</script>

	<script>
		function point(v){
			document.getElementById('usePoint2').innerHTML=v+"원";
			document.getElementById('total2').innerHTML=(${total}-v)+"원";
		}
	</script>

	<script>
	// 포인트사용
	function pointUseAll(){
		document.getElementById('textUsePoint').value = ${pointDTO2.pointNow};
	}
	</script>

	<script type="text/javascript">
		var path = "${pageContext.request.contextPath }";

		$(function() {
			$("#resTb tbody").append($("#resInfoTr").html());

		});

	</script>


	<script>
	function iamport(){
        var amount = '${total}'-$('#textUsePoint').val();
        var discount = "";
        discount += $('#textUsePoint').val();
        var nowPoint = '${pointDTO2.pointNow}' - $('#textUsePoint').val();
        //가맹점 식별코드
        IMP.init('imp27865884');
        IMP.request_pay({
            pg : 'html5_inicis',
            pay_method : 'card',
            merchant_uid : '${memberDTO.userId}' + new Date().getTime(),
            name : '핏티드' , //결제창에서 보여질 이름
            amount : amount, //실제 결제되는 가격
        }, function(rsp) {
           console.log(rsp);


            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                var add = "";
                add += '${addressDTO.address }' + ", " +'${addressDTO.addressDetails }';

                alert(msg);

                $.ajax({
                    url: "orderComplete",
                   type: "POST",
                   data: { 'ordUser'    		:'${memberDTO.userId}',
	                       'ordGetNm'   		:'${addressDTO.addressGetNm}',
	                       'ordGetAddress' 	   	: add,
	                       'ordGetPhone'    	:'${addressDTO.addressGetPhone }',
	                       'ordDeliveryMessage' : $('#ordDeliveryMessage').val(),
	                       'ordTotalPrice'		:'${total}',
// 	                       'ordNum' 			: merchant_uid,
	                       'ordCouponDc'		: discount,
	                       'pointNow'			: nowPoint,
	                       'pointUsed'			: $('#textUsePoint').val(),
	                       'ordFinalPrice'		: amount,
                       },

                   dataType:"json",
                })

                location.href = '${pageContext.request.contextPath}/main/main';
            } else {
              var msg = rsp.error_msg;
              alert(msg);
            }
        });
     }
  </script>
<!-- 	<script> -->
<%-- //      var point = '${pointDTO2.pointNow}'; --%>
<%-- //      var prePayment = '${prePayment}'; --%>
<!-- //      $(function() { -->
<!-- //         $('#point').val((point * 1).toLocaleString()); -->
<!-- //         $('#textUsePoint').onblur(function() { -->
<!-- //            if($('#textUsePoint').val() - $('#point').val() > 0) { -->
<!-- //               alert('사용 가능 포인트를 초과하였습니다.') -->
<!-- //               $('#point').val(point.toLocaleString()); -->
<!-- //               $('#textUsePoint').val(point); -->
<!-- //               $('#discount').html('0 원'); -->
<!-- //               $('#payment').text(prePayment + ' 원'); -->
<!-- //            } -->
<!-- //            else { -->
<!-- //               if(prePayment - $('#usePoint').val() < 1000) { -->
<!-- //                  alert('최소 결제 금액은 1,000입니다.') -->
<!-- //                  $('#usePoint').val((prePayment - 1000)); -->
<!-- //                  $('#point').val((point - prePayment - 1000).toLocaleString()); -->
<!-- //                  $('#discount').html('- ' + (prePayment -1000 * 1).toLocaleString() + ' 원'); -->
<!-- //                  $('#payment').text('1,000 원'); -->
<!-- //               } -->
<!-- //               else { -->
<!-- //                  $('#point').val((point - $('#usePoint').val()).toLocaleString()); -->
<!-- //                  $('#discount').html('- ' + $('#usePoint').val() + ' 원'); -->
<!-- //                  $('#payment').text((prePayment - $('#usePoint').val()).toLocaleString() + ' 원'); -->
<!-- //               } -->
<!-- //            } -->
<!-- //         }) -->
<!-- //      }) -->
<!--   </script>
	-->

	<!-- <script> -->

	<!-- //             function itemSum() { -->
	<!-- //                 var str = ""; -->
	<!-- //                 var sum = 0; -->
	<!-- //                 for (var i = 0; i < count; i++) { -->
	<!-- //                     if ($(".chkbox")[i].checked == true) { -->
	<!-- //                         sum += parseInt($(".chkbox")[i].value); -->
	<!-- //                     } -->
	<!-- //                 } -->
	<!-- //                 $("#total_sum").html(sum + " 원"); -->
	<!-- //                 $("#amount").val(sum); -->
	<!-- //             } -->

	<!--         </script> -->
	<body>
	<!-- 메뉴단 -->
	<jsp:include page="../inc/menu.jsp" />

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>상품 주문</h4>
						<div class="breadcrumb__links">
							<a href="./index.html">Home</a> <a href="./shop.html">Shop</a> <span>Check
								Out</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <form action="#">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">

                            <h6 class="coupon__code"><span class="icon_tag_alt"></span> 주문자 변경은
                            <a href="/web/mypage/modify">이쪽에서 가능합니다!</a></h6>

                            <h6 class="checkout__title">주문자 정보</h6>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>이름<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>이메일<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                            </div>

                            <div class="checkout__input">
                                <p>Country<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="checkout__input">
                                <p>Address<span>*</span></p>
                                <input type="text" placeholder="Street Address" class="checkout__input__add">
                                <input type="text" placeholder="Apartment, suite, unite ect (optinal)">
                            </div>
                            <div class="checkout__input">
                                <p>Town/City<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="checkout__input">
                                <p>Country/State<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="checkout__input">
                                <p>Postcode / ZIP<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="acc">
                                    Create an account?
                                    <input type="checkbox" id="acc">
                                    <span class="checkmark"></span>
                                </label>
                                <p>Create an account by entering the information below. If you are a returning customer
                                please login at the top of the page</p>
                            </div>
                            <div class="checkout__input">
                                <p>Account Password<span>*</span></p>
                                <input type="text">
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="diff-acc">
                                    Note about your order, e.g, special noe for delivery
                                    <input type="checkbox" id="diff-acc">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="checkout__input">
                                <p>Order notes<span>*</span></p>
                                <input type="text" placeholder="Notes about your order, e.g. special notes for delivery.">
                            </div>
                        </div>


                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4 class="order__title">Your order</h4>
                                <div class="checkout__order__products">Product <span>Total</span></div>
                                <ul class="checkout__total__products">
                                    <li>01. Vanilla salted caramel <span>$ 300.0</span></li>
                                    <li>02. German chocolate <span>$ 170.0</span></li>
                                    <li>03. Sweet autumn <span>$ 170.0</span></li>
                                    <li>04. Cluten free mini dozen <span>$ 110.0</span></li>
                                </ul>
                                <ul class="checkout__total__all">
                                    <li>Subtotal <span>$750.99</span></li>
                                    <li>Total <span>$750.99</span></li>
                                </ul>
                                <div class="checkout__input__checkbox">
                                    <label for="acc-or">
                                        Create an account?
                                        <input type="checkbox" id="acc-or">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adip elit, sed do eiusmod tempor incididunt
                                ut labore et dolore magna aliqua.</p>
                                <div class="checkout__input__checkbox">
                                    <label for="payment">
                                        Check Payment
                                        <input type="checkbox" id="payment">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="checkout__input__checkbox">
                                    <label for="paypal">
                                        Paypal
                                        <input type="checkbox" id="paypal">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <button type="submit" class="site-btn">PLACE ORDER</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
	<!-- Footer Section Begin -->
	<jsp:include page="../inc/footer.jsp" />
</body>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('addressZipcode').value = data.zonecode;
							document.getElementById("address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("addressDetails").value = "";
							document.getElementById("addressDetails").focus();
						}
					}).open();
		}
	</script>

<script type="text/javascript">

  $(function(){

	    $("#addressGetPhone").on('keydown', function(e){
	       // 숫자만 입력받기
	        var trans_num = $(this).val().replace(/-/gi,'');
		var k = e.keyCode;

		if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
		{
	  	    e.preventDefault();
		}
	    }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
	        if($(this).val() == '') return;

	        // 기존 번호에서 - 를 삭제합니다.
	        var trans_num = $(this).val().replace(/-/gi,'');

	        // 입력값이 있을때만 실행합니다.
	        if(trans_num != null && trans_num != '')
	        {
	            // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
	            if(trans_num.length==11 || trans_num.length==10)
	            {
	                // 유효성 체크
	                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
	                if(regExp_ctn.test(trans_num))
	                {
	                    // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
	                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");
	                    $(this).val(trans_num);
	                }
	                else
	                {
	                    alert("유효하지 않은 전화번호 입니다.");
	                    $(this).val("");
	                    $(this).focus();
	                }
	            }
	            else
	            {
	                alert("유효하지 않은 전화번호 입니다.");
	                $(this).val("");
	                $(this).focus();
	            }
	      }
	  });
	});
  </script>

<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script>

</html>