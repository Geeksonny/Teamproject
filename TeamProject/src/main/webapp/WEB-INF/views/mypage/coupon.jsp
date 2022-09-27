<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-relative"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
  <head>
  <script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<%--   <script src="${pageContext.request.contextPath }/resources/jsPro/coupon.js"></script> --%>
  </head>

  <body>
  <!-- 메뉴단 -->
<jsp:include page="../inc/menu.jsp"/>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
		<jsp:include page="../inc/mypage-menu.jsp"/>

           <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">포인트 /</span> 쿠폰</h4>

                  <div class="card mb-4">
                    <h5 class="card-header">쿠폰 등록</h5>

                    <hr class="my-0" />
                    <div class="card-body">
                      <form id="formAccountSettings" action="${pageContext.request.contextPath}/mypage/couponInsert" method="POST">
                        <div class="row">
                          <div class="mb-3 col-md-6">
                            <label for="userNm" class="form-label">쿠폰 넘버</label>
                            <input class="form-control form-control-lg" type="text" name="couNum" id="couNum" placeholder="18자리숫자를 입력하세요"/>
                          </div>
                        <div class="mb-3 col-md-2 mt-3">
                          <button type="submit" class="btn btn-primary me-2 " >+ 추가</button>
                          <button type="reset" class="btn btn-outline-secondary">취소</button>
                        </div>
                        </div>
                      </form>
                        </div>
                    </div>
                    </div>

              <!-- Examples -->

              <h5 class="pb-1 mt-5 mb-3">쿠폰 리스트</h5>
              <div class="row mb-5">
              <c:forEach var="couponDTO" items="${couponList }" >
                <div class="col-md-6 col-lg-4 mb-3">
                  <div class="card">
                    <a onclick="couponDelete();"><img src="${pageContext.request.contextPath }/resources/img/icon/ic_close.svg" class="m_header-banner-close right" width="50px"></a>
                    <div class="card-header">쿠폰 코드&nbsp; :&nbsp; ${couponDTO.couNum }&nbsp;
                    </div>
                    <div class="card-body">
                      <h5 class="card-title">쿠폰이름 : <span class="text-warning">${couponDTO.couNm }</span> </h5>
                      <p class="card-text">
                        쿠폰 내용&nbsp; :&nbsp; ${couponDTO.couDet }
                      </p>
                      <p> 쿠폰 할인률 &nbsp;:&nbsp; ${couponDTO.couDc }&nbsp;%
                      </p>

                    </div>
                    <input type="hidden" name="sbCount" value="${couponDTO.couNum}" id="delCouNum">
                  </div>
                </div>
              </c:forEach>
              </div>
              <!--/ Content types -->
              </div>

            <!-- Footer -->
            <footer class="content-footer footer bg-footer-theme">
              <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                <div class="mb-2 mb-md-0">
                </div>
                <div>
                </div>
              </div>
            </footer>
            <!-- / Footer -->

            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/libs/popper/popper.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="${pageContext.request.contextPath }/resources/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/libs/masonry/masonry.js"></script>

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>

    <!-- Footer Section Begin -->
    <jsp:include page="../inc/footer.jsp"/>
</body>

</html>
