<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>

<!DOCTYPE html>
<html>
<!--   lang="en" -->
<!--   class="light-style layout-menu-relative" -->
<!--   dir="ltr" -->
<!--   data-theme="theme-default" -->
<!--   data-assets-path="../assets/" -->
<!--   data-template="vertical-menu-template-free" -->
  <head>
  
  </head>

  <body>

  
  <script type="text/javascript">

  $(function(){

	    $("#addressGetPhone").on('keydown', function(e){
	       // 숫자만 입력받기
	        var trans_num = $(this).val().replace(/-/gi,'');
		var k = e.keyCode;
					
		if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
		{
	  	    e.preventDefault();
		}
	    }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
	        if($(this).val() == '') return;

	        // 기존 번호에서 - 를 삭제합니다.
	        var trans_num = $(this).val().replace(/-/gi,'');
	      
	        // 입력값이 있을때만 실행합니다.
	        if(trans_num != null && trans_num != '')
	        {
	            // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
	            if(trans_num.length==11 || trans_num.length==10) 
	            {   
	                // 유효성 체크
	                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
	                if(regExp_ctn.test(trans_num))
	                {
	                    // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
	                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
	                    $(this).val(trans_num);
	                }
	                else
	                {
	                    alert("유효하지 않은 전화번호 입니다.");
	                    $(this).val("");
	                    $(this).focus();
	                }
	            }
	            else 
	            {
	                alert("유효하지 않은 전화번호 입니다.");
	                $(this).val("");
	                $(this).focus();
	            }
	      }
	  });  
	});
  </script>
  
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
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">주문 /</span> 배송지 관리</h4>

              <div class="row">
                <div class="col-md-12">
                  <ul class="nav nav-pills flex-column flex-md-row mb-3">
                    <li class="nav-item">
                      <a class="nav-link active" href="${pageContext.request.contextPath }/mypage/addr">
                      <i class="bx bx-buildings me-1"></i> 배송지 관리</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="${pageContext.request.contextPath }/mypage/order">
                      <i class="bx bx-detail me-1"></i> 주문 목록</a>
                    </li>
                  </ul>

                  <div class="card mb-4">
                    <h5 class="card-header">배송지 관리</h5>

                    <hr class="my-0" />
                    <div class="card-body">
                    
                    <c:if test="${addressDTO.address ne null }">
										<form name="updateAddress"
						class=form-update
							action="${pageContext.request.contextPath }/order/updateAddressPro"
							method="post" >
					</c:if>
                    
                       <c:if test="${addressDTO.address eq null }">
						<form name="insertAddress" action="${pageContext.request.contextPath }/order/insertAddress" method="post">
						</c:if>
                        <div class="row">
                          <div class="mb-3 col-md-6">
                            <label for="addressGetNm" class="form-label" >받는 분</label>
                            <input class="form-control form-control-lg" type="text" name="addressGetNm" id="addressGetNm" value="${addressDTO.addressGetNm}"/>
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="addressGetPhone" class="form-label"  >연락처</label>
                            <input class="form-control form-control-lg" type="text" name="addressGetPhone" id="addressGetPhone" maxlength="11" value="${addressDTO.addressGetPhone}" />
                          </div>
                          <div class="mb-3 col-md-3">
                            <label for="addressZipcode" class="form-label">우편번호</label>
                            <input class="form-control form-control-lg" type="text" name="addressZipcode" id="addressZipcode"  value="${addressDTO.addressZipcode}" readonly/>
                          </div>
                          <div class="mb-3 col-md-7">
                            <label for="address" class="form-label">주소</label>
                            <input class="form-control form-control-lg" type="text" name="address" id="address"  value="${addressDTO.address}" readonly/>
                          </div>
                          <div class="mb-3 col-md-2">
                          	<button type="button" class="btn btn-outline-primary me-2" onclick="sample6_execDaumPostcode();" style="margin-top: 1.8rem; height:60%">주소 검색</button>
                          </div>
                          <div class="mb-3 col-md-12">
                            <label for="addressDetails" class="form-label">상세주소</label>
                            <input class="form-control form-control-lg" type="text" name="addressDetails" id="addressDetails"  value="${addressDTO.addressDetails}"/>
                          </div>
                        </div>
                        
                        <div class="mt-3" id="mt-3" name="mt-3">
                         <c:if test="${addressDTO.address ne null }">
                          <button type="submit" class="btn btn-primary me-2">배송지 수정</button>
                          <button type="reset" class="btn btn-outline-secondary">취소</button>
                      </form>
                      </c:if>
                      <c:if test="${addressDTO.address eq null }">
                          <button type="submit" class="btn btn-primary me-2">배송지 입력</button>
                          <button type="reset" class="btn btn-outline-secondary">취소</button>
                      </form>
                      </c:if>
                        </div>
                      
                    </div>
            <!-- / Content -->
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
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>



	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('addressZipcode').value = data.zonecode;
							document.getElementById("address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("addressDetails").value = "";
							document.getElementById("addressDetails").focus();
						}
					}).open();
		}
	</script>


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