<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		<div class="container" style="padding-left:10%; padding-right:10%">
            <div class="row">
                    <table class="table table-condensed">
                        <thead>
                            <tr align="center">
                            	 <th style="width:15%; vertical-align:middle">제목  </th>
                                <th width="100%"><h5><input type="text" name="boardSubject" placeholder="제목을 적어주세요" style="width:100%; height:50px; border:none;"></h5></th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr>
                                <td colspan="2">
                                    <p class="mb-4 mt-3"><textarea name="boardContent" rows="10" style="width:100%; border-color:#b2b6b9"  placeholder="내용"></textarea></p>

                                </td>
                            </tr>
                            <tr>
                            		<td width="15%">파일</td>
                                	<td width="60%"><input type="file" name="file"></td>
                            </tr>
						<tr><td>비밀번호</td><td><input type="password" name="boardPass" style="border-top:none; border-left:none; border-right:none; border-color:#b2b6b9; border:1px solid; border-color:#b2b6b9"></td></tr>
                        </tbody>
                    </table>
                 </div>
			<input type="submit" class="site-btn" value="글쓰기">
            <a href="${pageContext.request.contextPath }/board/list"><button type="button" id="list" class="site-btn">목록</button></a>
        </div>

    </section>
    </form>
<jsp:include page="../inc/footer.jsp"/>

</body>
</html>
