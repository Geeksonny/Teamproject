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
            <li class="menu-item">
              <a href="${pageContext.request.contextPath }/adminpage" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">관리자 홈</div>
              </a>
            </li>

<!--             <li class="menu-header small text-uppercase"> -->
<!--               <span class="menu-header-text">계정</span> -->
<!--             </li> -->
		<li class="menu-header small text-uppercase"><span class="menu-header-text">회원</span></li>
            <!-- Cards -->
           <li class="menu-item">
             <a href="${pageContext.request.contextPath }/admin/user" class="menu-link">
               <i class="menu-icon tf-icons bx bx-collection"></i>
               <div data-i18n="Basic">회원 관리</div>
             </a>
           </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath }/admin/order" class="menu-link">
                <i class="menu-icon tf-icons bx bx-collection"></i>
                <div data-i18n="Basic">주문 관리</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath }/admin/orderb" class="menu-link">
                <i class="menu-icon tf-icons bx bx-collection"></i>
                <div data-i18n="Basic">배송 관리</div>
              </a>
            </li>
        <li class="menu-header small text-uppercase"><span class="menu-header-text">업체</span></li>
            <!-- Cards -->
            <li class="menu-item">
              <a href="${pageContext.request.contextPath }/admin/comp" class="menu-link">
                <i class="menu-icon tf-icons bx bx-collection"></i>
                <div data-i18n="Basic">업체 관리</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="${pageContext.request.contextPath }/admin/product" class="menu-link">
                <i class="menu-icon tf-icons bx bx-collection"></i>
                <div data-i18n="Basic">상품 관리</div>
              </a>
            </li>



            <!-- coupon -->
            <li class="menu-header small text-uppercase"><span class="menu-header-text">쿠폰</span></li>
            <!-- coupon -->
            <li class="menu-item">
              <a href="${pageContext.request.contextPath }/admin/coupon" class="menu-link">
                <i class="menu-icon tf-icons bx bx-collection"></i>
                <div data-i18n="Basic">쿠폰 관리</div>
              </a>
            </li>
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
