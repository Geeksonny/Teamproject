/**
 *
 */

$(document).ready(function(){
itemTotal(); // 전체 합계
myCoupon(); // 쿠폰 선택



}); // documnet



function myCoupon(){
 var sbUser = $('#sbUser').val();
 $('.nice-select').hide();
 $('#myCouponList').show();
	$.ajax({
        	url: "/web/order/myCoupon",
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
	var url = "/web/order/update";

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





