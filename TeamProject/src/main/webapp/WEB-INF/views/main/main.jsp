<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h6>광고단</h6>
                                <h2>이벤트나 광고</h2>
                                <p>설명설명</p>
                                <a href="#" class="primary-btn">보러가기<span class="arrow_right"></span></a>
                                <div class="hero__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </div>
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
                                <h6>광고단2</h6>
                                <h2>이벤트나 광고2</h2>
                                <p>설명설명2</p>
                                <a href="#" class="primary-btn">보러가기<span class="arrow_right"></span></a>
                                <div class="hero__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </div>
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
                                <h6>광고단2</h6>
                                <h2>이벤트나 광고2</h2>
                                <p>설명설명2</p>
                                <a href="#" class="primary-btn">보러가기<span class="arrow_right"></span></a>
                                <div class="hero__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </div>
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
                        <li class="active" data-filter="*">많이 팔린 상품</li>
                        <li data-filter=".new-arrivals">신상품</li>
                        <li data-filter=".hot-sales">세일 중</li>
                    </ul>
                </div>
            </div>
            <div class="row product__filter">
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/product/product-1.jpg">
                            <span class="label">New</span>
                            <ul class="product__hover">
                                <li><a href="#"><img src="${pageContext.request.contextPath }/resources/img/icon/heart.png" alt=""><span>찜하기</span></a></li>
                                <li><a href="../mypage/cart.jsp"><img src="${pageContext.request.contextPath }/resources/img/icon/cart.png" alt=""><span>장바구니 담기</span></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Piqué Biker Jacket</h6>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>8000원</h5>
                            <div class="product__color__select">
                                <label for="pc-1">
                                    <input type="radio" id="pc-1">
                                </label>
                                <label class="active black" for="pc-2">
                                    <input type="radio" id="pc-2">
                                </label>
                                <label class="grey" for="pc-3">
                                    <input type="radio" id="pc-3">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/product/product-2.jpg">
                            <ul class="product__hover">
                                <li><a href="#"><img src="${pageContext.request.contextPath }/resources/img/icon/heart.png" alt=""><span>찜하기</span></a></li>
                                <li><a href="../mypage/cart.jsp"><img src="${pageContext.request.contextPath }/resources/img/icon/cart.png" alt=""><span>장바구니 담기</span></a></li>
                           </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Piqué Biker Jacket</h6>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>8000원</h5>
                            <div class="product__color__select">
                                <label for="pc-4">
                                    <input type="radio" id="pc-4">
                                </label>
                                <label class="active black" for="pc-5">
                                    <input type="radio" id="pc-5">
                                </label>
                                <label class="grey" for="pc-6">
                                    <input type="radio" id="pc-6">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    <div class="product__item sale">
                        <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/product/product-3.jpg">
                            <span class="label">Sale</span>
                            <ul class="product__hover">
                                <li><a href="#"><img src="${pageContext.request.contextPath }/resources/img/icon/heart.png" alt=""><span>찜하기</span></a></li>
                                <li><a href="../mypage/cart.jsp"><img src="${pageContext.request.contextPath }/resources/img/icon/cart.png" alt=""><span>장바구니 담기</span></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Multi-pocket Chest Bag</h6>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>13000원</h5>
                            <div class="product__color__select">
                                <label for="pc-7">
                                    <input type="radio" id="pc-7">
                                </label>
                                <label class="active black" for="pc-8">
                                    <input type="radio" id="pc-8">
                                </label>
                                <label class="grey" for="pc-9">
                                    <input type="radio" id="pc-9">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/product/product-4.jpg">
                            <ul class="product__hover">
                                <li><a href="#"><img src="${pageContext.request.contextPath }/resources/img/icon/heart.png" alt=""><span>찜하기</span></a></li>
                                <li><a href="../mypage/cart.jsp"><img src="${pageContext.request.contextPath }/resources/img/icon/cart.png" alt=""><span>장바구니 담기</span></a></li>
                           </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Diagonal Textured Cap</h6>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>27000원</h5>
                            <div class="product__color__select">
                                <label for="pc-10">
                                    <input type="radio" id="pc-10">
                                </label>
                                <label class="active black" for="pc-11">
                                    <input type="radio" id="pc-11">
                                </label>
                                <label class="grey" for="pc-12">
                                    <input type="radio" id="pc-12">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/product/product-5.jpg">
                            <ul class="product__hover">
                                <li><a href="#"><img src="${pageContext.request.contextPath }/resources/img/icon/heart.png" alt=""><span>찜하기</span></a></li>
                                <li><a href="../mypage/cart.jsp"><img src="${pageContext.request.contextPath }/resources/img/icon/cart.png" alt=""><span>장바구니 담기</span></a></li>
                           </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Lether Backpack</h6>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>4000원</h5>
                            <div class="product__color__select">
                                <label for="pc-13">
                                    <input type="radio" id="pc-13">
                                </label>
                                <label class="active black" for="pc-14">
                                    <input type="radio" id="pc-14">
                                </label>
                                <label class="grey" for="pc-15">
                                    <input type="radio" id="pc-15">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                    <div class="product__item sale">
                        <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/product/product-6.jpg">
                            <span class="label">Sale</span>
                            <ul class="product__hover">
                                <li><a href="#"><img src="${pageContext.request.contextPath }/resources/img/icon/heart.png" alt=""><span>찜하기</span></a></li>
                                <li><a href="../mypage/cart.jsp"><img src="${pageContext.request.contextPath }/resources/img/icon/cart.png" alt=""><span>장바구니 담기</span></a></li>
                           </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Ankle Boots</h6>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>25000원</h5>
                            <div class="product__color__select">
                                <label for="pc-16">
                                    <input type="radio" id="pc-16">
                                </label>
                                <label class="active black" for="pc-17">
                                    <input type="radio" id="pc-17">
                                </label>
                                <label class="grey" for="pc-18">
                                    <input type="radio" id="pc-18">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/product/product-7.jpg">
                            <ul class="product__hover">
                                <li><a href="#"><img src="${pageContext.request.contextPath }/resources/img/icon/heart.png" alt=""><span>찜하기</span></a></li>
                                <li><a href="../mypage/cart.jsp"><img src="${pageContext.request.contextPath }/resources/img/icon/cart.png" alt=""><span>장바구니 담기</span></a></li>
                           </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>T-shirt Contrast Pocket</h6>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>3000원</h5>
                            <div class="product__color__select">
                                <label for="pc-19">
                                    <input type="radio" id="pc-19">
                                </label>
                                <label class="active black" for="pc-20">
                                    <input type="radio" id="pc-20">
                                </label>
                                <label class="grey" for="pc-21">
                                    <input type="radio" id="pc-21">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/product/product-8.jpg">
                            <ul class="product__hover">
                                <li><a href="#"><img src="${pageContext.request.contextPath }/resources/img/icon/heart.png" alt=""><span>찜하기</span></a></li>
                                <li><a href="../mypage/cart.jsp"><img src="${pageContext.request.contextPath }/resources/img/icon/cart.png" alt=""><span>장바구니 담기</span></a></li>
                         </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Basic Flowing Scarf</h6>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <h5>12000원</h5>
                            <div class="product__color__select">
                                <label for="pc-22">
                                    <input type="radio" id="pc-22">
                                </label>
                                <label class="active black" for="pc-23">
                                    <input type="radio" id="pc-23">
                                </label>
                                <label class="grey" for="pc-24">
                                    <input type="radio" id="pc-24">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 커뮤니티란 -->
    <section class="instagram spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="instagram__pic">
                        <div class="instagram__pic__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/instagram/instagram-1.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/instagram/instagram-2.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/instagram/instagram-3.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/instagram/instagram-4.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/instagram/instagram-5.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/instagram/instagram-6.jpg"></div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="instagram__text">
                        <h2>커뮤니티</h2>
                        <p>#오.운.완 이벤트 같은 설명, 당첨자 발표 등등</p>
                        <h3>후기 보러가기</h3>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 인기트레이너란 -->
    <section class="latest spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <span>Daily Trainning</span>
                        <h2>8월 인기 트레이너</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/blog/blog-1.jpg"></div>
                        <div class="blog__item__text">
                            <span>소개소개</span>
                            <h5>헬스 몇 년 경력 무슨 자격증의 트레이너 소개</h5>
                            <a href="#">신청하기</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                	<div class="blog__item__pic set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/blog/blog-2.jpg"></div>
                    <div class="blog__item">
                        <div class="blog__item__text">
                            <span>소개소개</span>
                            <h5>홈트레이닝 PT 트레이너 소개</h5>
                            <a href="#">신청하기</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/blog/blog-3.jpg"></div>
                        <div class="blog__item__text">
                            <span>소개소개</span>
                            <h5>크로스핏 트레이너 소개</h5>
                            <a href="#">신청하기</a>
                        </div>
                    </div>
                </div>
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