<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/fwriteForm.jsp</title>
</head>
<body>
<jsp:include page="../inc/menu.jsp"/>

    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>community</h4>
                        <div class="breadcrumb__links">
                            <a href="${pageContext.request.contextPath }/main/main">Home</a>
                            <span>community</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </section>
<form action="${pageContext.request.contextPath }/board/fwritePro" method="post" 
enctype="multipart/form-data">
<table border="1">
<tr><td>닉네임</td><td><input type="text" name="userNicknm" value="${sessionScope.userId }" readonly></td></tr>
<tr><td>제목</td><td><input type="text" name="boardSubject"></td></tr>
<tr><td>파일</td><td><input type="file" name="file"></td></tr>
<tr><td>내용</td>
    <td><textarea name="boardContent" rows="10" cols="20"></textarea></td></tr>
<tr><td>게시판 비밀번호</td><td><input type="password" name="boardPass"></td></tr>
<tr><td colspan="2"><input type="submit" value="글쓰기"></td></tr>
</table>
<a href="${pageContext.request.contextPath }/board/list">글목록</a>
<!-- Footer Section Begin -->
<jsp:include page="../inc/footer.jsp"/>
</form>
</body>
</html>

