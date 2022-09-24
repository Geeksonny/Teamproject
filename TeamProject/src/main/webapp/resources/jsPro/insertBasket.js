/**
 *
 */


$(document)
			.ready(
					function () {
					$("#insertBasket ").on("click",function (){
						var prodLCode = $('#prodLCode').val(); // 제품 코드
						var prodLPrice = $('#prodLPrice').val(); // 제품 가격
						var prodLcount = $('#prodLcount').val();   // 제품 수량

							$.ajax({
										type : 'POST',
										url:'cartPro',
										dataType : "json",
										data : {
											'sbProdCode' : prodLCode,
											'sbProdPrice' : prodLPrice,
											'sbCount' : prodLcount
										},
										success : function(data) {
												if (data == 1) {
											var chk = confirm("상품이 추가 되었습니다. 장바구니로 이동하시겠습니까?	");
													if(chk){
														location.href="/web/order/cart";
													}else {
														location.href="shop";
													}
												}
												 else if (data == 2) {
													alert("중복 상품 입니다.");
													location.href="shop";
												 }

										} //success 괄호

									}); // ajax괄호



					});

			  });

