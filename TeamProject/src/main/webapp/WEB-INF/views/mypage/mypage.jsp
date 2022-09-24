<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
              <div class="row">
                <div class="col-lg-12 order-0">
                <div class="col-12 col-md-8 col-lg-12 order-3 order-md-2">
                  <div class="row">
                    <div class="col-3 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                              <img src="${pageContext.request.contextPath }/resources/assets/img/icons/unicons/paypal.png" alt="Credit Card" class="rounded" />
                            </div>
                          </div>
                          <span class="d-block mb-1">포인트</span>
                          <h3 class="card-title text-nowrap mb-2">${pointDTO.pointNow } P</h3>
                        </div>
                      </div>
                    </div>
                    <div class="col-3 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                              <img src="${pageContext.request.contextPath }/resources/assets/img/icons/unicons/cc-primary.png" alt="Credit Card" class="rounded" />
                            </div>
                          </div>
                          <span class="fw-semibold d-block mb-1">쿠폰</span>
                          <h3 class="card-title mb-2">000 개</h3>
                        </div>
                      </div>
                    </div>
                    <!-- </div>
    <div class="row"> -->
                    <div class="col-3 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                              <img src="${pageContext.request.contextPath }/resources/assets/img/icons/unicons/wallet-info.png" alt="Credit Card" class="rounded" />
                            </div>
                          </div>
                          <span class="d-block mb-1">최근 주문</span>
                          <h3 class="card-title text-nowrap mb-2">0월 0일</h3>
                        </div>
                      </div>
                    </div>
                   <div class="col-3 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                              <img src="${pageContext.request.contextPath }/resources/assets/img/icons/unicons/cc-warning.png" alt="Credit Card" class="rounded" />
                            </div>
                          </div>
                          <span class="d-block mb-1">배송 상태</span>
                          <h3 class="card-title text-nowrap mb-2">배송 완료</h3>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
                </div>

                <!-- Total Revenue -->
                <div class="col-12 col-lg-12 order-2 order-md-3 order-lg-2 mb-4">
                  <div class="card">
                    <div class="row row-bordered g-0">
                      <div class="col-md-8">
                        <h5 class="card-body m-0 me-2 pb-3">나의 정보</h5>
                         <div class="card-body">
                         <table class="table table">
                             <tr>
                         		<th>
                         			<span class="d-block">ID</span>
                         		</th>
                         		 <td>
                         			<span class="d-block">${memberDTO.userId}</span>
                         		</td>
                         		<th>
                         			<span class="d-block">닉네임</span>
                         		</th>
                         		<td>
                         			<span class="d-block">${memberDTO.userNicknm}</span>
                         		</td>
                         	</tr>
                         	<tr>
                         		<th>
                         			<span class="d-block">이름</span>
                         		</th>
                         		 <td>
                         			<span class="d-block">${memberDTO.userNm}</span>
                         		</td>
                         		<th>
                         			<span class="d-block">메일</span>
                         		</th>
                         		<td>
                         			<span class="d-block">${memberDTO.userEmail}</span>
                         		</td>
                         	</tr>
                         	<tr>
                         		<th>
                         			<span class="d-block">연락처</span>
                         		</th>
                         		 <td>
                         			<span class="d-block">${memberDTO.userPhone}</span>
                         		</td>
                         		<th>
                         			<span class="d-block">관심 운동</span>
                         		</th>
                         		<td>
                         			<span class="d-block">${memberDTO.userAthletic}</span>
                         		</td>
                         	</tr>
                         </table>
                         </div>
                      </div>
                      <div class="col-md-4">
                        <div class="card-body">
                          <div class="text-center">
                          현재 배송지
                          </div>
                        </div>
                         <div class="card-body">
                         <table class="table table">
                             <tr>
                         		<th>
                         			<span class="d-block">받는 분</span>
                         		</th>
                         		 <td>
                         			<span class="d-block">${addressDTO.addressGetNm}</span>
                         		</td>
                       		</tr>
                       		<tr>
                         		<th>
                         			<span class="d-block">연락처</span>
                         		</th>
                         		<td>
                         			<span class="d-block">${addressDTO.addressGetPhone}</span>
                         		</td>
                         	</tr>
                         	<tr>
                         		<th>
                         			<span class="d-block">주소</span>
                         		</th>
                         		<td>
                         			<span class="d-block"> ${addressDTO.address}</span>
                         		</td>
                         	</tr>
                         </table>
                         </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Total Revenue -->

               <input type="hidden" value="${sessionScope.userId}">
                <div class="col-12 col-md-8 col-lg-12 order-3 order-md-2">
                  <div class="row">
                    <div class="col-4 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                              <img src="${pageContext.request.contextPath }/resources/assets/img/icons/unicons/chart-success.png" alt="Credit Card" class="rounded" />
                            </div>
                          </div>
                          <span class="d-block mb-1">나의 글</span>
                          <h3 class="card-title text-nowrap mb-2">${mypageDTO2.boardCount}개</h3>
                        </div>
                      </div>
                    </div>

                    <div class="col-4 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                              <img src="${pageContext.request.contextPath }/resources/assets/img/icons/unicons/chart.png" alt="Credit Card" class="rounded" />
                            </div>
                          </div>
                          <span class="fw-semibold d-block mb-1">나의 댓글</span>
                          <h3 class="card-title mb-2">${mypageDTO2.replyCount}개</h3>
                        </div>
                      </div>
                    </div>
                   <div class="col-4 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                              <img src="${pageContext.request.contextPath }/resources/assets/img/icons/unicons/paypal.png" alt="Credit Card" class="rounded" />
                            </div>
                          </div>
                          <span class="d-block mb-1">찜</span>
                          <h3 class="card-title text-nowrap mb-2">${mypageDTO2.productLike}개</h3>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
                <!--/ Transactions -->
            </div>
        </div>
        <!-- / Layout page -->
      </div>
      <!-- Overlay -->
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
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/dashboards-analytics.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>

    <!-- Footer Section Begin -->
    <jsp:include page="../inc/footer.jsp"/>
</body>

</html>