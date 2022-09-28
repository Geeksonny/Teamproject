/**
 *
 */


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
			url: "/web/common/selectOptionList",
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
			url: "/web/common/selectOptionList",
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
				url: "/web/common/selectOptionList",
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
				url: "/web/common/selectOptionList",
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
