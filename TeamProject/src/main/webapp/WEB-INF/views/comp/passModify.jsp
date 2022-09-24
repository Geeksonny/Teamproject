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
<script type="text/javascript"
src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js" ></script>
<script type="text/javascript">
		// 유효성 체크
  		$(document).ready(function(){

			$("#passMod").on("click", function(){
				if($("#compPass").val()==""){
					alert("현재 비밀번호를 입력해주세요");
					$("#userPass").focus();
					return false;
				}
				if($("#newPass1").val()==""){
					alert("새 비밀번호를 입력해주세요");
					$("#newPass").focus();
					return false;
				}
				if($("#newPass2").val()==""){
					alert("새 비밀번호를 확인해주세요");
					$("#newPass1").focus();
					return false;
				}
				if ($("#newPass").val() != $("#newPass1").val()) {
					alert("새 비밀번호가 일치하지 않습니다.");
					$("#newPass1").focus();
					return false;
				}

				$.ajax({
					url : "/web/comp/passCheck",
					type : "POST",
					data : {'compId':$('#compId').val(),'compPass':$('#compPass').val()},
					success: function(rdata){

						if(rdata=="no"){debugger;
							alert("패스워드가 틀렸습니다.");
							return;
						}else{
							if(confirm("변경하시겠습니까?")){
								$("#passModForm").submit();
							}

						}
					}
				});

			});
		});



</script>

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
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">내 계정 /</span> 비밀번호 변경</h4>

              <div class="row">
                <div class="col-md-12">
                  <ul class="nav nav-pills flex-column flex-md-row mb-3">
                    <li class="nav-item">
                      <a class="nav-link" href="${pageContext.request.contextPath }/comp/modify">
                      <i class="bx bx-user me-1"></i> 계정 정보</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="${pageContext.request.contextPath }/comp/passMod">
                      <i class="bx bx-user me-1"></i> 비밀번호 변경</a>
                    </li>

                  </ul>

                  <!-- 비밀번호 변경 -->
                  <div class="card mb-4">
                    <h5 class="card-header">비밀번호 변경</h5>

                    <hr class="my-0" />
                    <div class="card-body">
                      <form id="passModForm" name="passModForm" action="${pageContext.request.contextPath}/comp/passModPro" method="POST">
                            <input class="form-control form-control-lg" type="hidden" name="compId" id="compId" value="${sessionScope.compId }" />

                          <div class="mb-3 col-md-6">
                            <label for="compPass" class="form-label">비밀번호</label>
                            <input class="form-control form-control-lg" type="password" name="compPass" id="compPass" />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="newPass1" class="form-label">새 비밀번호</label>
                            <input class="form-control form-control-lg" type="password" name="newPass" id="newPass" />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="newPass2" class="form-label">새 비밀번호 확인</label>
                            <input class="form-control form-control-lg" type="password" name="newPass1" id="newPass1" />
                          </div>

                        <div class="mt-2"><br>
                          <button type="button" id="passMod" name="passMod" class="btn btn-primary me-2">비밀번호 변경</button>
                          <button type="reset" class="btn btn-outline-secondary">취소</button>
                        </div>
                      </form>
                    </div>
                    <!-- / 비밀번호 변경 -->

                  </div>
                </div>
              </div>
            </div>
            <!-- / Content -->

            <!-- Footer -->
            <footer class="content-footer footer bg-footer-theme">
              <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                <div class="mb-2 mb-md-0">
                  ©
                  <script>
                    document.write(new Date().getFullYear());
                  </script>
                  , made with ❤️ by
                  <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
                </div>
                <div>
                  <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
                  <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>

                  <a
                    href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
                    target="_blank"
                    class="footer-link me-4"
                    >Documentation</a
                  >

                  <a
                    href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
                    target="_blank"
                    class="footer-link me-4"
                    >Support</a
                  >
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