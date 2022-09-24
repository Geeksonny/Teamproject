/**
 *
 */

//전체체크시작

$(function(){
	var chkObj = document.getElementsByName("CheckRow");
	var rowCnt = chkObj.length;

	$("input[name='allCheck']").click(function(){
		var chk_listArr = $("input[name='CheckRow']");
		for (var i=0; i<chk_listArr.length;i++){
			chk_listArr[i].checked = this.checked;
		}
	});
	$("input[name='CheckRow']").click(function(){

			if($("input[name='RowCheck']:checked").length == rowCnt){
				$("input[name='allCheck']")[0].checked =true;
			}
			else {
				$("input[name='allCheck']")[0].checked = false;
			}
	});
});

// 전체 체크 끝

// 삭제 코드 시작
function deleteValue(){
	var sendUrl = "delete";       // Controller로 보내는 URL Controller에 /delete로 전송되고 매핑함
	var valueArr = new Array();   // valueArr에 체크된 데이터가 배열로 저장
	var list = $("input[name='CheckRow']"); // list는 CheckRow(그페이지에 있는 행수)가 저장됨
	for(var i =0; i <list.length; i++){ // 그페이지에 있는 행수 만큼 for문을 돌리되
		if(list[i].checked){            // 선택되어 있으면 배열값에 저장
			valueArr.push(list[i].value);
			console.log(list[i].value);
		}
	}



	if (valueArr.length == 0){ //valueArr길이가 0이면 경고창
		alert("항목을 선택하세요");
	}
	else{
		var chk = confirm("정말 삭제하시겠습니까?"); //chk가 boolean타입으로 선택가능
		if(chk){ //chk가 true면 if문으로 들어옴
		$.ajax({
			type : 'POST',       // Post방식
			url : sendUrl,          // 전송 URL
			traditional : true,		// ajax 배열 넘기기 옵션
			data : {
				valueArr : valueArr   // 보내고자 하는 data 변수 설정
			},
			success: function (rdata) {
				if(rdata == 1) {
				 console.log(rdata);
				 location.href="comp";
				}else {
					alert("삭제 실패");
				}

			},
			error:function(){

				alert("에러");
			}
		});
		} else {
			location.href="comp";
		}

	}
}


// 삭제 코드 끝




