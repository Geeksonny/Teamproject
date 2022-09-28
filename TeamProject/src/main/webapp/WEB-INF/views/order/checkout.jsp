
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
<script
   src="${pageContext.request.contextPath }/resources/jsPro/basketListPro.js"></script>
</head>
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
<script>


function usePoint1() {
      var nowPoint = ${pointDTO2.pointNow};
      if(${total}*$('#myCouponList').val().split('_')[1] != 0) {
         var total = ${total}*$('#myCouponList').val().split('_')[1];
      }else{
         var total = ${total}
      }
      if($('#textUsePoint').val()%1==0){
         calc();
         
            // 0<입력포인트<1000P &&  * 입력포인트<=보유포인트 && 총금액 >=2000
         if(0<$('#textUsePoint').val() && $('#textUsePoint').val()<1000 && $('#textUsePoint').val()<nowPoint && total>=2000){
              if(nowPoint>=1000){
                 alert('최소 사용 가능 포인트는 1000P 입니다.');
                 $('#textUsePoint').val(1000);
              }else{
                 alert('최소 사용 가능 포인트는 1000P 입니다.');
                 alert('포인트가 부족합니다.');
                 $('#textUsePoint').val(0);
              }
           // 0<입력포인트<1000P && 입력포인트>보유포인트   
         }else if(0<$('#textUsePoint').val() && $('#textUsePoint').val()<1000 && $('#textUsePoint').val()>nowPoint){
              alert('최소 사용 가능 포인트는 1000P 입니다.');
              alert('사용 가능 포인트를 초과하였습니다.');
              $('#textUsePoint').val(0);
           // 입력포인트>total+1000 && 입력포인트>보유포인트 : 결제금액이 1000원 이상이될때   
         }else if($('#textUsePoint').val()>total-1000 && $('#textUsePoint').val()>=nowPoint){
              alert('사용 가능 포인트를 초과하였습니다.');
              if(total>=nowPoint+1000 && nowPoint>=1000 ){
                 $('#textUsePoint').val(nowPoint);
              }else{
                 alert('최소 결제금액은 1000원입니다.');
                 $('#textUsePoint').val(0);
              }
          // 입력포인트>=total-1000 && 입력포인트<=보유포인트 :    
         }else if($('#textUsePoint').val()>=total-1000 && $('#textUsePoint').val()<=nowPoint){
            if(total-$('#textUsePoint').val()>=1000){
                 alert('최소 결제금액은 1000원입니다.');
                 $('#textUsePoint').val(Math.floor(total-1000));
              }else{
                 alert('최소 결제금액은 1000원입니다.');
                 $('#textUsePoint').val(Math.floor(total-1000));
              }
         }else if($('#textUsePoint').val()==total ){
            if($('#textUsePoint').val()<=nowPoint){
                 alert('최소 결제금액은 1000원입니다.');
                 $('#textUsePoint').val(Math.floor(total-1000));
            }else{
                 Math.floor($('#textUsePoint').val());
            }
         }else if(0<$('#textUsePoint').val() && $('#textUsePoint').val()>nowPoint){
              alert('사용 가능 포인트를 초과하였습니다.');
              $('#textUsePoint').val(0);
         }     
         
      calc();
      }else{
         alert('올바른 숫자를 입력하세요.');
         $('#textUsePoint').val(0);
      }
}

// $('#textUsePoint').val()<nowPoint && total>$('#textUsePoint').val()

function useCoupon1(){
   calc();
   var total1 = $('#total2').text().slice(-6,4);
   var point1 = $('#usePoint2').text().slice(-6,4);
   if(total1 != ${total}){
//       $('#textUsePoint').val(point1 + total1 - 1000);
      calc();
      usePoint1();
   }else {
      calc();
   }
}

function calc() {
   var total = ${total}; // 원래결재금액
   var discount = 0;
   var coupon = $('#myCouponList').val().split('_')[1];
   var point = 0 + Math.floor($('#textUsePoint').val());

   discount += parseInt(point);

   // 할인율 적용
   if(coupon != 0) {
      discount += total * (1 - coupon);
      total *= coupon;
   }

   // 포인트 차감
   total -= point;

   // 합계에 적용
   document.getElementById('usePoint2').innerHTML= Math.round(discount) +"원";
   document.getElementById('total2').innerHTML= Math.floor(total) +"원";
}

function myCoupon(){
 var sbUser = "${memberDTO.userId}";
 $('.nice-select').hide();
 $('#myCouponList').show();
   $.ajax({
           url: "myCoupon",
         type: "post",
         data : {'couUserId':sbUser},
         dataType: "json",
         async: false,
         success:function( data ) {
            if(data.code=="S") {
               $('#myCouponList').append("<option value='0_0'>" + "선택" + "</option>");

               var codeList = data.couponList;
                  for(var i = 0; i < codeList.length ; i++){
//                     if(codeList[i].couYn!='N'){
                    var option = "<option value='" + codeList[i].couNumCouDc + "'>" + codeList[i].couNm + "</option>";
                    $('#myCouponList').append(option);
                  }
//                     }
            } else {
               alert("ERROR : Common Code");
            }
         }
      }); // ajax
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
        var amount = Number($('#total2').text().slice(0, -1));
        var discount = Number($('#usePoint2').text().slice(0, -1));
        var nowPoint = '${pointDTO2.pointNow}' - $('#textUsePoint').val();
      var couNm = $('#myCouponList').val().split('_')[0];
      var ordLCouponnum = $('#myCouponList').val().split('_')[0];
        //가맹점 식별코드
        IMP.init('imp27865884');
        IMP.request_pay({
            pg : 'html5_inicis',
            pay_method : 'card',
            merchant_uid : '${memberDTO.userId}' + new Date().getTime(),
            name : '핏티드' , //결제창에서 보여질 이름
            buyer_name: '${memberDTO.userNm}',
            buyer_tel: '${memberDTO.userPhone}',
            buyer_email: '${memberDTO.userEmail}',
            amount : amount, //실제 결제되는 가격
        }, function(rsp) {
           console.log(rsp);


            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                var add = "";
                add += '${addressDTO.address }' + "  " +'${addressDTO.addressDetails }';
                var addZipcode= "";
                addZipcode += '${addressDTO.addressZipcode }';
                alert(msg);

                debugger;
                
                $.ajax({
                    url: "orderComplete",
                   type: "POST",
                   data: { 'ordUser'          :'${memberDTO.userId}',
                          'ordGetNm'         :'${addressDTO.addressGetNm}',
                          'couNm'            : couNm,
                          'couYn'            : 'N',
                          'ordLCouponnum'      : ordLCouponnum,
                          'ordGetZipcode'      : addZipcode,
                          'ordGetAddress'          : add,
                          'ordGetPhone'       :'${addressDTO.addressGetPhone }',
                          'ordDeliveryMessage' : $('#ordDeliveryMessage').val(),
                          'ordTotalPrice'      :'${total}',
                          'ordCouponDc'      : discount,
                          'pointNow'         : nowPoint,
                          'pointUsed'         : $('#textUsePoint').val(),
                          'ordFinalPrice'      : amount,
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

    <!-- 결제 Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">

                  <!-- 주문자 정보 -->
                            <h6 class="checkout__title">주문자 정보
                        <a href="/web/mypage/modify" class="text-primary float-right" style="text-decoration:none;">
                           정보 변경
                        </a>
                            </h6>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>이름</p>
                                        <input type="text" value="${memberDTO.userNm }">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>이메일</p>
                                        <input type="text" value="${memberDTO.userEmail }">
                                    </div>
                                </div>
                            </div>

                  <!-- 배송지 정보 -->
                            <h6 class="checkout__title mt-4">배송지 정보</h6>
                              <c:if test="${addressDTO.address ne null }">
                           <form name="updateAddressPro2" class=form-update
                              action="${pageContext.request.contextPath }/order/updateAddressPro2"
                              method="post">
                        </c:if>

                        <c:if test="${addressDTO.address eq null }">
                           <form name="insertAddress2"
                              action="${pageContext.request.contextPath }/order/insertAddress2"
                              method="post">
                        </c:if>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>받는 분</p>
                                        <input    type="text"
                                              name="addressGetNm" id="addressGetNm"
                                    value="${addressDTO.addressGetNm}">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>연락처</p>
                                        <input    type="text"
                                              name="addressGetPhone" id="addressGetPhone" maxlength="11"
                                    value="${addressDTO.addressGetPhone}" placeholder="숫자만 입력하세요."/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="checkout__input">
                                        <p>우편 번호</p>
                                        <input    type="text"
                                    name="addressZipcode" id="addressZipcode"
                                    value="${addressDTO.addressZipcode}" onclick="sample6_execDaumPostcode()" readonly />
                                    </div>
                                </div>
                                <div class="col-lg-8">
                                    <div class="checkout__input">
                                        <p>주소</p>
                                        <input type="text" id="address" name="address" value="${addressDTO.address }" onclick="sample6_execDaumPostcode()">
                                    </div>
                               </div>
                            </div>
                             <div class="checkout__input">
                                <p>상세 주소</p>
                                <input type="text" id="addressDetails" name="addressDetails" value="${addressDTO.addressDetails }" >
                            </div>
                            <div class="checkout__input">
                           <p>배송 요구 사항</p>
                           <input   type="text"
                                 id="ordDeliveryMessage"
                                 name="ordDeliveryMessage"
                                 placeholder="메세지를 입력하세요.">
                     </div>

                     <c:if test="${addressDTO.address ne null }">
                        <button type="submit" class="site-btn mb-3 mt-1">배송지
                           저장</button>
                        <button type="reset" class="site-btn mb-3 mt-1">취소</button>
                        </form>
                     </c:if>
                     <c:if test="${addressDTO.address eq null }">
                        <button type="submit" class="site-btn mb-3 mt-1">배송지
                           저장</button>
                        <button type="reset" class="site-btn mb-3 mt-1" >취소</button>
                        </form>
                     </c:if>
                  </div>

               <!--  포인트 / 쿠폰 -->
                        <div class="col-lg-4 col-md-5">
                     <div class="cart__discount">
                        <div class="mb-2">
                              <h6>포인트 / 쿠폰</h6>
                           <!-- 현재 보유 포인트 -->
                                     <input    type="hidden" id="currentPoint"
                                    name="currentPoint" value="0"> <input
                                    type="hidden" id="usePoint" name="usePoint" value="0">
                              <input    type="number" style="width:75%"
                                    id="textUsePoint"
                                    name="textUsePoint" placeholder="1,000 P부터 사용 가능"
                                    min='1000' max="${pointDTO2.pointNow}"
                                    onblur="usePoint1()">
<!--                                          <button type="button" class="site-btn" onclick="calc(this)"> -->
<!--                                     삭제 -->
<!--                                  </button> -->
                                 </div>
                                 <div>
                           <p style="display:inline-block;">
                              사용 가능 포인트 <em class="text-num-bold">${pointDTO2.pointNow}</em> P
                           </p>
<!--                            <button type="button" class="site-btn float-right" id="pointUseAll" -->
<!--                                           onclick="calc(this)"> -->
<!--                               전액 사용 -->
<!--                            </button> -->
                        </div>

                        <!-- 쿠폰 -->
                           <div class="mb-3 mt-5">
                              <select id="myCouponList"
                                 class="form-select form-control" name="myCouponList" onchange="useCoupon1()">
                              </select>
                           </div>
                        </div>

                            <div class="checkout__order">
                        <h4 class="order__title">주문 정보</h4>
                        <div class="checkout__order__products">
                           <strong>상품</strong> <span><strong>가격</strong> </span>
                        </div>

                        <c:forEach items="${basketList }" var="basketDTO"
                           varStatus="status">
                           <ul class="checkout__total__products">
                              <li>${basketDTO.sbProdNm }${basketDTO.sbCount }개<span>${basketDTO.sbProdPrice }원</span></li>
                              <li><strong>${basketDTO.sbProdPrice *basketDTO.sbCount }원</strong></li>
                           </ul>
                        </c:forEach>

                        <ul class="checkout__total__all">
                           <li>할인 금액<span id="usePoint2">0 원</span></li>
                           <li>합계 <span id="total2">${total } 원</span></li>
                        </ul>
                           <button type="button" class="site-btn" onclick="iamport();">결제하기</button>
                        </div>
                     </div>
                    </div>
            </div>
        </div>
    </section>
   <!-- Footer Sect
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

<!— jQuery —>
<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!— iamport.payment.js —>
<script type="text/javascript"
   src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script>
</html>