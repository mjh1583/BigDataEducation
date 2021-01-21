<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 아이디 오류</title>
	
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="menu.jsp"/>	
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="alert alert-danger">해당 상품이 존재하지 않습니다.</h1>
		</div>
	</div>
	
	<div class="container">
		<!-- 요청 URL을 표시, 요청 파라미터의 값도 같이 표시 -->
		<p><%= request.getRequestURL() %>?<%= request.getQueryString() %></p>
		<p><a href="products.jsp">상품 목록 &raquo;</a></p>
	</div>
</body>
</html>