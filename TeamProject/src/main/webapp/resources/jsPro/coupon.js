/**
 *
 */



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
		checkCouNumResult =false;
	} else  {

		$.ajax({
		url:'couNumDupCheck',
		data:{'couNum':couNum},
		type: 'POST',
		success:function(rdata){
			if(rdata=='1'){	// 아이디가 중복이거나 글자 수 넘억
				spanElem.innerHTML = "중복입니다.";
				checkCouNumResult =false;
			}else{
				spanElem.innerHTML = "사용가능한 상품코드입니다.";
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





