<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript"
src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

$(document).ready(function(){
var yn= $('#boardNotice');

if(yn.value=='1'){
   $('#boardTr').addClass("tcol");

}
});

</script>

<style>
.tcol {
	background-color:#e6f9f3;
}
</style>
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
                            <a href="./index.html">메인</a>
                            <span>커뮤니티</span>
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
              <th scope="col" style="text-align:center; width:10%">번호</th>
              <th scope="col" style="text-align:center; width:55%">제목</th>
              <th scope="col" style="text-align:center; ">작성자</th>
              <th scope="col" style="text-align:center; ">등록일</th>
              <th scope="col" style="text-align:center; ">조회</th>
              <th scope="col" style="text-align:center; ">좋아요</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="boardDTO"  items="${boardList}" >
				<tr id="boardTr" style="cursor:pointer;" onClick="location.href='${pageContext.request.contextPath }/board/content?boardNum=${boardDTO.boardNum }&userId=${sessionScope.userId}'">

					<td style="text-align:center; width:10%">${boardDTO.boardNum }<input type="text" id="boardNotice" value="${boardDTO.boardNotice }" name="boardNotice" hidden></td>
					<td style="width:55%; padding-left:3%"><strong>${boardDTO.boardSubject } </strong><span style="color:#85888d; font-size: 0.8rem;">(${boardDTO.boardRcount})</span></td>
					<td style="text-align:center; ">${boardDTO.userNicknm}</td>
					<td style="text-align:center; "><fmt:formatDate pattern="yy-MM-dd" value="${boardDTO.boardDate }"/></td>
					<td style="text-align:center; ">${boardDTO.boardReadcount }</td>
					<td style="text-align:center; ">${boardDTO.boardLikecount }</td>
				</tr>
			</c:forEach>
          </tbody>

        </table>
        <c:set var="userId" scope="session" value="${sessionScope.userId}"/>
        <c:if test="${userId != null}">

        	<div align="right">
			<a href="${pageContext.request.contextPath }/board/fwrite"><button type="button" class="site-btn" >게시글 작성하기</button></a>
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