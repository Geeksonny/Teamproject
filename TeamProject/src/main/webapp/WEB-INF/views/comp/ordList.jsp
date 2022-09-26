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
  <script src="${pageContext.request.contextPath }/resources/jsPro/ordList.js"></script>
<!--   전체선택, 선택삭제 자바스크립트 -->


  </head>

  <body>
  <!-- 메뉴단 -->
<jsp:include page="../inc/menu.jsp"/>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">

<!-- 		큰화면 버티컬 시작-->
		<jsp:include page="../inc/comp-menu.jsp"/>
<!-- 		큰화면 버티컬 끝 -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">주문 /</span> 주문 목록</h4>

              <div class="row">
                <div class="col-md-12">
                  <ul class="nav nav-pills flex-column flex-md-row mb-3">
                    <li class="nav-item">
                      <a class="nav-link active" href="${pageContext.request.contextPath }/comp/ordList">
                      <i class="bx bx-buildings me-1 active"></i> 주문 목록</a>
                    </li>
                  </ul>

                <div class="card">
                <h5 class="card-header">주문 목록</h5>
                <hr class="my-0" />
                <div class="card-body">

                  <table class="table table-striped" >
                    <thead>
                      <tr>
                        <th scope="col" style="text-align:center;" >주문일</th>
                        <th scope="col" style="text-align:center;">주문 번호</th>
                        <th scope="col" style="text-align:center;">주문 상품</th>
                        <th scope="col" style="text-align:center;">주문자</th>
                        <th scope="col" style="text-align:center;">총 금액</th>
                        <th scope="col" style="text-align:center; width:20% ">배송</th>
                        <th scope="col" style="text-align:center; width:20%">주문상태</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
					  <c:forEach var="orderListDTO" items="${ordList }" varStatus="status">
                      <tr onClick="location.href='${pageContext.request.contextPath }/comp/ordListDet?CheckRow=${orderListDTO.ordLCode },${orderListDTO.ordLUser },${orderListDTO.num }'" style="cursor:pointer;">
                        <td style="text-align:center; "><fmt:formatDate pattern="yy-MM-dd" value="${orderListDTO.ordLDate }"/></td>
                        <td style="text-align:center; "> <strong>${orderListDTO.num }</strong></td>
                        <td style="text-align:center; ">
                        ${orderListDTO.ordLCode }
                        </td>
                        <td style="text-align:center; ">
                        ${orderListDTO.ordLUser }
                        </td>
                        <td style="text-align:center; ">
                          ${orderListDTO.individualPrice }
                        </td>

                        <td  onclick="event.cancelBubble=true" style="text-align:center;width:20% ">
					  		<form action="${pageContext.request.contextPath }/comp/delivNumberInsert" method="post">
                      			<input type="hidden" value="${orderListDTO.ordLCode }" name="ordLCode" id="ordLCode">
                      			<input type="hidden" value="${orderListDTO.ordLUser }" name="ordLUser" id="ordLUser">
                      			<div id="delivNumber_${orderListDTO.trnum}">
                     	  		<c:set var="num" value="${orderListDTO.ordDeliveryStatus }" />
                         		<c:choose>
						 			<c:when test="${num eq '0'}">
						  				상품준비중
                       					<button class="btn btn-outline-primary" id="delivNumberAdd_btn_${orderListDTO.trnum}" type="button">
                       					배송준비
                       					</button>
                       					<div></div>
						 			</c:when>
						 			<c:when test="${num eq '1'}">
						  				배송중
						 			</c:when>
						 			<c:when test="${num eq '2'}">
						  				배송완료
						 			</c:when>
						 			<c:when test="${num eq '3'}">
						  				배송취소
						 			</c:when>
						 		</c:choose>
                				</div>
                 			</form>
						</td>
						<td onclick="event.cancelBubble=true" style="text-align:center;width:20% ">
							<form action="${pageContext.request.contextPath }/comp/refund" method="post">
                      			<input type="hidden" value="${orderListDTO.ordLCode }" name="ordLCode" id="ordLCode">
                      			<input type="hidden" value="${orderListDTO.ordLUser }" name="ordLUser" id="ordLUser">
                      			<input type="hidden" value="${orderListDTO.ordLQuantity }" name="ordLQuantity" id="ordLQuantity">
                      			<input type="hidden" value="${orderListDTO.num }" name="num" id="num">
                      			<input type="hidden" value="${orderListDTO.ordTotalPrice }" name="ordTotalPrice" id="ordTotalPrice">
                      			<input type="hidden" value="${orderListDTO.individualPrice }" name="individualPrice" id="individualPrice">
                      			<div id="delivNumber_${orderListDTO.trnum}" >
                     	  		<c:set var="ordRefund" value="${orderListDTO.ordRefund }"  />
                     	  		<c:set var="purchasestatus" value="${orderListDTO.ordPurchasestatus }" />
                         		<c:choose>
						 			<c:when test="${ordRefund eq '10' and purchasestatus eq 'Y'}">
<!-- 						 			배송완료, 주문완료 -->
						  				정상주문
						 			</c:when>
						 			<c:when test="${ordRefund eq '11' and purchasestatus eq 'N'}">
<!-- 						 			환불신청 주문취소 -->
						  				취소신청
						  				<button type='submit' class="btn btn-outline-primary" id="refund_btn_${orderListDTO.trnum}" type="button">
                       					환불처리
                       					</button>
                       					<div></div>
						 			</c:when>
						 			<c:when test="${ordRefund eq '12' and purchasestatus eq 'N'}">
						  				환불완료
						 			</c:when>
						 		</c:choose>
                				</div>
                 			</form>

						</td>
                      </tr>
                      <tr id="aaa" name="aaa"></tr>
                      </c:forEach>

                    </tbody>
                  </table>

                  <div class="bd-example-snippet bd-code-snippet mt-5 mb-3"><div class="bd-example " >
			        <nav aria-label="Standard pagination example">
			          <ul class="pagination" style="margin-left: 45%; margin-right: 55%;">
			            <li class="page-item">
			              <c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
			              <a class="page-link" href="${pageContext.request.contextPath }
							/board/list?pageNum=${pageDTO.startPage - pageDTO.pageBlock}" aria-label="Previous">
			                <span aria-hidden="true">&laquo;</span>
			              </a>
			              </c:if>
			            </li>

			            <c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
			            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/comp/ordList?pageNum=${i}">${i}</a></li>
			            </c:forEach>

			            <li class="page-item">
			              <c:if test="${pageDTO.endPage < pageDTO.pageCount }">
			              <a class="page-link" href="${pageContext.request.contextPath }
						 /comp/deleteProd?pageNum=${pageDTO.startPage + pageDTO.pageBlock}" aria-label="Next">
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