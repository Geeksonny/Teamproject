<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/content.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Bootstrap 4</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style type="text/css">
	table {
  border-collapse: separate;
  border-spacing: 0 10px;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#pic').click(function(){
		$.ajax({
			type : 'POST', 
			url:'${pageContext.request.contextPath}/board/likeinset',
			data:{'boardNum' : $('#boardNum').val()},
			/* dataType : 'text', */
			success:function(rdata){
				var result = "${pageContext.request.contextPath }/resources/img/icon/"+rdata;
				$("#pic").attr("src", result);
			}
		});
	});
});

</script>
</head>
<body>



<!-- http://localhost:8080/JspProject/jsp5/content.jsp?num=1 -->
<%
// model.addAttribute("boardDTO", boardDTO);
	%>
	<!-- 메뉴단 -->
<jsp:include page="../inc/menu.jsp"/>
	 <section class="breadcrumb-option">
        <div class="container">
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
    <!-- 사이드 메뉴(inc로 빼도 됨) -->
    <section class="shop spad">
		<<div class="container" style="padding-left:5%; padding-right:5%">
            <div class="row">
                    <table class="table table-condensed">
                        <thead>
                            <tr align="center">
                                <th width="10%">${boardDTO2.boardNum }</th>
                                <th width="60%"><h5><strong>${boardDTO2.boardSubject }</strong></h5></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="color:#88939f;">작성일
                                </td>
                                <td style="color:#88939f;">
                               		${boardDTO2.boardDate }<span style='float:right'>조회 <span style="color:#495057;"><strong>${boardDTO2.boardReadcount }</strong></span></span>
                                </td>
                            </tr>
                            <tr>
                                <td style="color:#88939f;">
                                작성자
                                </td>
                                <td style="color:#88939f;">
                                	${boardDTO2.userNicknm} <span style='float:right'>좋아요 <span style="color:#495057;"><strong> ${boardDTO2.boardLikecount}</strong></span></span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <p class="mb-4 mt-3">${boardDTO2.boardContent }</p>

                                </td>
                            </tr>
                            <tr>
                            		<td width="10%" style="color:#88939f;">이미지</td>
                                	<td width="60%"><img src="${pageContext.request.contextPath }/resources/upload/${boardDTO2.boardFile}" style="max-width: 30%; height: auto;" ></td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="hidden" id="boardNum" name="boardNum" value="${boardDTO2.boardNum}"></input>
	               <input type="image" id="pic" src="${pageContext.request.contextPath }/resources/img/icon/${boardDTO2.heart}">
                    <table class="table table-striped" >
               <c:forEach items="${replyList}" var="replyDTO">
				<!-- 댓글 테이블 -->
                   		 <tr>
                   		 		<input type="hidden" name="rNum" value="${replyDTO.rNum}">
                            	<th width="5%" style="text-align:right;">${replyDTO.userId}</th>
                                <td width="60%">${replyDTO.rContent } <span style='float:right'>${replyDTO.rDate}</span>
                                <td width="5%" style="text-align:width;">
                                  <c:set var="userId" scope="session" value="${sessionScope.userId}" />
								  <c:set var="rId" target="${replyList}" scope="request" value="${replyDTO.userId}" />
								  <c:if test="${userId == rId}">
                                	<a onclick="location.href='${pageContext.request.contextPath }/board/rdeletePro?boardNum=${boardDTO.boardNum}&rNum=${replyDTO.rNum}'" style="cursor:pointer;">삭제</a>
                                  </c:if>
                                </td>
                         </tr>
                </c:forEach>
                    </table>
			<!-- 댓글 작성 -->
				<form name="comment-form" action="${pageContext.request.contextPath }/board/isnertPro" method="post" autocomplete="off">

                    <table class="table table-condensed">
                        <tr>
                            <td>
                                <span class="form-inline mt-2" role="form">
                                		<h5>댓글</h5></span>
                                		<input type="hidden" name="boardNum" value="${boardDTO2.boardNum}">
                                        <textarea id="commentParentText" name="rContent" class="form-control col-lg-12 mt-3" style="width:100%" rows="4" cols="180"></textarea><br>
                                        <button type="submit" class="site-btn">댓글 등록</button>
                            </td>
                        </tr>
                    </table>
                    </form>
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <td>
                                    <span style='float:right'>
                                        <a href="${pageContext.request.contextPath }/board/list"><button type="button" id="list" class="btn btn-secondary">목록</button></a>
                                        <button type="button" id="modify" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath }/board/update?boardNum=${boardDTO2.boardNum }'">수정</button>
                                        <button type="button" id="delete" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath }/board/delete?boardNum=${boardDTO2.boardNum }'">삭제</button>
                                    </span>
                                </td>
                            </tr>
                        </thead>
                    </table>
            </div>
        </div>

    </section>

<!-- Footer Section Begin -->
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>