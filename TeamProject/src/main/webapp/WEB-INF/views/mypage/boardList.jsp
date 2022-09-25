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
		<jsp:include page="../inc/mypage-menu.jsp"/>

          <!-- Content wrapper -->
          <div class="content-wrapper">
          
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">마이페이지 /</span> 나의 게시글</h4>

              

                 <div class="card">
                <h5 class="card-header">나의 게시글</h5>
                <hr class="my-0" />
                <div class="card-body">
                <div class="table-responsive text-nowrap">
                <div style="padding:1rem;">
                 <button type="submit" class="btn btn-outline-primary" onclick="deleteValue();">선택 삭제</button>
                </div>
                  <table class="table table-striped">
                    <thead>
                      <tr>
                      	<th>&nbsp;&nbsp;<input class="form-check-input" type="checkbox" id="allCheck" name="allCheck" />&nbsp;&nbsp;&nbsp;전체선택 </th>
                        <th>글번호</th>
                        <th>글쓴이</th>
                        <th>글제목</th>
                        <th>조회수</th>
                        <th>좋아요</th>
                        <th>작성일</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                    
                     <c:forEach var="boardDTO" items="${boardList}" end="10" >
                      <tr>
                      	<td onclick="event.cancelBubble=true">&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-check-input" type="checkbox" value="${boardDTO.boardNum }" name="CheckRow" id="defaultCheck1" />
                      	<label class="form-check-label" for="defaultCheck1"></label></td>
                        <td>${boardDTO.boardNum }</td>
                        <td>${boardDTO.userNicknm }</td>
                        <td>${boardDTO.boardSubject}  (${boardDTO.boardRcount})</td>
                        <td>${boardDTO.boardReadcount}</td>
                        <td>${boardDTO.boardLikecount}</td>
                        <td>${boardDTO.boardDate}</td>
                      </tr>
					 </c:forEach>
                    </tbody>
                  </table>

				<!-- 페이지 수 -->
                  <%-- <div class="bd-example-snippet bd-code-snippet mt-5 mb-3"><div class="bd-example " >
			        <nav aria-label="Standard pagination example">
			          <ul class="pagination" style="margin-left: 45%; margin-rightt: 55%;">
			            <li class="page-item">
                            <c:if test="${boardDTO.startPage > boardDTO.pageBlock }">
								<a class="page-link" href="${pageContext.request.contextPath }
							/mypage/boardList?pageNum=${boardDTO.startPage - boardDTO.pageBlock}" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
							</c:if>
						 </li>
							<c:forEach var="i" begin="${boardDTO.startPage }" end="${boardDTO.endPage }" step="1">
						 <li class="page-item">
						 		<a class="page-link" href="${pageContext.request.contextPath }/mypage/boardList?pageNum=${i}">${i}</a>
						 </li>
							</c:forEach>

						 <li class="page-item">
							<c:if test="${boardDTO.endPage < boardDTO.pageCount }">
								<a class="page-link" href="${pageContext.request.contextPath }/mypage/boardList?pageNum=${boardDTO.startPage + boardDTO.pageBlock}" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</c:if>
			            </li>
			          </ul>
			        </nav>
			        </div></div> --%>

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