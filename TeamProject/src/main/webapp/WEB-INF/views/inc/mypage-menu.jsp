<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <head>
     <meta charset="utf-8" />
 <meta
   name="viewport"
   content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
 />

 <meta name="description" content="" />

 <!-- Favicon -->
 <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/assets/img/favicon/favicon.ico" />

 <!-- Fonts -->
 <link rel="preconnect" href="https://fonts.googleapis.com" />
 <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
 <link
   href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
   rel="stylesheet"
 />

 <!-- Icons. Uncomment required icon fonts -->
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendor/fonts/boxicons.css" />

 <!-- Core CSS -->
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendor/css/core.css" class="template-customizer-core-css" />
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/demo.css" />

 <!-- Vendors CSS -->
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendor/libs/apex-charts/apex-charts.css" />

 <!-- Page CSS -->

 <!-- Helpers -->
 <script src="${pageContext.request.contextPath }/resources/assets/vendor/js/helpers.js"></script>

 <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
 <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
 <script src="${pageContext.request.contextPath }/resources/assets/js/config.js"></script>
 <style type="text/css">

 @media (min-width: 992px) {
  .bg-navbar-theme {
    background-color: transparent !important;
    color: #697a8d;}
  }
 </style>

 </head>
        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">

            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">
            <!-- Dashboard -->
            <li class="menu-item active">
              <a href="${pageContext.request.contextPath }/mypage" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">마이페이지</div>
              </a>
            </li>

            <li class="menu-header small text-uppercase">
              <span class="menu-header-text">내 계정</span>
            </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath }/mypage/modify" class="menu-link">
                <i class="menu-icon tf-icons bx bx-user"></i>
                <div data-i18n="Tables">계정 정보</div>
              </a>
           </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath }/mypage/passMod" class="menu-link">
                <i class="menu-icon tf-icons bx bx-user"></i>
                <div data-i18n="Tables">비밀번호 변경</div>
              </a>
           </li>

            <!-- Components -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">주문</span></li>
            <!-- 내가 쓴 것들 -->
            <li class="menu-item">
              <a href="${pageContext.request.contextPath }/mypage/addr" class="menu-link">
                <i class="menu-icon tf-icons bx bx-buildings"></i>
                <div data-i18n="Tables">배송지 관리</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath }/mypage/order" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Tables">주문 목록</div>
              </a>
            </li>

            <!-- 포인트 쿠폰 -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">포인트/쿠폰</span></li>
            <!-- 내가 쓴 것들 -->
              <li class="menu-item">
              <a href="${pageContext.request.contextPath }/mypage/point" class="menu-link">
                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                <div data-i18n="Tables">포인트</div>
              </a>
            </li>
             <li class="menu-item">
              <a href="${pageContext.request.contextPath }/mypage/coupon" class="menu-link">
                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                <div data-i18n="Tables">쿠폰</div>
              </a>
            </li>


            <!-- 보관함 -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">Forms &amp; Tables</span></li>
            <!-- Forms -->
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Form Elements">보관함</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="${pageContext.request.contextPath }/mypage/boardList?userNicknm=${sessionScope.userId}" class="menu-link">
                    <div data-i18n="Basic Inputs">나의 글 목록</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="${pageContext.request.contextPath }/mypage/prodLikeList?userId=${sessionScope.userId}" class="menu-link">
                    <div data-i18n="Basic Inputs">찜 목록</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="${pageContext.request.contextPath }/mypage/likeList?userId=${sessionScope.userId}" class="menu-link">
                    <div data-i18n="Input groups">좋아요 목록</div>
                  </a>
                </li>
              </ul>
            </li>
            </ul>
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

          <nav
            class="container-xxl navbar navbar-expand-xl align-items-center bg-navbar-theme"
            id="layout-navbar"
          >
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="bx bx-menu bx-sm"><span>마이페이지 메뉴</span></i>
              </a>
            </div>

          </nav>

          <!-- / Navbar -->
