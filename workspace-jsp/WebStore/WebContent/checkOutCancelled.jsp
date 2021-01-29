<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문 취소</title>
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="menu.jsp"/>	
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 취소</h1>
		</div>
	</div>
	
	<div class="container">
		<h2 class="alert alert-danger">주문이 취소되었습니다.</h2>
	</div>
	
	<div class="container">
		<p><a href="./products.jsp" class="btn btn-secondary">&laquo;상품 목록</a></p>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>

<%
	//주문이 완료되었으니 세션 삭제하고 관련 쿠키도 삭제.
	session.invalidate();

	//모든 쿠키로 설정된 내용을 쿠키배열로 받아옴.
	Cookie[] cookies = request.getCookies();

	for(int i = 0; i < cookies.length; i++) {
		Cookie thisCookie = cookies[i];
		String str = thisCookie.getName();
		
		if(str.equals("Shopping_cartId")) {
			thisCookie.setMaxAge(0);
		}
		if(str.equals("Shopping_name")) {
			thisCookie.setMaxAge(0);
		}
		if(str.equals("Shopping_date")) {
			thisCookie.setMaxAge(0);
		}
		if(str.equals("Shopping_country")) {
			thisCookie.setMaxAge(0);
		}
		if(str.equals("Shopping_zipCode")) {
			thisCookie.setMaxAge(0);
		}
		if(str.equals("Shopping_addressName")) {
			thisCookie.setMaxAge(0);
		}
		
		//변경된 쿠키를 다시 응답 처리 객체에 재추가
		response.addCookie(thisCookie);
	}
%>