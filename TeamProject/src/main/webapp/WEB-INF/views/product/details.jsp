<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<head>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/jsPro/insertBasket.js"></script>
<script type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

// 리뷰쓰기
$(document).ready(function(){
	$("#detailReply").on("click", function(e){
		debugger;
		e.preventDefault();

		const userId = '${prodDTO.userId}';
		const prodLNum = '${prodDTO.prodLNum}';
		const prodLProdnm = '${details.prodLProdnm}';

		$.ajax({
			data : {
				prodLNum : prodLNum,
				userId : userId
			},
			url : '${pageContext.request.contextPath }/product/check',
			type : 'POST',
			success : function(result){
				// 댓글 등록 전 회원이 이전에 등록한 댓글이 있는지 확인하는 기능
				// 존재 : S /  존재x : F
				if(result.code === 'S'){
					let popUrl = "${pageContext.request.contextPath }/product/replyEnroll?userId=" + userId + "&prodLNum=" + prodLNum + "&prodLProdnm=" + prodLProdnm;
					console.log(popUrl);
					let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
					window.open(popUrl,"리뷰 쓰기",popOption);
				} else{
					alert("이미 등록된 리뷰가 존재 합니다.");
				}
			}
		});

	});
});

// Related Product 관련 상품 뿌려주기
function printProdList(data){
	$('#detailsContainer').empty();
	data.forEach((e, i) => {
		var prodLPrice = e.prodLPrice;
		var price = prodLPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		$('#prodContainer').append(

		);
	});
}
</script>

<style>
.site-btn {width:47%; height:55px; cursor:pointer; text-align:center;}
#sp {color:#fff; font-size:1.2em;}
.nav-tabs .nav-link{border: 0px;}
.nav-link:hover{color:#696CFF}

</style>

    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/magnific-popup.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
</head>

<body>
<jsp:include page="../inc/menu.jsp"/>
    <!-- Shop Details Section Begin -->

  <!--================Single Product Area =================-->
  <div class="product_image_area section_padding" >
     <hr style="border:#eee solid 0.05rem !important; margin-top:0; overflow: block">

    <div class="container mt-5">
          <h4>상품</h4>
          <div class="breadcrumb__links mt-1 mb-3">
              <a href="${pageContext.request.contextPath }/main/main">홈</a>
              <a href="${pageContext.request.contextPath }/product/shop">스토어</a>
              <span>상품</span>
          </div>
      <div class="row s_product_inner justify-content-between">
        <div class="col-lg-6 col-xl-6">
            <div id="vertical">
              <div data-thumb="${pageContext.request.contextPath }/resources/img/product/${details.prodLMainimg}">
                <img src="${pageContext.request.contextPath }/resources/img/product/${details.prodLMainimg}"  width="100%"/>
              </div>
            </div>
        </div>
        <div class="col-lg-6 col-xl-6">
        <div style="padding:30px">
            <h5 class="mt-3">${details.compNm}</h5>
            <hr style="margin-bottom:12%">
          <div class="product__details__text">
            <h3>${details.prodLProdnm}</h3>
            <div class="rating">
            <c:forEach var="i" begin="1" end="${details.rating}">
	           	<i class="fa fa-star" ></i>
	            </c:forEach>
		        <span style="color:#999;">(${prodDTO.avgRating}점 / 5점)</span>
		        <span><strong>${prodDTO.countRating}</strong>개 상품평</span><br>
	      	</div>
            <!-- 상품가격의 가독성을 높이기 위해 숫자 3자리마다 콤마(,)를 찍어주도록 처리함 -->
            <div class="mt-4 mb-5">
             	<h2 style="color:#495057; font-weight:990;"><fmt:formatNumber value="${details.prodLPrice}" pattern="###,###,###"/>
             	<span style="color:#495057; font-weight:500; text-decoration:none; margin-left:0;">원</span></h2>
            </div>
            <br><br>
   		        <span style="color:#495057;"> 남은 수량 <strong>${details.prodLQuantity}</strong>개</span>
            <hr class="md-4"><br>
              <!-- 내가 찜한 목록들 리스트 볼수있게 이동? -->
              <div class="center" style="display:block">
                  <a class="site-btn mr-2" id="prodLike"><span id="sp">찜하기</span></a>
	              <a class="site-btn" id="insertBasket"><span id="sp">장바구니에 담기</span></a>
<!-- 	              장바구니에 가져갈 히든 값. 제품 코드와 가격, 수량 1개 -->
				  <input type="hidden" name="prodLcount" type="text" id="prodLcount" value="1">
	              <input type="hidden" name="prodLCode" value="${details.prodLCode}" id="prodLCode">
              	  <input type="hidden" name="prodLPrice" value="${details.prodLPrice}" id="prodLPrice">
             	 <a href="#" class="like_us"> <i class="ti-heart"></i> </a>
              </div>
            </div>
          </div>
          </div>
        </div>
      </div>
    </div>
  <!--================End Single Product Area =================-->

  <!--================Product Description Area =================-->
  <section class="product_description_area">
    <div class="container" style="margin-top:60px;">
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
          <a class="nav-link active" style="width:220px; height:50px;" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
            aria-selected="false"><strong>상품 정보</strong></a>
        <li class="nav-item">
          <a class="nav-link" style="width:220px; height:50px;" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
            aria-selected="false"><strong>상품 후기</strong></a>
        </li>
      </ul>
      <!-- 상품 정보 뿌려주는 부분 시작 -->
      <div class="tab-content " id="myTabContent">
        <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
          <div class="table-responsive">
			<div style="text-align: center;"><br><br><br>
            	<img src="${pageContext.request.contextPath }/resources/img/product/${details.prodLSubimg}"/>
            </div>
          </div>
        </div>
        <!-- 상품 정보 뿌려주는 부분 끝 -->
         <!-- 상품 후기 부분 시작 -->
        <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
          <div class="row" >

            <!-- 리뷰 쓰기 시작 -->
            <div class="col-lg-12 related-title" style="padding:30px">
              <div class="review_box">
                <div class="reply_subject">
					<br><h3 class="mb-2" style="font-weight:550">상품 리뷰</h3>
				</div>
              </div>
            <!-- 상품 후기 부분 끝 -->
              <div class="total_rate related-title">
                  <div class="box_total"><br>
                    <c:forEach var="i" begin="1" end="${details.rating}">
		           		<i class="fa fa-star fa-4x" style="color:orange"></i>
		            </c:forEach>
		            <br><br>
                    <h6><strong>평균 ${prodDTO.avgRating}점 </strong>(${prodDTO.countRating}개 상품평)</h6><br>
					<div class="reply_button_wrap">
						<button type="submit" class="site-btn" value="submit" id="detailReply">리뷰 쓰기</button>
					</div><br>
                    <hr>
                  </div>
              </div>
			  <c:forEach var="prodReply"  items="${prodReply}" >
	              <div class="review_list">
	                <div class="review_item">
	                  <div class="media">
	                    <div class="d-flex">
	                      <img src="${pageContext.request.contextPath }/resources/img/product/single-product/review-1.png" alt="" />
	                    </div>
	                    <div class="media-body">
	                      <span style="font-size: 24px; margin-right:2px">${prodReply.userId}</span>
	                      <c:forEach var="i" begin="1" end="${prodReply.rating}">
	                      	<i class="fa fa-star" style="color:orange"></i>
	                      </c:forEach>
							(${prodReply.rating}점)
	                    </div>
	                  </div>
	                    <span>${prodReply.replyDate}</span>
	                  <p>
	                    ${prodReply.content}
	                  </p>
	                </div>
	              </div>
	              <br>
				</c:forEach>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--================End Product Description Area =================-->
       <!-- Related Section Begin -->
    <section class="related spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="related-title">관련 상품</h3>
                </div>
            </div>
            <div class="row">

            	<!-- Related Product 관련상품 뿌려주는 곳 시작 -->
            	<div class="row" id="detailsContainer">
                   	<c:forEach var="prodRelatedList" items="${prodRelatedList}">
	                   	<div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
	                    	<div class="product__item">
	                        	<div class="product__item__pic set-bg">
		                        	<a href="${pageContext.request.contextPath }/product/details?prodLNum=${prodRelatedList.prodLNum}">
									<img src="${pageContext.request.contextPath }/resources/img/product/${prodRelatedList.prodLMainimg}" alt="위의 이미지를 누르면 연결됩니다."/></a>
	                            	<ul class="product__hover">
	                  	 	           <li><a href="#">
	                  	 	           	   <img src="${pageContext.request.contextPath }/resources/img/icon/heart.png" alt=""><span>찜하기</span></a>
	                  	 	           </li>
	                                </ul>
	                           	</div>
	                            <div class="product__item__text">
	                            	<h6>${prodRelatedList.prodLProdnm}</h6>
	                            	<a href="${pageContext.request.contextPath }/order/cart"></a>
	                                <!-- 상품가격의 가독성을 높이기 위해 숫자 3자리마다 콤마(,)를 찍어주도록 처리함 -->
	                                <h5> <fmt:formatNumber value="${prodRelatedList.prodLPrice}" pattern="###,###,###원"/></h5>
	                                <div class="rating">
										<c:forEach var="i" begin="1" end="${prodRelatedList.avgRating}">
											<i class="fa fa-star"></i>
	                      				</c:forEach>
	                            	</div>
	                        	</div>
	                    	</div>
	                	</div>
	            	</c:forEach>
	            </div>
            	<!-- Related Product 관련상품 뿌려주는 곳 끝 -->
            </div>
        </div>
    </section>
    <!-- Related Section End -->

    <!-- Footer Section Begin -->
    <jsp:include page="../inc/footer.jsp"/>
    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.nicescroll.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
</body>

</html>