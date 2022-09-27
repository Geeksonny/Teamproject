<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
  <script src="${pageContext.request.contextPath }/resources/js/date.js"></script>
  <script src="${pageContext.request.contextPath }/resources/jsPro/deleteUser.js"></script>
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
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">회원 /</span> 주문 관리</h4>

              <div class="row">
                <div class="col-md-12">
                  <ul class="nav nav-pills flex-column flex-md-row mb-3">
                    <li class="nav-item">
                      <a class="nav-link active" href="${pageContext.request.contextPath }/mypage/order">
                      <i class="bx bx-detail me-1"></i> 주문 목록</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="${pageContext.request.contextPath }/mypage/addr">
                      <i class="bx bx-buildings me-1"></i> 배송지 관리</a>
                    </li>
                  </ul>

                 <div class="card">
                <h5 class="card-header">주문 관리</h5>
                <hr class="my-0" />
                <div class="card-body">
                <div class="table-responsive text-nowrap">
                <div style="padding:1rem;">
                	  <form action="${pageContext.request.contextPath }/mypage/order" method="get" onsubmit="return datecheck()">
                <div class="col-md-12" style="padding-left:4%">
                <div class="mb-4 mt-2 row">
                  <div class="col-md-4 mb-3">
                    <input class="form-control mr-2" type="date" id="startDate" name="startDate" style="width: 85%; display:inline-block" required /> 부터
                  </div>
                  <div class="col-md-4">
                    <input class="form-control mr-2" type="date" id="endDate" name="endDate" style="width: 85%; display:inline-block" required /> 까지
                  </div>
                  <div class="col-md-4">
						<input type="button" value="1개월" id="searchMonth1" class="btn btn-outline-primary" >
						<input type="button" value="3개월" id="searchMonth3" class="btn btn-outline-primary" >
						<input type="button" value="6개월" id="searchMonth6" class="btn btn-outline-primary" >
						<input type="submit" value="조회" class="btn btn-primary" id="searchOrder">
                  </div>
				</div>
				</div>
					</form>
                </div>
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th colspan="2" style="vertical-align: middle">상품정보</th>
                        <th> 수량 </th>
                        <th>할인금액</th>
                        <th>결제금액</th>
                        <th>주문일</th>
                        <th>주문상태</th>
                        <th>주문취소 </th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                     <c:forEach var="orderListDTO" items="${ordList}" >
                      <tr>
                        <td><img src="${pageContext.request.contextPath }/resources/img/product/${orderListDTO.prodLMainimg}" width="150"/></td>
                        <td style="vertical-align: middle">${orderListDTO.prodLProdnm}</td>
                        <td style="vertical-align: middle">${orderListDTO.ordLQuantity}개</td>
                        <td style="vertical-align: middle">${orderListDTO.ordCouponDc}원</td>
                        <td style="vertical-align: middle">${orderListDTO.ordFinalPrice} 원</td>
                        <td style="vertical-align: middle">${fn:substring(orderListDTO.ordLDate,0,16)}</td>
                        <td style="vertical-align: middle">
                        <c:set var="num" value="${orderListDTO.ordDeliveryStatus }" />
                         		<c:choose>
						 			<c:when test="${num eq '0'}">
						  				상품준비중&nbsp;&nbsp;
                       					<div></div>
						 			</c:when>
						 			<c:when test="${num eq '1'}">
						  				배송중&nbsp;&nbsp;${orderListDTO.ordRefund}
                       					<button class="btn btn-outline-primary" id="delivNumberAdd_btn_${orderListDTO.trnum}" type="button">
                       					<a href="https://tracker.delivery/#/kr.cjlogistics/${orderListDTO.ordLDelivNumber }" target="_blank">배송조회</a>
                       					</button>
                       					<div></div>
						 			</c:when>
						 			<c:when test="${num eq '2'}">
						  				배송완료&nbsp;&nbsp;
						  				<button class="btn btn-outline-primary" id="delivNumberAdd_btn_${orderListDTO.trnum}" type="button">
                       					<a href="https://tracker.delivery/#/kr.cjlogistics/${orderListDTO.ordLDelivNumber }" target="_blank">배송조회</a>
                       					</button>
                       					<div></div>
						 			</c:when>
						 			<c:when test="${num eq '3'}">
						  				배송취소
						 			</c:when>
						 		</c:choose>
                        </td>
                        <td style="vertical-align: middle">
                         		<c:choose>
						 			<c:when test="${orderListDTO.ordRefund eq '10'}">
						  				<button class="btn btn-outline-primary">
						  				<a href="${pageContext.request.contextPath }/mypage/orderRefund" >주문취소</a>
						  				</button>
                       					<div></div>
						 			</c:when>
						 			<c:when test="${orderListDTO.ordRefund eq '11'}">
						  				취소요청&nbsp;&nbsp;
                       					<div></div>
						 			</c:when>
						 			<c:when test="${orderListDTO.ordRefund eq '12'}">
						  				주문취소&nbsp;&nbsp;
                       					<div></div>
						 			</c:when>
						 		</c:choose>
                        </td>
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
								<a class="page-link" href="${pageContext.request.contextPath }/mypage/order?pageNum=${pageDTO.startPage - pageDTO.pageBlock}" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
							</c:if>
						 </li>
							<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
						 <li class="page-item">
						 		<a class="page-link" href="${pageContext.request.contextPath }/mypage/order?pageNum=${i}">${i}</a>
						 </li>
							</c:forEach>

						 <li class="page-item">
							<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
								<a class="page-link" href="${pageContext.request.contextPath }/mypage/order?pageNum=${pageDTO.startPage + pageDTO.pageBlock}" aria-label="Next">
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
<script type="text/javascript">
function datecheck(){
	function dateFormat(){
		var date=new Date();
		var yyyy=date.getFullYear();
		var mm=date.getMonth()+1;
		mm = mm >=10 ? mm : '0'+mm;
		var dd=date.getDate();
		dd = dd>=10 ? dd : '0'+dd;
		return yyyy+'-'+mm+'-'+dd;
	}
	var startdate = $('#startDate').val();
	var enddate = $('#endDate').val();
	if(startdate > enddate){
		alert('검색 종료일을 검색 시작일 보다 늦은 날짜로 지정해주세요.');
		return false;
	} else if(startdate > dateFormat() || enddate > dateFormat()){
		alert('오늘 이전의 날짜만 검색이 가능합니다.');
		return false;
	}
}
</script>
</html>