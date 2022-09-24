<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<!-- 		큰화면 버티컬 시작-->
		<jsp:include page="../inc/admin-menu.jsp"/>
<!-- 		큰화면 버티컬 끝 -->


           <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
<!-- 화면줄였을때 버티컬 메뉴 및 큰화면에서는 시작 -->
            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4">
                <span class="text-muted fw-light">업체정보수정 </span>
              </h4>

              <div class="row">
                <div class="col-md-12">
                  <ul class="nav nav-pills flex-column flex-md-row mb-3">
                    <li class="nav-item">
                      <a class="nav-link" href="${pageContext.request.contextPath }/admin/updateProd"
                        ><i class="bx bx-user me-1"></i>상품수정 </a
                      >


                  </ul>
<!--  화면줄였을때 버티컬 및 큰화면에서는 시작 매뉴끝                  -->



                 <div class="col-xl">
                  <div class="card mb-4">
                    <div class="card-header d-flex justify-content-between align-items-center">
                      <h5 class="mb-0">상품수정</h5>
                      <small class="text-muted float-end"></small>
                    </div>
                    <div class="card-body">
                      <form>
                      <div class="mb-3">
                          <label class="form-label" for="basic-default-fullname">상품번호(수정불가)</label>
                          <input type="text" class="form-control" id="basic-default-fullname" placeholder="John Doe" />
                        </div>

                        <label class="form-label" for="basic-default-fullname">상품분류</label>
                          <div class="form-check mt-3">
                            <input
                              name="default-radio-1"
                              class="form-check-input"
                              type="radio"
                              value=""
                              id="defaultRadio1"
                            />
                            <label class="form-check-label" for="defaultRadio1"> 음식 </label>
                          </div>
                          <div class="form-check">
                            <input
                              name="default-radio-1"
                              class="form-check-input"
                              type="radio"
                              value=""
                              id="defaultRadio2"
                              checked
                            />
                            <label class="form-check-label" for="defaultRadio2"> 기구 </label>
                          </div>

                        <div class="mb-3">
                          <label class="form-label" for="basic-default-fullname">상품명</label>
                          <input type="text" class="form-control" id="basic-default-fullname" placeholder="John Doe" />
                        </div>
                        <div class="mb-3">
                          <label class="form-label" for="basic-default-company">가격</label>
                          <input type="text" class="form-control" id="basic-default-company" placeholder="ACME Inc." />
                        </div>


                        <div class="mb-3">
                          <label class="form-label" for="basic-default-message">상품상세설명</label>
                          <textarea
                            id="basic-default-message"
                            class="form-control"
                            placeholder="Hi, Do you have a moment to talk Joe?"
                          ></textarea>
                        </div>
                        <div class="card">
                    <label class="form-label" for="basic-default-message">상품사진 첨부</label>
                    <div class="card-body">
                      <div class="mb-3">
                        <label for="formFile" class="form-label">상품사진 선택</label>
                        <input class="form-control" type="file" id="formFile" />
                      </div>


                    </div>
                  </div>
                        <button type="submit" class="btn btn-primary">등록</button>
                         <button type="submit" class="btn btn-primary">취소</button>
                      </form>
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