/**
 *
 */


$(document).ready(function(){
	var one;
	var two;
	var three;
	var four;
	$('.nice-select').hide();
	$('#prodLOption1').show();
	$('#prodLOption1').change(function () {
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
			data : {"srhHighCd":one},
			dataType: "json",
			async: false,
			success:function( data ) {
				if(data.code=="S") {
					$('#div2').show();
					$('#prodLOption2').show();
					$('#prodLOption2').append("<option>" + "선택" + "</option>");
					var codeList = data.commonList;
				      for(var i = 0; i < codeList.length ; i++){
				        var option = "<option value='" + codeList[i].cdOpt + "'>" + codeList[i].cdOptNm + "</option>";
				        $('#prodLOption2').append(option);
				      }
				} else {
					alert("ERROR : Common Code");
				}
			}
		});
    });

	$('#prodLOption2').change(function () {
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
			data : {"srhHighCd":two},
			dataType: "json",
			async: false,
			success:function( data ) {
				if(data.code=="S") {
					$('#div3').show();
					$('#prodLOption3').show();
					$('#prodLOption3').append("<option>" + "선택" + "</option>");
					var codeList = data.commonList;
				      for(var i = 0; i < codeList.length ; i++){
				        var option = "<option value='" + codeList[i].cdOpt + "'>" + codeList[i].cdOptNm + "</option>";
				        $('#prodLOption3').append(option);
				      }
				} else {
					alert("ERROR : Common Code");
				}
			}
		});
    });

	$('#prodLOption3').change(function () {
		three = this.options[this.selectedIndex].value;
		if(three=="P0101" || three=="P0102" || three=="F0101" || three=="F0102" || three=="F0103"){
			if(three=="P0101" || three=="P0102"){
				three="COLOR";
			}else if(three=="F0101" || three=="F0102" || three=="F0103"){
				three="TASTE";
			}else{
				three="";
			}
	        $('#div4').hide(); //숨김
	        $('#prodLOption4').empty(); //초기화
	        $('#div5').hide(); //숨김
	        $('#prodLOption5').empty(); //초기화
	        $.ajax({
	        	url: "/web/common/selectOptionList",
				type: "post",
				data : {"srhHighCd":three},
				dataType: "json",
				async: false,
				success:function( data ) {
					if(data.code=="S") {
						$('#div4').show();
						$('#prodLOption4').show();
						$('#prodLOption4').append("<option>" + "선택" + "</option>");
						var codeList = data.commonList;
					      for(var i = 0; i < codeList.length ; i++){
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

	$('#prodLOption4').change(function () {
		if(three=="COLOR"){
			four = "SIZE";
	        $('#div5').hide(); //숨김
	        $('#prodLOption5').empty(); //초기화
	        $.ajax({
	        	url: "/web/common/selectOptionList",
				type: "post",
				data : {"srhHighCd":four},
				dataType: "json",
				async: false,
				success:function( data ) {
					if(data.code=="S") {
						$('#div5').show();
						$('#prodLOption5').show();
						$('#prodLOption5').append("<option>" + "선택" + "</option>");
						var codeList = data.commonList;
					      for(var i = 0; i < codeList.length ; i++){
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

// 가격
const formatPrice = (target) => {
  // 숫자만 남긴 후 포맷
 target.value = Number(target.value
   .replace(/[^0-9]/g, ''))
//   .toLocaleString();
}
