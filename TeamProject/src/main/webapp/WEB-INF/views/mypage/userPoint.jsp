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
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/date.js"></script>
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
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">포인트/쿠폰 /</span> 포인트</h4>

              <div class="row">
                <div class="col-md-12">

                <div class="mb-3 row">
                  <div class="col-md-10">
                    <form action="${pageContext.request.contextPath }/mypage/point" method="get" onsubmit="return datecheck()">
                    <input class="form-control" type="date" id="startDate" name="startDate"  required />
                    <input class="form-control" type="date" id="endDate" name="endDate" required />
								<br>
						<input type="button" value="1개월" id="searchMonth1" class="btn btn-outline-info" >
						<input type="button" value="3개월" id="searchMonth3" class="btn btn-outline-info" >
						<input type="button" value="6개월" id="searchMonth6" class="btn btn-outline-info" >
						<input type="submit" value="조회하기" class="btn btn-info" id="searchPoint">
						
					</form><br>
					</div>
				</div>

              <!-- Basic Bootstrap Table -->
               <div class="card">
                <h5 class="card-header">포인트 조회  </h5>
                <hr class="my-0" />
                <div class="card-body">
                <div class="table-responsive text-nowrap">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th>적립일자</th>
                        <th>내역</th>
                        <th>적립</th>
                        <th>잔액</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                     <c:forEach var="pointDTO" items="${pointList }">
                      <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> ${fn:substring(pointDTO.pointDate,0,16)}  </td>
                        <td>${pointDTO.pointType }</td>
                        <c:if test="${ pointDTO.pointUsed ne 0}">
                        <td><span class="badge bg-danger">-${pointDTO.pointUsed }</span></td>
                        </c:if>
                        <c:if test="${ pointDTO.pointCharge ne 0}">
                        <td><span class="badge bg-label-primary me-1">${pointDTO.pointCharge }</span></td>
                        </c:if>
                        <td><strong>${pointDTO.pointNow }</strong></td>
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
								<a class="page-link" href="${pageContext.request.contextPath }
								/mypage/point?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&startDate=${pageDTO.startDate}&endDate=${pageDTO.endDate}" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
							</c:if>
						 </li>
							<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
						 <li class="page-item">
						 		<a class="page-link" href="${pageContext.request.contextPath }/mypage/point?pageNum=${i}&startDate=${pageDTO.startDate}&endDate=${pageDTO.endDate}">${i}</a>
						 </li>
							</c:forEach>

						 <li class="page-item">
							<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
								<a class="page-link" href="${pageContext.request.contextPath }
								/mypage/point?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&startDate=${pageDTO.startDate}&endDate=${pageDTO.endDate}" aria-label="Next">
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