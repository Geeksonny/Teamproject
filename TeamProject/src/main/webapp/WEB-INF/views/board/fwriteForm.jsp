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
<input type="hidden" name="userNicknm" value="${sessionScope.userId}" >
<section class="shop spad">
		<div class="container">
            <div class="row">
                    <table class="table table-condensed">
                        <thead>
                            <tr align="center">
                            	 <th width="10%">글 제목 : </th>
                                <th width="100%"><h5><input type="text" name="boardSubject" placeholder="재목" style="width:100%;"></h5></th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr>
                                <td colspan="2">
                                    <p class="mb-4 mt-3"><textarea name="boardContent" rows="10" style="width:100%;"  placeholder="글내용"></textarea></p>

                                </td>
                            </tr>
                            <tr>
                            		<td width="10%">파일</td>
                                	<td width="60%"><input type="file" name="file"></td>
                            </tr>
						<tr><td>비밀번호</td><td><input type="password" name="boardPass"></td></tr>
						<tr><td colspan="2"><input type="submit" value="글쓰기"></td></tr>
                        </tbody>
                    </table>
                 </div>

            <hr/>
            <a href="${pageContext.request.contextPath }/board/list"><button type="button" id="list" class="btn btn-secondary">목록</button></a>
        </div>

    </section>
    </form>
<jsp:include page="../inc/footer.jsp"/>

</body>
</html>
