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
  <script src="http://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="${pageContext.request.contextPath }/resources/jsPro/deleteProd.js"></script>

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
				<!-- 화면줄였을때 버티컬 메뉴 및 큰화면에서는 시작 -->
            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">상품 관리 /</span> 상품 목록</h4>

			<div class="row">
                <div class="col-md-12">
                  <ul class="nav nav-pills flex-column flex-md-row mb-3">
                    <li class="nav-item">
                      <a class="nav-link" href="${pageContext.request.contextPath }/comp/insertGoods">
                      <i class="bx bx-user me-1"></i> 상품 등록</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="${pageContext.request.contextPath }/comp/deleteProd">
                      <i class="bx bx-user me-1"></i> 상품 목록</a>
                    </li>
                  </ul>
<!--  화면줄였을때 버티컬 및 큰화면에서는 시작 매뉴끝                  -->



                <div class="card">
                <h5 class="card-header">상품목록</h5>
                <hr class="my-0" />
                <div class="card-body">
                <form>
                <table class="table table-borderless">
                 <tbody class="table-border-bottom-0">
                  <tr>
                  	 <td></td>
                     <td class="mb-3">
                        <select id="defaultSelect" class="form-select" name="status">
                          <option value="0">재고상태 선택</option>
                          <option value="1">양호</option>
                          <option value="2">품절임박</option>
                          <option value="3">품절</option>
                        </select>
                     </td>
                     <td class="mb-3">
                        <select id="defaultSelect" class="form-select" name="searchCol">
                          <option value="0">검색 테이블 선택</option>
                          <option value="PROD_L_CODE">상품코드</option>
                          <option value="PROD_L_PRODNM">상품이름</option>
                          <option value="PROD_L_PRICE">가격</option>
                        </select>
                     </td>
                     <td colspan="2" class="input-group input-group-merge">
                        <span class="input-group-text" id="basic-addon-search31"><i class="bx bx-search"></i></span>
                        <input type="text" class="form-control" placeholder="상품 번호 검색" aria-describedby="basic-addon-search31" name="searchKeyWord"/>
                	</td>
                	<td><button type="submit" class="btn btn-primary">검색</button> </td>
                  </tr>
                 </tbody>
               </table>
               </form>


                <div class="table-responsive text-nowrap" id="Context">
                 <form>
	                <div class="mt-3" style="padding:1rem;">
	                 	<button type="submit" class="btn btn-outline-primary" onclick="deleteValue();">선택 삭제</button>
	                </div>
                  <table class="table table-striped" >
                    <thead>
                      <tr>
                        <th>&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-check-input" type="checkbox" id="allCheck" name="allCheck" />전체선택 </th>
                        <th>번호</th>
                        <th>상품 코드</th>
                        <th>상품명</th>
                        <th>가격</th>
                        <th>재고 수량</th>
                        <th>재고 상태</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
					  <c:forEach var="prodDTO" items="${prodList }" varStatus="status">
                      <tr onClick="location.href='${pageContext.request.contextPath }/comp/update?CheckRow=${prodDTO.prodLCode }'" style="cursor:pointer;">
                      	<td onclick="event.cancelBubble=true">&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-check-input" type="checkbox" value="${prodDTO.prodLCode }" name="CheckRow" id="defaultCheck1" />
                      	<label class="form-check-label" for="defaultCheck1"></label></td>
                        <td>${prodDTO.prodLNum }</td>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>${prodDTO.prodLCode }</strong></td>
                        <td>${prodDTO.prodLProdnm }</td>
                        <td>
                          ${prodDTO.prodLPrice }
                        </td>
                        <td>
                          ${prodDTO.prodLQuantity }
                        </td>
                        <td>
							<c:set var="num" value="${prodDTO.prodLQuantity }" />
						 	<c:choose>
						 		<c:when test="${num ge 50}">
<!-- 						 	ge:	>= -->
						  			<span class="badge bg-label-info me-1" name="status" id="status">양호</span>
						 		</c:when>
						 		<c:when test="${num lt 50 and num gt 0 }">
						  			<span class="badge bg-label-warning me-1" name="status" id="status">품절임박</span>
						 		</c:when>
						 		<c:when test="${num eq 0}">
						 			<span class="badge bg-label-danger me-1" name="status" id="status">품절</span>
						 		</c:when>
						 	</c:choose>
						</td>
                      </tr>
                      </c:forEach>

                    </tbody>
                  </table>

                  <div class="bd-example-snippet bd-code-snippet mt-5 mb-3"><div class="bd-example " >
			        <nav aria-label="Standard pagination example">
			          <ul class="pagination" style="margin-left: 45%; margin-right: 55%;">
			            <li class="page-item">
			               <c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
			              <a class="page-link" href="${pageContext.request.contextPath }
							/board/list?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&status=${pageDTO.status }&searchCol=${pageDTO.columnNm }&searchKeyWord=${pageDTO.searchKeyWord }" aria-label="Previous">
			                <span aria-hidden="true">&laquo;</span>
			              </a>
			              </c:if>
			            </li>
			            <c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
			            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/comp/deleteProd?pageNum=${i}&status=${pageDTO.status }&searchCol=${pageDTO.columnNm }&searchKeyWord=${pageDTO.searchKeyWord }">${i}</a></li>
			            </c:forEach>
			           <li class="page-item">
			              <c:if test="${pageDTO.endPage < pageDTO.pageCount }">
			              <a class="page-link" href="${pageContext.request.contextPath }
						 /comp/deleteProd?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&status=${pageDTO.status }&searchCol=${pageDTO.columnNm }&searchKeyWord=${pageDTO.searchKeyWord }" aria-label="Next">
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