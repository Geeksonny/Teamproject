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
		<jsp:include page="../inc/admin-menu.jsp"/>

           <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">포인트 /</span> 쿠폰</h4>

                  <div class="card mb-4">
                    <h5 class="card-header">쿠폰 등록</h5>

                    <hr class="my-0" />
                    <div class="card-body">
                      <form id="formAccountSettings" action="${pageContext.request.contextPath}/mypage/modifyPro" method="POST">
                        <div class="row">
                            <input class="form-control form-control-lg" type="hidden" name="userId" id="userId" value="${memberDTO.userId}" readonly />
                          <div class="mb-3 col-md-6">
                            <label for="userNm" class="form-label">쿠폰 이름</label>
                            <input class="form-control form-control-lg" type="text" name="userNm" id="userNm" value="${memberDTO.userNm}"/>
                          </div>
                          <div class="mb-3 col-md-3">
                            <label class="form-label" for="userAthletic">할인율</label>
                            <select class="select2 form-control form-control-lg" id="userAthletic " name="userAthletic">
                           	    <option value="5%" >5%</option>
							    <option value="10%" >10%</option>
							    <option value="20%" >20%</option>
							    <option value="30%" >30%</option>
							    <option value="40%" >40%</option>
							    <option value="50%" >50%</option>
                            </select>
                          </div>
                          <div class="mb-3 col-md-3">
                            <label for="userNicknm" class="form-label d-block">유효 쿠폰 여부</label>
                          <div class="form-check form-check-inline mt-3">
                            <input
                              class="form-check-input"
                              type="radio"
                              name="inlineRadioOptions"
                              id="inlineRadio1"
                              value="option1"
                            />
                            <label class="form-check-label mr-3" for="inlineRadio1">사용 가능</label>
                          </div>
                          <div class="form-check form-check-inline">
                            <input
                              class="form-check-input"
                              type="radio"
                              name="inlineRadioOptions"
                              id="inlineRadio2"
                              value="option2"
                            />
                            <label class="form-check-label" for="inlineRadio2">사용 불가</label>
                          </div>
                          </div>
                          <div class="mb-3 col-md-10">
                            <label for="userPass" class="form-label">쿠폰 설명</label>
                            <input class="form-control form-control-lg" type="password" name="userPass" id="userPass" />
                          </div>
                        <div class="mb-3 col-md-2 mt-3">
                          <button type="submit" class="btn btn-primary me-2 " >+ 추가</button>
                          <button type="reset" class="btn btn-outline-secondary">취소</button>
                        </div>
                      </form>
                        </div>
                    </div>
                    </div>

              <!-- Examples -->

              <h5 class="pb-1 mt-5 mb-3">쿠폰 리스트</h5>
              <div class="row mb-5">
                <div class="col-md-6 col-lg-4 mb-3">
                  <div class="card">
                    <div class="card-header">쿠폰 코드 &nbsp;
                    	<a href=#> X</a>
                    </div>
                    <div class="card-body">
                      <h5 class="card-title">쿠폰 이름 <span class="text-warning">30% 할인</span> </h5>
                      <p class="card-text">
                        쿠폰 설명
                      </p>
                      <p class="h5">
                      	<span class="badge bg-success">사용 가능</span>
                      	<span class="badge bg-danger">사용 불가</span>
                      </p>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4 mb-3">
                  <div class="card">
                    <div class="card-header">쿠폰 코드 &nbsp;
                    	<a href=#> X</a>
                    </div>
                    <div class="card-body">
                      <h5 class="card-title">쿠폰 이름 <span class="text-warning">30% 할인</span> </h5>
                      <p class="card-text">
                        쿠폰 설명
                      </p>
                      <p class="h5">
                      	<span class="badge bg-success">사용 가능</span>
                      	<span class="badge bg-danger">사용 불가</span>
                      </p>
                    </div>
                  </div>
                </div>
                 <div class="col-md-6 col-lg-4 mb-3">
                  <div class="card">
                    <div class="card-header">쿠폰 코드 &nbsp;
                    	<a href=#> X</a>
                    </div>
                    <div class="card-body">
                      <h5 class="card-title">쿠폰 이름 <span class="text-warning">30% 할인</span> </h5>
                      <p class="card-text">
                        쿠폰 설명
                      </p>
                      <p class="h5">
                      	<span class="badge bg-success">사용 가능</span>
                      	<span class="badge bg-danger">사용 불가</span>
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              <!--/ Content types -->
              </div>

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
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/libs/masonry/masonry.js"></script>

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>

    <!-- Footer Section Begin -->
    <jsp:include page="../inc/footer.jsp"/>
</body>

</html>