<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp5/updateForm.jsp</title>
</head>
<body>
<form action="${pageContext.request.contextPath }/board/updatePro" method="post" enctype="multipart/form-data">
<input type="hidden" name="userNicknm" value="${sessionScope.userId}">
<input type="hidden" name="boardNum" value="${boardDTO.boardNum }">
<table border="1">
<tr><td>글쓴이</td><td><input type="text" name="userNicknm" value="${boardDTO.userNicknm }" readonly></td></tr>
<tr><td>제목</td>
    <td><input type="text" name="boardSubject" value="${boardDTO.boardSubject }"></td></tr>
<tr><td>파일</td><td><input type="file" name="file">${boardDTO.boardFile }
<input type="hidden" name="oldfile" value="${boardDTO.boardFile }"></td></tr>
<tr><td>내용</td>
    <td><textarea name="boardContent" rows="10" cols="20">${boardDTO.boardContent }</textarea></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="boardPass"></td></tr>
<tr><td colspan="2"><input type="submit" value="글수정"></td></tr>
</table>
</form>

</body>
</html>