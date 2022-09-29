<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<form action="${pageContext.request.contextPath }/board/deletePro" method="post"
enctype="multipart/form-data">
<input type="hidden" name="userNicknm" value="${sessionScope.userId}" >
<input type="hidden" name="userNicknm" value="${boardNum}" >
<section class="shop spad">
		<div class="container" style="padding-left:10%; padding-right:10%">
            <div class="row">
                    <table class="table table-condensed">
                    		
						<tr><td>비밀번호</td><td><input type="password" name="boardPass" style="border-top:none; border-left:none; border-right:none; border-color:#b2b6b9; border:1px solid; border-color:#b2b6b9"></td></tr>
                        </tbody>
                    </table>
                 </div>
			<input type="submit" class="site-btn" value="삭제">
            <a href="${pageContext.request.contextPath }/board/list"><button type="button" id="list" class="site-btn">목록</button></a>
        </div>

    </section>
    </form>
<jsp:include page="../inc/footer.jsp"/>

</body>
</html>
