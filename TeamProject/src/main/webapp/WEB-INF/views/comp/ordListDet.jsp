<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html
  class="light-style layout-menu-relative"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
  <head>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath }/resources/jsPro/compModify.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%
 String strReferer = request.getHeader("referer"); //이전 URL 가져오기

 if(strReferer == null){
%>
 <script language="javascript">
  alert("정상적인 경로를 통해 다시 접근해 주세요.");
  document.location.href="${pageContext.request.contextPath }/main/main";
 </script>
<%
  return;
 }
%>

  </head>

  <body>
  <!-- 메뉴단 -->
<jsp:include page="../inc/menu.jsp"/>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
		<jsp:include page="../inc/comp-menu.jsp" />

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4">주문 정보 <span class="text-muted fw-light"> /상품 목록 </span>  </h4>

              <div class="row">
                <div class="col-md-12">
                  <ul class="nav nav-pills flex-column flex-md-row mb-3">
                    <li class="nav-item">
                      <a class="nav-link active" href="${pageContext.request.contextPath }/comp/ordListDet">
                      <i class="bx bx-user me-1"></i> 주문 정보</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="${pageContext.request.contextPath }/comp/ordList">
                      <i class="bx bx-user me-1"></i> 상품 목록</a>
                    </li>
                  </ul>

                  <!-- Account -->
                  <div class="card mb-4">
                    <h5 class="card-header">주문 정보</h5>

                    <hr class="my-0" />
                    <div class="card-body">

                        <table class="table table">
                             <tr>
                         		<th>
                         			<span class="d-block">주문자 ID</span>
                         		</th>
                         		 <td>
                         			<span class="d-block">${orderListDTO.ordLUser} </span>
                         		</td>
                         		<th >
                         			<span class="d-block">주문자 이름</span>
                         		</th>
                         		<td >
                         			<span class="d-block">${orderListDTO.ordLUserNm}</span>
                         		</td>

                         	</tr>


                         	<tr>
                         		<th>
                         			<span class="d-block">받는 분</span>
                         		</th>
                         		 <td>
                         			<span class="d-block">${orderListDTO.ordGetNm}</span>
                         		</td>
                         		<th>
                         			<span class="d-block">받는 분 연락처</span>
                         		</th>
                         		<td>
                         			<span class="d-block">${orderListDTO.ordGetPhone}</span>
                         		</td>
                         	</tr>


                         	<tr>
                         		<th>
                         			<span class="d-block">우편번호</span>
                         		</th>
                         		 <td>
                         			<span class="d-block">${orderListDTO.ordGetZipcode}</span>
                         		</td>
                         		<th>
                         			<span class="d-block">주소</span>
                         		</th>
                         		<td>
                         			<span class="d-block">${orderListDTO.ordGetAddress}</span>
                         		</td>
                         	</tr>

                         	<tr>
                         		<th>
                         			<span class="d-block">배송시 요구사항</span>
                         		</th>
                         		<td>
                         			<span class="d-block">${orderListDTO.ordDeliveryMessage}</span>
                         		</td>
                         	</tr>

                         	<tr>
                         		<th>
                         			<span class="d-block">상품 코드</span>
                         		</th>
                         		 <td>
                         			<span class="d-block">${orderListDTO.ordLCode} </span>
                         		</td>
                         		<th>
                         			<span class="d-block">주문 수량</span>
                         		</th>
                         		<td>
                         			<span class="d-block"> ${orderListDTO.ordLQuantity}</span>
                         		</td>
                         	</tr>
                         </table>
                    </div>
                    <!-- /Account -->

                    <!-- 회월탈퇴 -->
                  </div>

                </div>
              </div>
            </div>
            <!-- / Content -->

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

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/pages-account-settings-account.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>

    <!-- Footer Section Begin -->
    <jsp:include page="../inc/footer.jsp"/>
</body>

</html>