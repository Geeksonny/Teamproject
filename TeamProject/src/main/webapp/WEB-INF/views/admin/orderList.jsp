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
  <script src="http://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="${pageContext.request.contextPath }/resources/jsPro/deleteUser.js"></script>
  <body>
  <!-- 메뉴단 -->
<jsp:include page="../inc/menu.jsp"/>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
		<jsp:include page="../inc/admin-menu.jsp"/>

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">회원 /</span> 주문 관리</h4>

              <div class="row">
                <div class="col-md-12">
                  <ul class="nav nav-pills flex-column flex-md-row mb-3">
                    <li class="nav-item">
                      <a class="nav-link" href="${pageContext.request.contextPath }/admin/user">
                      <i class="bx bx-buildings me-1"></i> 회원 관리</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="${pageContext.request.contextPath }/admin/order">
                      <i class="bx bx-buildings me-1"></i> 주문 관리</a>
                    </li>
                     <li class="nav-item">
                      <a class="nav-link" href="${pageContext.request.contextPath }/admin/addr">
                      <i class="bx bx-buildings me-1"></i> 배송 관리</a>
                    </li>
                  </ul>

                 <div class="card">
                <h5 class="card-header">주문 관리</h5>
                <hr class="my-0" />
                <div class="card-body">
                <div class="table-responsive text-nowrap">
	                <div style="padding:1rem;">
	                 <button type="submit" class="btn btn-outline-primary" onclick="deleteValue();">선택 삭제</button>
	                </div>
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th>num</th>
                        <th>주문 코드</th>
                        <th>주문자</th>
                        <th>업체명</th>
                        <th>가격</th>
                        <th>할인가</th>
                        <th>최종 가격</th>
                        <th>수량</th>
                        <th>주문일</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                     <c:forEach var="orderListDTO" items="${orderList}" >
                      <tr>
                        <td>${orderListDTO.num}</td>
                        <td>${orderListDTO.ordLCode}</td>
                        <td>${orderListDTO.ordLUser}</td>
                        <td>${orderListDTO.compId}</td>
                        <td>${orderListDTO.ordLPrice}</td>
                        <td>${orderListDTO.ordLCouponnum}</td>
                        <td>${orderListDTO.ordFinalprice}</td>
                        <td>${orderListDTO.ordLQuantity}</td>
                        <td>${orderListDTO.ordLDate}</td>
                        <td>
                      </tr>
					 </c:forEach>
                    </tbody>
                  </table>

				<!-- 페이지 -->
                  <div class="bd-example-snippet bd-code-snippet mt-5 mb-3"><div class="bd-example " >
			        <nav aria-label="Standard pagination example">
			          <ul class="pagination" style="margin-left: 45%; margin-right: 55%;">
			            <li class="page-item">
                            <c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
								<a class="page-link" href="${pageContext.request.contextPath }/admin/order?pageNum=${pageDTO.startPage - pageDTO.pageBlock}" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
							</c:if>
						 </li>
							<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
						 <li class="page-item">
						 		<a class="page-link" href="${pageContext.request.contextPath }/admin/order?pageNum=${i}">${i}</a>
						 </li>
							</c:forEach>

						 <li class="page-item">
							<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
								<a class="page-link" href="${pageContext.request.contextPath }/admin/order?pageNum=${pageDTO.startPage + pageDTO.pageBlock}" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</c:if>
			            </li>
			          </ul>
			        </nav>
			        </div></div>

                </div>
                </div>
              </div>
                </div>
              </div>
            </div>
            <!--/ Content -->

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
         <!-- 화면 줄였을때 Content wrapper -->
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

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>

    <!-- Footer Section Begin -->
    <jsp:include page="../inc/footer.jsp"/>
</body>

</html>