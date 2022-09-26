/**
 *
 */



 $(document).ready(function(){

$("#couNumbtn").click(function(){
	$('#couNum').val(Math.floor(100000 + Math.random()*900000));

	});



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








