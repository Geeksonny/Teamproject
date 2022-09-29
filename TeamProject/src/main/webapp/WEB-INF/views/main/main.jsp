<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
/* $(document).ready(function(){
	//id="idbtn"
	$('.prodLike').click(function(){
		var prodLCode = this.value;
		var i = $(this).next().val();
		$.ajax({
			type : 'POST', 
			url:'${pageContext.request.contextPath}/main/mainLike',
			data:{'prodLCode' : prodLCode},
			/* dataType : 'text', 
			success:function(rdata){
				var result = "${pageContext.request.contextPath }/resources/img/icon/"+rdata;
				$("input[id$="+i+"]").attr("src", result);
			}
		});
	});
}); */

$(document).ready(function(){
	//id="idbtn"
	$('.prodLike').click(function(){
		var prodLCode = this.value;
		var th = this;
		$.ajax({
			type : 'POST', 
			url:'${pageContext.request.contextPath}/main/mainLike',
			data:{prodLCode : prodLCode},
			/* dataType : 'text', */
			success:function(rdata){
				var value = this.data.split('=')[1];
				var result = "${pageContext.request.contextPath }/resources/img/icon/"+rdata;
				$('input[value=' + value + ']').attr("src", result);
// 				$(".prodLike").attr("src", result);
			}
		});
	});
	
});


$(document).ready(function(){
	$('.prodbsLike').click(function(){
		var prodLCode = this.value;
		var th = this;
		$.ajax({
			type : 'POST', 
			url:'${pageContext.request.contextPath}/main/mainbsLike',
			data:{prodLCode : prodLCode},
			/* dataType : 'text', */
			success:function(rdata){
				var value = this.data.split('=')[1];
				var result = "${pageContext.request.contextPath }/resources/img/icon/"+rdata;
				$('input[value=' + value + ']').attr("src", result);
			}
		});
	});
});

</script>
</head>
<body>
<!-- 메뉴단 -->
<jsp:include page="../inc/menu.jsp"/>
    <!-- 광고단 -->
    <section class="hero">
        <div class="hero__slider owl-carousel">
            <div class="hero__items set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/hero/hero-01.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-5">
                            <div class="hero__text">
                                <h6>새 소식</h6>
                                <h2 style="color:#fff; text-shadow:-2px 1px 15px #000;">핏티드 X HEALTHY 한정 콜라보 </h2>
<!--                                 <p style="background-color:#000">핏티등와 HEALTHY가 콜라보한 신상품을 만나보세요!</p> -->
                                <a href="${pageContext.request.contextPath }/product/shop" class="primary-btn mt-3">스토어 가기<span class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__items set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/hero/hero-02.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h6 style="color:#000">공지사항</h6>
                                <h2>핏티드 가입 시 <br>1000P 즉시 적립</h2>
                                <a href="${pageContext.request.contextPath }/member/join" class="primary-btn mt-3" style="background-color:#3a4046;">가입하기<span class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__items set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/hero/hero-03.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h6>커뮤니티</h6>
                                <h2>핏티드 가입 시 <br>1000P 즉시 적립</h2>
                                <a href="${pageContext.request.contextPath }/board/list" class="primary-btn mt-3">커뮤니티 가기<span class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 상품란 -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="filter__controls">
                        <li class="active" data-filter=".new-arrivals">신상품</li>
                        <li data-filter=".hot-sales">많이 팔린 상품</li>
                    </ul>
                </div>
            </div>
            <div class="row product__filter">
            <!-- 신상품 -->
				<c:forEach var="newProdList" items="${newProdList}">
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                        	<a href="${pageContext.request.contextPath }/product/details?prodLNum=${newProdList.prodLNum}">
								<img src="${pageContext.request.contextPath }/resources/img/product/${newProdList.prodLMainimg}" alt="위의 이미지를 누르면 연결됩니다."/>
							</a>
                            <span class="label">New</span>
                            <ul class="product__hover">
               	 	           <li><input type="image" class="prodLike" id="prodpic${status.index}" src="${pageContext.request.contextPath }/resources/img/icon/${newProdList.heart}" value="${newProdList.prodLCode}">
                            </ul>
                        </div>
                        <div class="product__item__text">
                           <h7>${newProdList.prodLProdnm}</h7>
                           <!-- 상품가격의 가독성을 높이기 위해 숫자 3자리마다 콤마(,)를 찍어주도록 처리함 -->
                           <h5> <fmt:formatNumber value="${newProdList.prodLPrice}" pattern="###,###,###원"/></h5>
                            <div class="rating">
                             <c:forEach var="i" begin="1" end="${newProdList.avgRating}">
				             	<i class="fa fa-star" style="color:orange"></i>
				             </c:forEach>
                           </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <!-- 많이 팔린 상품 -->
				<c:forEach var="bsProdList" items="${bsProdList}">
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales" style="display: none;">
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                        	<a href="${pageContext.request.contextPath }/product/details?prodLNum=${bsProdList.prodLNum}">
								<img src="${pageContext.request.contextPath }/resources/img/product/${bsProdList.prodLMainimg}" alt="위의 이미지를 누르면 연결됩니다."/>
							</a>
							<span class="label">Hot</span>
                            <ul class="product__hover">
                                <li><input type="image" class="prodbsLike" id="prodbspic" src="${pageContext.request.contextPath }/resources/img/icon/${bsProdList.heart}" value="${bsProdList.prodLCode}"></li>
                           </ul>
                        </div>
                        <div class="product__item__text">
                           <h7>${bsProdList.prodLProdnm}</h7>
                           <!-- 상품가격의 가독성을 높이기 위해 숫자 3자리마다 콤마(,)를 찍어주도록 처리함 -->
                           <h5> <fmt:formatNumber value="${bsProdList.prodLPrice}" pattern="###,###,###원"/></h5>
                            <div class="rating">
                             <c:forEach var="i" begin="1" end="${bsProdList.avgRating}">
				             	<i class="fa fa-star" style="color:orange"></i>
				             </c:forEach>
                           </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>

<!--     커뮤니티란 -->
<!--     <section class="instagram spad"> -->
<!--         <div class="container"> -->
<!--             <div class="row"> -->
<!--                 <div class="col-lg-8"> -->
<!--                     <div class="instagram__pic"> -->
<%--                         <div class="instagram__pic__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/instagram/instagram-1.jpg"></div> --%>
<%--                         <div class="instagram__pic__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/instagram/instagram-2.jpg"></div> --%>
<%--                         <div class="instagram__pic__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/instagram/instagram-3.jpg"></div> --%>
<%--                         <div class="instagram__pic__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/instagram/instagram-4.jpg"></div> --%>
<%--                         <div class="instagram__pic__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/instagram/instagram-5.jpg"></div> --%>
<%--                         <div class="instagram__pic__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/instagram/instagram-6.jpg"></div> --%>
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-lg-4"> -->
<!--                     <div class="instagram__text"> -->
<!--                         <h2>커뮤니티</h2> -->
<!--                         <p>#오.운.완 이벤트 같은 설명, 당첨자 발표 등등</p> -->
<!--                         <h3>후기 보러가기</h3> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </section> -->

    <!-- 커뮤니티 -->
    <section class="latest spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <span>COMMUNITY</span>
                        <h2>인기 포스트 TOP 3</h2>
                    </div>
                </div>
            </div>
            <div class="row">
           <c:set var="file" value="c"/>
           <c:forEach var="boardDTO"  items="${boardTopList}" end="2">
           <c:choose>
           	<c:when test="${file != null}">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="${pageContext.request.contextPath }/resources/upload/${file}"></div>
                        <div class="blog__item__text">
                            <span>${boardDTO.userNicknm}</span>
                            <h5>${boardDTO.boardSubject}</h5>
                            <a href="${pageContext.request.contextPath }/board/content?boardNum=${boardDTO.boardNum }&userId=${sessionScope.userId}">보러가기</a>
                        </div>
                    </div>
                </div>
                </c:when>
                <c:when test="${file == null}">
                <div class="col-lg-4 col-md-6 col-sm-6">
                	<div class="blog__item__pic set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/blog/blog-1.jpg"></div>
                    <div class="blog__item">
                        <div class="blog__item__text">
                           <span>${boardDTO.userNicknm}</span>
                            <h5>${boardDTO.boardSubject}</h5>
                            <a href="${pageContext.request.contextPath }/board/content?boardNum=${boardDTO.boardNum }&userId=${sessionScope.userId}">보러가기</a>
                        </div>
                    </div>
                </div>
                </c:when>
                 <c:when test="${file == logo.png}">
                <div class="col-lg-4 col-md-6 col-sm-6">
                	<div class="blog__item__pic set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/blog/blog-1.jpg"></div>
                    <div class="blog__item">
                        <div class="blog__item__text">
                           <span>${boardDTO.userNicknm}</span>
                            <h5>${boardDTO.boardSubject}</h5>
                            <a href="${pageContext.request.contextPath }/board/content?boardNum=${boardDTO.boardNum }&userId=${sessionScope.userId}">보러가기</a>
                        </div>
                    </div>
                </div>
                </c:when>
                </c:choose>
                </c:forEach>
            </div>
        </div>
        
    </section>
    <!-- Footer Section Begin -->
    <jsp:include page="../inc/footer.jsp"/>
</body>
<!-- Channel Plugin Scripts -->
<!-- 챗봇 -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "f88963ba-cfd2-4f1a-bc5f-bd77a957f68b", //please fill with your plugin key
  });
</script>
<!-- End Channel Plugin -->
</html>