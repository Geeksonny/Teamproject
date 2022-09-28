/**
 *
 */



$(document).ready(function() {

	$("#couNum").on('focus keyup', checkCouNum);

}); // documnet

var checkCouNumResult = false;			// 쿠폰 코드 중복검사

function checkCouNum() {

	var numRegex = /^[0-9]{18}$/;
	var couNum = $('#couNum').val();
	var spanElem = document.getElementById("checkCouNumResult");

	if (!numRegex.exec(couNum) || couNum.length == 0 || couNum.length == "") {

		spanElem.innerHTML = "18자리의 숫자를 입력해주세요";
		spanElem.style.color = "RED";
		checkCouNumResult = false;
	} else {	debugger; // 18자리가 숫자가 맞으면 들어옴

		$.ajax({
			url: '/web/admin/couNumDupCheck',
			data: { 'couNum': couNum },
			type: 'POST',
			success: function(rdata) {debugger;
				if (rdata == '1') {	// 관리자 쿠폰 테이블에 쿠폰이 있는경우
					// 유저 테이블에 쿠폰이 있는지 검사
					$.ajax({
						url: '/web/admin/myCouNumDupCheck',
						data: { 'couNum': couNum },
						type: 'POST',
						success: function(rdata) {
							if (rdata == '0') {	// 유저테이블에 쿠폰이 없으면
								spanElem.innerHTML = "사용가능한 쿠폰입니다.";
								spanElem.style.color = "GREEN";
								checkCouNumResult = true;
							} else { //유저 테이블에 쿠폰이 있으면
								spanElem.innerHTML = "이미 등록된 쿠폰입니다.";
								checkCouNumResult = false;
								spanElem.style.color = "RED";
							}
						}
					}); //ajax myCouNumDupCheck

				} else { // 관리자 쿠폰 테이블에 쿠폰이 없는경우
					checkCouNumResult = false;
					spanElem.innerHTML = "없는 쿠폰입니다.";
					spanElem.style.color = "RED";
				}
			}
		}); //couNumDupCheck ajax







	}

} // checkCouNum 마지막 괄호

function myCouponChk() {

	var couNm = $('#couNum').val();

	if (!checkCouNumResult) {
		alert("쿠폰 코드 체크 필수");
		$('#couNum').focus();
		return false;
	} else {
		return true;
	}


}





