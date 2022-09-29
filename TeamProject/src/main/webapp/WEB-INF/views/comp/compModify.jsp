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
<%-- <script src="${pageContext.request.contextPath }/resources/jsPro/compModify.js"></script> --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

//탈퇴 비밀번호 입력창 나오게
$(document).ready(function(){
	$('#delCheck').change(function(){
		if ($('#delCheck').is(':checked')) {
			$('#delDiv').show();
		}else {
			$('#delDiv').hide();

		}
	});
});

// 탈퇴
$(document).ready(function(){
	$('#delBtn').click(function(){
		$.ajax({
			url:'/web/comp/deletePro',
			type:'POST',
			data:{'compId':$('#compId1').val(),'compPass':$('#compPass1').val()},
			success:function(rdata){
				 if(rdata=="ok"){	// 아이디 없음
					 window.location.href = "${pageContext.request.contextPath }/main/main"
				 	}else{				// 아이디 있음
				 	 alert("다시 입력해주세요!")
				 	}
			}
		});
	});
});


function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
//                if(extraAddr !== ''){
//                    extraAddr = ' (' + extraAddr + ')';
//                }
                // 조합된 참고항목을 해당 필드에 넣는다.
//                document.getElementById("sample6_extraAddress").value = extraAddr;

            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}




















</script>
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
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">업체 계정 /</span> 계정 정보</h4>

              <div class="row">
                <div class="col-md-12">
                  <ul class="nav nav-pills flex-column flex-md-row mb-3">
                    <li class="nav-item">
                      <a class="nav-link active" href="${pageContext.request.contextPath }/comp/modify">
                      <i class="bx bx-user me-1"></i> 계정 정보</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="${pageContext.request.contextPath }/comp/passMod">
                      <i class="bx bx-user me-1"></i> 비밀번호 변경</a>
                    </li>

                  </ul>

                  <!-- Account -->
                  <div class="card mb-4">
                    <h5 class="card-header">업체 정보</h5>

                    <hr class="my-0" />
                    <div class="card-body">
                      <form id="formAccountSettings" action="${pageContext.request.contextPath}/comp/modifyPro" method="POST">
                        <div class="row">
                            <input class="form-control form-control-lg" type="hidden" name="compId" id="compId" value="${compDTO.compId}" readonly />
                          <div class="mb-3 col-md-6">
                            <label for="compNm" class="form-label">업체이름</label>
                            <input class="form-control form-control-lg" type="text" name="compNm" id="compNm" value="${compDTO.compNm}" readonly/>
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="compPass" class="form-label">비밀번호</label>
                            <input class="form-control form-control-lg" type="password" name="compPass" id="compPass" />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="compEmail" class="form-label">이메일</label>
                            <input class="form-control form-control-lg" type="email" name="compEmail" id="compEmail" value="${compDTO.compEmail}" readonly />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="compPhone" class="form-label">연락처</label>
                            <input class="form-control form-control-lg" type="text" name="compPhone" id="compPhone" placeholder="012-3456-7890" value="${compDTO.compPhone}"/>
                          </div>
                          <div class="mb-3 col-md-3">
                            <label for="userNicknm" class="form-label">우편번호</label>
                            <input class="form-control form-control-lg" type="text" onclick="sample6_execDaumPostcode()" name="compZipcode" id="sample6_postcode"  value="${compDTO.compZipcode}" />
                          </div>
                          <div class="mb-3 col-md-7">
                            <label for="userNicknm" class="form-label">주소</label>
                            <input class="form-control form-control-lg" type="text" name="compAddress" id="sample6_address"  value="${compDTO.compAddress}" />
                          </div>
                          <div class="mb-3 col-md-2">
                          	<button type="button" class="btn btn-outline-primary me-2" onclick="sample6_execDaumPostcode();" style="margin-top: 1.8rem; height:60%">주소 검색</button>
                          </div>
                          <div class="mb-3 col-md-12">
                            <label for="userNicknm" class="form-label">상세주소</label>
                            <input class="form-control form-control-lg" type="text" name="compDetaddress" id="sample6_detailAddress"  value="${compDTO.compDetaddress}"/>
                          </div>
                        </div>
                        <div class="mt-2">
                          <button type="submit" class="btn btn-primary me-2" >정보 수정</button>
                          <button type="reset" class="btn btn-outline-secondary">취소</button>
                        </div>
                      </form>
                    </div>
                    <!-- /Account -->

                    <!-- 회월탈퇴 -->
                  </div>
                  <div class="card">
                    <h5 class="card-header">업체 탈퇴</h5>
                    <div class="card-body">
                      <div class="mb-3 col-12 mb-0">
                        <div class="alert alert-warning">
                          <h6 class="alert-heading fw-bold mb-1">정말 탈퇴하시겠습니까?</h6>
                          <p class="mb-0">탈퇴하면 다시 되돌릴 수 없어요. 신중하게 결정해주세요!</p>
                        </div>
                      </div>
                      <form id="deleteUser" method="POST">
                        <div class="form-check mb-3">
                          <input
                            class="form-check-input"
                            type="checkbox"
                            id="delCheck"
                          />
                          <label class="form-check-label" for="delCheck">안내사항을 숙지했고 탈퇴를 계속 진행할래요.</label>
                        </div>

                          <div class="mb-3 col-md-4" id="delDiv" style="display: none" >
                            <label for="compPass" class="form-label">비밀번호를 입력하세요</label>
                            <input class="form-control form-control-lg" type="hidden" name="compId1" id="compId1" value="${compDTO.compId}"/>
                            <input class="form-control form-control-lg" type="password" name="compPass1" id="compPass1"/>
                          </div>

                        <button type="button" name="delBtn" id="delBtn" class="btn btn-danger deactivate-account">업체 탈퇴하기</button>
                      </form>
                    </div>
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