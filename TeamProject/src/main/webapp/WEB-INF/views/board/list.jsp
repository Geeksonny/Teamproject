<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
.tcol {
	background-color:#000;
}
</style>
<script type="text/javascript"
src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var yn=$({boardNotice}).val();
			if(yn=='1'){
				alert("yn");
				$('.boardTr').addClass("tcol");

			}
	});
</script>
</head>
<body>
<!-- 메뉴단 -->
<jsp:include page="../inc/menu.jsp"/>

    <!-- 헤더단(광고같은 거 들어가도 됨) -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>커뮤니티</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <span>Community</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <form action="${pageContext.request.contextPath }/board/fwrite">
    <input type="hidden" name="userId" value="${sessionScope.userId}" >
    </form>


    <!-- 사이드 메뉴(inc로 빼도 됨) -->
    <section class="shop spad">
        <div class="container">
          <div class="col-lg">
            <div class="row">
                <div class="col-lg-12">
                 <ul class="filter__controls mt-3 mb-5">
				    </ul>
	             <div class="shop__sidebar__search">
	          	</div>
                </div>
            </div>
	       </div>


    <!-- 내용 -->
    <div class="col-lg mb-4">
	<!--     테이블2 table-hover -->
      <div class="table-responsive">
     	    <div class="shop__sidebar__search mb-2 col-3">
            <form action="${pageContext.request.contextPath }/board/list">
	             <input type="text" id="srhText" name="srhText" placeholder="제목, 작성자를 적어주세요">
                 <button type="submit" id="submit" class="search">
                 <span class="icon_search"></span></button>
              </form>
          	</div>
        <table class="table table-hover table">
          <thead>
            <tr>
              <th scope="col">글번호</th>
              <th scope="col">작성자</th>
              <th scope="col">제목</th>
              <th scope="col">등록일</th>
              <th scope="col">조회</th>
              <th scope="col">좋아요</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="boardDTO"  items="${boardList}" >
				<tr id=boardTr class="" style="cursor:pointer;" onClick="location.href='${pageContext.request.contextPath }/board/content?boardNum=${boardDTO.boardNum }&userId=${sessionScope.userId}'">

					<td>${boardDTO.boardNum } <input type="text" id="boardNotice" value="${boardDTO.boardNotice }"></td>
					<td>${boardDTO.userNicknm}</td>
					<td><strong>${boardDTO.boardSubject } </strong><span style="color:#85888d; font-size: 0.8rem;">(${boardDTO.boardRcount})</span></td>
					<td><fmt:formatDate pattern="yy-MM-dd" value="${boardDTO.boardDate }"/></td>
					<td>${boardDTO.boardReadcount }</td>
					<td>${boardDTO.boardLikecount }</td>
				</tr>
			</c:forEach>
          </tbody>

        </table>
        <c:set var="userId" scope="session" value="${sessionScope.userId}"/>
        <c:if test="${userId != null}">

        	<div align="right">
			<a href="${pageContext.request.contextPath }/board/fwrite"><button type="button" class="btn btn-primary" >게시글 작성하기</button></a>
			</div>
        </c:if>

      </div>
  </div>



                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product__pagination">
                               <c:if test="${boardDTO.startPage > boardDTO.pageBlock }">
									<a href="${pageContext.request.contextPath }
									/board/list?pageNum=${boardDTO.startPage - boardDTO.pageBlock}">Prev</a>
									</c:if>

									<c:forEach var="i" begin="${boardDTO.startPage}" end="${boardDTO.endPage }" step="1">
									<a href="${pageContext.request.contextPath }/board/list?pageNum=${i}">${i}</a>
									</c:forEach>

									<c:if test="${boardDTO.endPage < boardDTO.pageCount }">
									<a href="${pageContext.request.contextPath }
									/board/list?pageNum=${boardDTO.startPage + boardDTO.pageBlock}">Next</a>
									</c:if>



                            </div>

                        </div>
                    </div>
                </div>

    </section>
    <!-- Shop Section End -->


    <!-- Footer -->
    <jsp:include page="../inc/footer.jsp"/>
</body>

</html>